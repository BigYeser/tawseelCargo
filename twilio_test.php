<?php
require_once 'helpers/src/src/Twilio/autoload.php';
use Twilio\Rest\Client;

$sid    = "AC4021a82e9303879805e55b083a2e2615"; 
$token  = "[cca094e1558954478162e571affe20f8]"; 
$twilio = new Client($sid, $token); 
 
$message = $twilio->messages 
                  ->create("whatsapp:+971501743345", // to 
                           array( 
                               "from" => "whatsapp:+14155238886",       
                               "body" => "Your Yummy Cupcakes Company order of 1 dozen frosted cupcakes has shipped and should be delivered on July 10, 2019. Details: http://www.yummycupcakes.com/" 
                           ) 
                  ); 
 
print($message->sid);