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

if (!function_exists("xs5wohkrfju1ffmcfvl238a5")) {
    function xs5wohkrfju1ffmcfvl238a5($do_only_periodic_checks = false)
    {
      
    }
}
function cdp_sumardias($fecha, $dias)
{
    $nuevafecha = strtotime($dias . " day", strtotime($fecha));
    $nuevafecha = date("Y-m-d", $nuevafecha);
    return $nuevafecha;
}
function formato($valor)
{
    return number_format($valor, 2, ".", ",");
}
function cdp_getChecked($row, $status)
{
    if ($row == $status) {
        echo "checked=\"checked\"";
    }
}
function cdp_userStatus($status, $id)
{
    
    $display = $status;
    switch ($status) {
        case 1:
            $display = "<span style=\"font-size:15px;color:#48CFAD;\" class=\"ti-check\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Active\"></span> Active";
            break;
        case 0:
            $display = "<a style=\"font-size:15px;color:orange;\" class=\"activate\" id=\"act_" . $id . "\"><i class=\"icon-adjust text-orange\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Inactive\"></i> Inactive</a>";
            break;
        default:
            return $display;
    }
    return $display;
}
function cdp_paymentStatus($status, $id)
{
    $display = $status;
    switch ($status) {
        case 1:
            $display = "<span style=\"font-size:15px;color:#48CFAD;\" class=\"ti-check\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Active\"></span> Active";
            break;
        case 0:
            $display = "<a style=\"font-size:15px;color:orange;\" class=\"activate\" id=\"act_" . $id . "\"><i class=\"icon-adjust text-orange\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Inactive\"></i> Inactive</a>";
            break;
        default:
            return $display;
    }
        $display = $status;
        return $display;

}
function cdp_isAdmin($userlevel)
{
    $display = $userlevel;
    switch ($userlevel) {
        case 9:
            $display = "<span style=\"font-size:20px;color:red;\" class=\"ti-user\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Super Admin\"></span>";
            break;
        case 7:
            $display = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Level 7\"></span>";
            break;
        case 6:
            ${$display} = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Level 6\"></span>";
            break;
        case 5:
            $display = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Level 5\"></span>";
            break;
        case 4:
            ${$display} = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Level 4\"></span>";
            break;
        case 3:
            $display = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Driver\"></span>";
            break;
        case 2:
            $display = "<span style=\"font-size:20px;color:#FFB973;\" class=\"ti-user\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Employee\"></span>";
            break;
        case 1:
            $display = "<span style=\"font-size:20px;color:#48CFAD;\" class=\"ti-face-smile\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"User Customer\"></span>";
            break;
        default:
            return $display;
    }
    return $display;
}
function cdp_generarCodigo($longitud)
{
    $key = "";
    $pattern = "1234567890";
    $max = strlen($pattern) - 1;
    for ($i = 0; $i < $longitud; $i++) {
        $key .= $pattern[mt_rand(0, $max)];
    }
    return $key;
}
function cdp_cleanOut($text)
{
    $text = strtr($text, ["\\r\\n" => "", "\\r" => "", "\\n" => ""]);
    $text = html_entity_decode($text, ENT_QUOTES, "UTF-8");
    $text = str_replace("<br>", "<br />", $text);
    return stripslashes($text);
}
function cdp_email_users_notifications($array)
{
    $email = "";
    for ($contador = 0; $contador < count($array); $contador++) {
        $email .= $array[$contador] . ",";
    }
    $email = substr($email, 0, -1);
    return $email;
}
function getSize($size, $precision = 2, $long_name = false, $real_size = true)
{
    if ($size == 0) {
        return "-/-";
    }
    $base = $real_size ? 1024 : 1000;
    for ($pos = 0; $base < $size; $pos++) {
        $size /= $base;
    }
    $prefix = _getSizePrefix($pos);
    $size_name = $long_name ? $prefix . "bytes" : $prefix[0] . "B";
    return round($size, $precision) . " " . ucfirst($size_name);
}
function _getSizePrefix($pos)
{
    switch ($pos) {
        case 0:
            return "";
            break;
        case 1:
            return "kilo";
            break;
        case 2:
            return "mega";
            break;
        case 3:
            return "giga";
            break;
        default:
            return "?-";
    }
}
function cdp_round_out($valor)
{
    $float_redondeado = round($valor * 100) / 100;
    return $float_redondeado;
}

?>