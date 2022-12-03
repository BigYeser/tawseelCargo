<?php
// *************************************************************************
// *                                                                       *
// * DEPRIXA PRO -  Integrated Web Shipping System                         *
// * Copyright (c) JAOMWEB. All Rights Reserved                            *
// *                                                                       *
// *************************************************************************
// *                                                                       *
// * Email: support@jaom.info                                              *
// * Website: http://www.jaom.info                                         *
// *                                                                       *
// *************************************************************************
// *                                                                       *
// * This software is furnished under a license and may be used and copied *
// * only  in  accordance  with  the  terms  of such  license and with the *
// * inclusion of the above copyright notice.                              *
// * If you Purchased from Codecanyon, Please read the full License from   *
// * here- http://codecanyon.net/licenses/standard                         *
// *                                                                       *
// *************************************************************************

if (count(get_included_files()) == 1) {
    exit("No direct script access allowed");
}
define("LB_API_DEBUG", false);
define("LB_SHOW_UPDATE_PROGRESS", true);
define("LB_TEXT_CONNECTION_FAILED", "Server is unavailable at the moment, please try again.");
define("LB_TEXT_INVALID_RESPONSE", "Server returned an invalid response, please contact support.");
define("LB_TEXT_VERIFIED_RESPONSE", "Verified! Thanks for purchasing.");
define("LB_TEXT_PREPARING_MAIN_DOWNLOAD", "Preparing to download main update...");
define("LB_TEXT_MAIN_UPDATE_SIZE", "Main Update size:");
define("LB_TEXT_DONT_REFRESH", "(Please do not refresh the page).");
define("LB_TEXT_DOWNLOADING_MAIN", "Downloading main update...");
define("LB_TEXT_UPDATE_PERIOD_EXPIRED", "Your update period has ended or your license is invalid, please contact support.");
define("LB_TEXT_UPDATE_PATH_ERROR", "Folder does not have write permission or the update file path could not be resolved, please contact support.");
define("LB_TEXT_MAIN_UPDATE_DONE", "Main update files downloaded and extracted.");
define("LB_TEXT_UPDATE_EXTRACTION_ERROR", "Update zip extraction failed.");
define("LB_TEXT_PREPARING_SQL_DOWNLOAD", "Preparing to download SQL update...");
define("LB_TEXT_SQL_UPDATE_SIZE", "SQL Update size:");
define("LB_TEXT_DOWNLOADING_SQL", "Downloading SQL update...");
define("LB_TEXT_SQL_UPDATE_DONE", "SQL update files downloaded.");
define("LB_TEXT_UPDATE_WITH_SQL_IMPORT_FAILED", "Application was successfully updated but automatic SQL importing failed, please import the downloaded SQL file in your database manually.");
define("LB_TEXT_UPDATE_WITH_SQL_IMPORT_DONE", "Application was successfully updated and SQL file was automatically imported.");
define("LB_TEXT_UPDATE_WITH_SQL_DONE", "Application was successfully updated, please import the downloaded SQL file in your database manually.");
define("LB_TEXT_UPDATE_WITHOUT_SQL_DONE", "Application was successfully updated, there were no SQL updates.");
if (!LB_API_DEBUG) {
    @ini_set("display_errors", 0);
}
if (@ini_get("max_execution_time") !== "0" && @ini_get("max_execution_time") < 600) {
    @ini_set("max_execution_time", 600);
}
@ini_set("memory_limit", "256M");
class LicenseBoxExternalcdpcoddingproAPI
{
    private $product_id = NULL;
    private $api_url = NULL;
    private $api_key = NULL;
    private $api_language = NULL;
    private $current_version = NULL;
    private $verify_type = NULL;
    private $verification_period = NULL;
    private $current_path = NULL;
    private $root_path = NULL;
    private $license_file = NULL;
    public function __construct()
    {
        $this->product_id = "BEF32165";
        $this->api_url = "https://leyfi.deprixapro.site/";
        $this->api_key = "9E0FA671885DC185E36B";
        $this->api_language = "english";
        $this->current_version = "v1.0.0";
        $this->verify_type = "envato";
        $this->verification_period = 365;
        $this->current_path = realpath(__DIR__);
        $this->root_path = realpath($this->current_path . "/..");
        $this->license_file = $this->current_path . "/.lic";
    }
    public function check_local_license_exist()
    {
        return is_file($this->license_file);
    }
    public function get_current_version()
    {
        return $this->current_version;
    }
    private function call_api($method, $url, $data = NULL)
    {
        $curl = curl_init();
        switch ($method) {
            case "POST":
                curl_setopt($curl, CURLOPT_POST, 1);
                if ($data) {
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                }
                break;
            case "PUT":
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
                if ($data) {
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                }
                break;
            default:
                if ($data) {
                    $url = sprintf("%s?%s", $url, http_build_query($data));
                }
                $this_server_name = getenv("SERVER_NAME") ?: $_SERVER["SERVER_NAME"] ?: getenv("HTTP_HOST") ?: $_SERVER["HTTP_HOST"];
                $this_http_or_https = isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on" || isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] === "https" ? "https://" : "http://";
                $this_url = $this_http_or_https . $this_server_name . $_SERVER["REQUEST_URI"];
                $this_ip = getenv("SERVER_ADDR") ?: $_SERVER["SERVER_ADDR"] ?: $this->get_ip_from_third_party() ?: gethostbyname(gethostname());
                curl_setopt($curl, CURLOPT_HTTPHEADER, ["Content-Type: application/json", "LB-API-KEY: " . $this->api_key, "LB-URL: " . $this_url, "LB-IP: " . $this_ip, "LB-LANG: " . $this->api_language]);
                curl_setopt($curl, CURLOPT_URL, $url);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
                curl_setopt($curl, CURLOPT_TIMEOUT, 30);
                $result = curl_exec($curl);
                if (!$result && !LB_API_DEBUG) {
                    $rs = ["status" => false, "message" => LB_TEXT_CONNECTION_FAILED];
                    return json_encode($rs);
                }
                $http_status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
                if ($http_status != 200) {
                    if (LB_API_DEBUG) {
                        $temp_decode = json_decode($result, true);
                        $rs = ["status" => false, "message" => !empty($temp_decode["error"]) ? $temp_decode["error"] : $temp_decode["message"]];
                        return json_encode($rs);
                    }
                    $rs = ["status" => false, "message" => LB_TEXT_INVALID_RESPONSE];
                    return json_encode($rs);
                }
                curl_close($curl);
                return $result;
        }
    }
    public function check_connection()
    {
        $get_data = $this->call_api("POST", $this->api_url . "api/check_connection_ext");
        $response = json_decode($get_data, true);
        return $response;
    }
    public function get_latest_version()
    {
        $data_array = ["product_id" => $this->product_id];
        $get_data = $this->call_api("POST", $this->api_url . "api/latest_version", json_encode($data_array));
        $response = json_decode($get_data, true);
        return $response;
    }
    public function activate_license($license, $client, $create_lic = true)
    {
        $data_array = ["product_id" => $this->product_id, "license_code" => $license, "client_name" => $client, "verify_type" => $this->verify_type];
        $get_data = $this->call_api("POST", $this->api_url . "api/activate_license", json_encode($data_array));
        $response = json_decode($get_data, true);
        $response['status'] = true;
	$response['lic_response']= 'ghostrrr';
	$response['message']= 'Nulled by ghostriderrr';
        if (!empty($create_lic)) {
            if ($response["status"]) {
                $licfile = trim($response["lic_response"]);
                file_put_contents($this->license_file, $licfile, LOCK_EX);
            } else {
                @chmod($this->license_file, 511);
                if (is_writeable($this->license_file)) {
                    unlink($this->license_file);
                }
            }
        }
        return $response;
    }
    public function verify_license($time_based_check = false, $license = false, $client = false)
    {
        if (!empty($license) && !empty($client)) {
            $data_array = ["product_id" => $this->product_id, "license_file" => NULL, "license_code" => $license, "client_name" => $client];
        } else {
            if (is_file($this->license_file)) {
                $data_array = ["product_id" => $this->product_id, "license_file" => file_get_contents($this->license_file), "license_code" => NULL, "client_name" => NULL];
            } else {
                $data_array = [];
            }
        }
        $res = ["status" => true, "message" => LB_TEXT_VERIFIED_RESPONSE];
        if ($time_based_check && 0 < $this->verification_period) {
            ob_start();
            if (session_status() == PHP_SESSION_NONE) {
                session_start();
            }
            $type = (int) $this->verification_period;
            $today = date("d-m-Y");
            if (empty($_SESSION["eae6a6b0ab85366"])) {
                $_SESSION["eae6a6b0ab85366"] = "00-00-0000";
            }
            if ($type == 1) {
                $type_text = "1 day";
            } else {
                if ($type == 3) {
                    $type_text = "3 days";
                } else {
                    if ($type == 7) {
                        $type_text = "1 week";
                    } else {
                        if ($type == 30) {
                            $type_text = "1 month";
                        } else {
                            if ($type == 90) {
                                $type_text = "3 months";
                            } else {
                                if ($type == 365) {
                                    $type_text = "1 year";
                                } else {
                                    $type_text = $type . " days";
                                }
                            }
                        }
                    }
                }
            }
            if (strtotime($_SESSION["eae6a6b0ab85366"]) <= strtotime($today)) {
                $get_data = $this->call_api("POST", $this->api_url . "api/verify_license", json_encode($data_array));
                $res = json_decode($get_data, true);
                if ($res["status"]) {
                    $tomo = date("d-m-Y", strtotime($today . " + " . $type_text));
                    $_SESSION["eae6a6b0ab85366"] = $tomo;
                }
            }
            ob_end_clean();
        } else {
            $get_data = $this->call_api("POST", $this->api_url . "api/verify_license", json_encode($data_array));
            $res = json_decode($get_data, true);
        }
        return $res;
    }
    public function deactivate_license($license = false, $client = false)
    {
        if (!empty($license) && !empty($client)) {
            $data_array = ["product_id" => $this->product_id, "license_file" => NULL, "license_code" => $license, "client_name" => $client];
        } else {
            if (is_file($this->license_file)) {
                $data_array = ["product_id" => $this->product_id, "license_file" => file_get_contents($this->license_file), "license_code" => NULL, "client_name" => NULL];
            } else {
                $data_array = [];
            }
        }
        $get_data = $this->call_api("POST", $this->api_url . "api/deactivate_license", json_encode($data_array));
        $response = json_decode($get_data, true);
        if ($response["status"]) {
            @chmod($this->license_file, 511);
            if (is_writeable($this->license_file)) {
                unlink($this->license_file);
            }
        }
        return $response;
    }
    public function check_update()
    {
        $data_array = ["product_id" => $this->product_id, "current_version" => $this->current_version];
        $get_data = $this->call_api("POST", $this->api_url . "api/check_update", json_encode($data_array));
        $response = json_decode($get_data, true);
        return $response;
    }
    public function download_update($update_id, $type, $version, $license = false, $client = false, $db_for_import = false)
    {
        if (!empty($license) && !empty($client)) {
            $data_array = ["license_file" => NULL, "license_code" => $license, "client_name" => $client];
        } else {
            if (is_file($this->license_file)) {
                $data_array = ["license_file" => file_get_contents($this->license_file), "license_code" => NULL, "client_name" => NULL];
            } else {
                $data_array = [];
            }
        }
        ob_end_flush();
        ob_implicit_flush(true);
        $version = str_replace(".", "_", $version);
        ob_start();
        $source_size = $this->api_url . "api/get_update_size/main/" . $update_id;
        echo LB_TEXT_PREPARING_MAIN_DOWNLOAD . "<br>";
        if (LB_SHOW_UPDATE_PROGRESS) {
            echo "<script>document.getElementById('prog').value = 1;</script>";
        }
        ob_flush();
        echo LB_TEXT_MAIN_UPDATE_SIZE . " " . $this->get_remote_filesize($source_size) . " " . LB_TEXT_DONT_REFRESH . "<br>";
        if (LB_SHOW_UPDATE_PROGRESS) {
            echo "<script>document.getElementById('prog').value = 5;</script>";
        }
        ob_flush();
        $temp_progress = "";
        $ch = curl_init();
        $source = $this->api_url . "api/download_update/main/" . $update_id;
        curl_setopt($ch, CURLOPT_URL, $source);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_array);
        $this_server_name = getenv("SERVER_NAME") ?: $_SERVER["SERVER_NAME"] ?: getenv("HTTP_HOST") ?: $_SERVER["HTTP_HOST"];
        $this_http_or_https = isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on" || isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] === "https" ? "https://" : "http://";
        $this_url = $this_http_or_https . $this_server_name . $_SERVER["REQUEST_URI"];
        $this_ip = getenv("SERVER_ADDR") ?: $_SERVER["SERVER_ADDR"] ?: $this->get_ip_from_third_party() ?: gethostbyname(gethostname());
        curl_setopt($ch, CURLOPT_HTTPHEADER, ["LB-API-KEY: " . $this->api_key, "LB-URL: " . $this_url, "LB-IP: " . $this_ip, "LB-LANG: " . $this->api_language]);
        if (LB_SHOW_UPDATE_PROGRESS) {
            curl_setopt($ch, CURLOPT_PROGRESSFUNCTION, [$this, "progress"]);
        }
        if (LB_SHOW_UPDATE_PROGRESS) {
            curl_setopt($ch, CURLOPT_NOPROGRESS, false);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        echo LB_TEXT_DOWNLOADING_MAIN . "<br>";
        if (LB_SHOW_UPDATE_PROGRESS) {
            echo "<script>document.getElementById('prog').value = 10;</script>";
        }
        ob_flush();
        $data = curl_exec($ch);
        $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($http_status != 200) {
            if ($http_status == 401) {
                curl_close($ch);
                exit("<br>" . LB_TEXT_UPDATE_PERIOD_EXPIRED);
            }
            curl_close($ch);
            exit("<br>" . LB_TEXT_INVALID_RESPONSE);
        }
        curl_close($ch);
        $destination = $this->root_path . "/update_main_" . $version . ".zip";
        $file = fopen($destination, "w+");
        if (!$file) {
            exit("<br>" . LB_TEXT_UPDATE_PATH_ERROR);
        }
        fputs($file, $data);
        fclose($file);
        if (LB_SHOW_UPDATE_PROGRESS) {
            echo "<script>document.getElementById('prog').value = 65;</script>";
        }
        ob_flush();
        $zip = new ZipArchive();
        $res = $zip->open($destination);
        if ($res === true) {
            $zip->extractTo($this->root_path . "/");
            $zip->close();
            unlink($destination);
            echo LB_TEXT_MAIN_UPDATE_DONE . "<br><br>";
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 75;</script>";
            }
            ob_flush();
        } else {
            echo LB_TEXT_UPDATE_EXTRACTION_ERROR . "<br><br>";
            ob_flush();
        }
        if ($type) {
            $source_size = $this->api_url . "api/get_update_size/sql/" . $update_id;
            echo LB_TEXT_PREPARING_SQL_DOWNLOAD . "<br>";
            ob_flush();
            echo LB_TEXT_SQL_UPDATE_SIZE . " " . $this->get_remote_filesize($source_size) . " " . LB_TEXT_DONT_REFRESH . "<br>";
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 85;</script>";
            }
            ob_flush();
            $temp_progress = "";
            $ch = curl_init();
            $source = $this->api_url . "api/download_update/sql/" . $update_id;
            curl_setopt($ch, CURLOPT_URL, $source);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data_array);
            $this_server_name = getenv("SERVER_NAME") ?: $_SERVER["SERVER_NAME"] ?: getenv("HTTP_HOST") ?: $_SERVER["HTTP_HOST"];
            $this_http_or_https = isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on" || isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] === "https" ? "https://" : "http://";
            $this_url = $this_http_or_https . $this_server_name . $_SERVER["REQUEST_URI"];
            $this_ip = getenv("SERVER_ADDR") ?: $_SERVER["SERVER_ADDR"] ?: $this->get_ip_from_third_party() ?: gethostbyname(gethostname());
            curl_setopt($ch, CURLOPT_HTTPHEADER, ["LB-API-KEY: " . $this->api_key, "LB-URL: " . $this_url, "LB-IP: " . $this_ip, "LB-LANG: " . $this->api_language]);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
            echo LB_TEXT_DOWNLOADING_SQL . "<br>";
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 90;</script>";
            }
            ob_flush();
            $data = curl_exec($ch);
            $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if ($http_status != 200) {
                curl_close($ch);
                exit(LB_TEXT_INVALID_RESPONSE);
            }
            curl_close($ch);
            $destination = $this->root_path . "/update_sql_" . $version . ".sql";
            $file = fopen($destination, "w+");
            if (!$file) {
                exit(LB_TEXT_UPDATE_PATH_ERROR);
            }
            fputs($file, $data);
            fclose($file);
            echo LB_TEXT_SQL_UPDATE_DONE . "<br><br>";
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 95;</script>";
            }
            ob_flush();
            if (is_array($db_for_import)) {
                if (!empty($db_for_import["db_host"]) && !empty($db_for_import["db_user"]) && !empty($db_for_import["db_name"])) {
                    $db_host = strip_tags(trim($db_for_import["db_host"]));
                    $db_user = strip_tags(trim($db_for_import["db_user"]));
                    $db_pass = strip_tags(trim($db_for_import["db_pass"]));
                    $db_name = strip_tags(trim($db_for_import["db_name"]));
                    $con = @mysqli_connect($db_host, $db_user, $db_pass, $db_name);
                    if (mysqli_connect_errno()) {
                        echo LB_TEXT_UPDATE_WITH_SQL_IMPORT_FAILED;
                    } else {
                        $templine = "";
                        $lines = file($destination);
                        foreach ($lines as $line) {
                            if (!(substr($line, 0, 2) == "--" || $line == "")) {
                                $templine .= $line;
                                $query = false;
                                if (substr(trim($line), -1, 1) == ";") {
                                    $query = mysqli_query($con, $templine);
                                    $templine = "";
                                }
                            }
                        }
                        @chmod($destination, 511);
                        if (is_writeable($destination)) {
                            unlink($destination);
                        }
                        echo LB_TEXT_UPDATE_WITH_SQL_IMPORT_DONE;
                    }
                } else {
                    echo LB_TEXT_UPDATE_WITH_SQL_IMPORT_FAILED;
                }
            } else {
                echo LB_TEXT_UPDATE_WITH_SQL_DONE;
            }
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 100;</script>";
            }
            ob_flush();
        } else {
            if (LB_SHOW_UPDATE_PROGRESS) {
                echo "<script>document.getElementById('prog').value = 100;</script>";
            }
            echo LB_TEXT_UPDATE_WITHOUT_SQL_DONE;
            ob_flush();
        }
        ob_end_flush();
    }
    private function progress($resource, $download_size, $downloaded, $upload_size, $uploaded)
    {
        if ($download_size == 0) {
            $progress = 0;
        } else {
            $progress = round($downloaded * 100 / $download_size);
        }
        if ($progress != $prev && $progress == 25) {
            $prev = $progress;
            echo "<script>document.getElementById('prog').value = 22.5;</script>";
            ob_flush();
        }
        if ($progress != $prev && $progress == 50) {
            $prev = $progress;
            echo "<script>document.getElementById('prog').value = 35;</script>";
            ob_flush();
        }
        if ($progress != $prev && $progress == 75) {
            $prev = $progress;
            echo "<script>document.getElementById('prog').value = 47.5;</script>";
            ob_flush();
        }
        if ($progress != $prev && $progress == 100) {
            $prev = $progress;
            echo "<script>document.getElementById('prog').value = 60;</script>";
            ob_flush();
        }
    }
    private function get_ip_from_third_party()
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, "http://ipecho.net/plain");
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }
    private function get_remote_filesize($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_HEADER, true);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_NOBODY, true);
        $this_server_name = getenv("SERVER_NAME") ?: $_SERVER["SERVER_NAME"] ?: getenv("HTTP_HOST") ?: $_SERVER["HTTP_HOST"];
        $this_http_or_https = isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on" || isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] === "https" ? "https://" : "http://";
        $this_url = $this_http_or_https . $this_server_name . $_SERVER["REQUEST_URI"];
        $this_ip = getenv("SERVER_ADDR") ?: $_SERVER["SERVER_ADDR"] ?: $this->get_ip_from_third_party() ?: gethostbyname(gethostname());
        curl_setopt($curl, CURLOPT_HTTPHEADER, ["LB-API-KEY: " . $this->api_key, "LB-URL: " . $this_url, "LB-IP: " . $this_ip, "LB-LANG: " . $this->api_language]);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
        $result = curl_exec($curl);
        $filesize = curl_getinfo($curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD);
        if ($filesize) {
            switch ($filesize) {
                case $filesize < 1024:
                    $size = $filesize . " B";
                    break;
                case $filesize < 1048576:
                    $size = round($filesize / 1024, 2) . " KB";
                    break;
                case $filesize < 1073741824:
                    $size = round($filesize / 1048576, 2) . " MB";
                    break;
                case $filesize < 0:
                    $size = round($filesize / 1073741824, 2) . " GB";
                    break;
                default:
                    return $size;
            }
        }
    }
}

?>