
<?php
require '../vendor/autoload.php';
require '../app/init.php';






$smmapi   = new SMMApi();
$link = $_SERVER['HTTP_HOST'];

$url = "https://$link/crons/orders.php";
 $order    = $smmapi->action(array('action' =>"0"), $url);
$url = "https://$link/crons/refill.php";
 $order    = $smmapi->action(array('action' =>"0"), $url);
$url = "https://$link/crons/average.php";
 $order    = $smmapi->action(array('action' =>"0"), $url);

echo "Done";


