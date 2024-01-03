<?php

require '../vendor/autoload.php';
require '../app/init.php';
$smmapi   = new SMMApi();
$orders = $conn->prepare("SELECT * FROM settings 
  WHERE id=:id  ");
$orders->execute(array("id"=>"1"));
$orders = $orders->fetchAll(PDO::FETCH_ASSOC);
$row = $conn->query("SELECT * FROM orders ORDER BY order_id DESC LIMIT 1 ")->fetch(PDO::FETCH_ASSOC);
 
  foreach( $orders as $order ):

                         $update= $conn->prepare("UPDATE orders SET order_id=:order WHERE order_increase=:id ");
        $update2= $update->execute(array("order"=>$row["order_id"]+$order["orders_id"] , "id"=>1));
if($update2) :
echo "done" ;
endif;
echo $row["order_id"] ;

endforeach;