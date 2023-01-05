<?php
require_once 'helpers/src/src/Twilio/autoload.php';
use Twilio\Rest\Client;

    $phone_sender = "+971501743345";
    $sid    = "AC4021a82e9303879805e55b083a2e2615";
    $token  = "f734ab8e186cd07eeda02e3af27e13d4";
    try {
        $twilio = new Client($sid, $token);
        $message = $twilio->messages
            ->create(
                "whatsapp:" . $phone_sender, // to 
                array(
                    "from" => "whatsapp:+971558982170",
                    "body" => "a new shipment has been registered, *Tracking #$fullshipment* Follow up on your package by entering the following link and you will have detailed information on the status of your packages "
                )
            );
        // echo '<script>console.log("message");</script>';
        // echo '<script>console.log("'.$message.'");</script>';
    } catch (Exception $e) {
        echo json_encode($e);
        // echo '<script>console.log("whatsapp");</script>';
        // echo '<script>console.log("'.$e.'");</script>';
    }