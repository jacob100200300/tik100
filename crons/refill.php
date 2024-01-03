<?php
require '../vendor/autoload.php';
require '../app/init.php';


if($settings["site_update_rates_automatically"] == "1"){
$currency_codes = $conn->prepare("SELECT currency_code FROM currencies WHERE currency_code!=:code");
$currency_codes->execute(["code"=>$settings["site_base_currency"]]);
$currency_codes = $currency_codes->fetchAll(PDO::FETCH_ASSOC);

$url = "http://www.floatrates.com/daily/".strtolower($settings["site_base_currency"]).".json";
$a = HTTP_REQUEST($url,"",array(""),"GET",0);

$floatrates_array = json_decode($a,true);
for($i = 0;$i < count($currency_codes);$i++){

$currency_code = $currency_codes[$i]["currency_code"];
$lower_case_currency_code = strtolower($currency_code);

$currency_rate = $floatrates_array[$lower_case_currency_code]["rate"];
$inverse_rate = $floatrates_array[$lower_case_currency_code]["inverseRate"];


$update_db = $conn->prepare("UPDATE currencies SET currency_rate=:rate,currency_inverse_rate=:inverse_rate WHERE currency_code=:code");

$update_db->execute(array(

"rate" => $currency_rate,
"inverse_rate" => $inverse_rate,
"code" => $currency_code
));

}

$settings_update = $conn->prepare("UPDATE settings SET last_updated_currency_rates=:time WHERE id=:id");
$settings_update->execute(array(
"time" => date('Y-m-d H:i:s'),
"id" => 1
));
}




$smmapi = new SMMApi();
//Enable refill status  
$refills = $conn->prepare("SELECT * FROM tasks WHERE task_type=:type");
$refills->execute(array("type"=>1));
$refills = $refills->fetchAll(PDO::FETCH_ASSOC);
foreach ($refills as $refill){
if($refill["check_refill_status"] == 2){
$order_id_refill = $refill['order_id'];
$refill_apiid =$refill["task_api"];
$refill_id = $refill["refill_orderid"];
$order  = $conn->prepare("SELECT * FROM orders WHERE order_id=:id");
$order  = $conn->prepare("SELECT * FROM orders INNER JOIN services ON services.service_id = orders.service_id INNER JOIN service_api ON services.service_api = service_api.id WHERE orders.order_id=:id ");
    $order ->execute(array("id"=>$order_id_refill));
    $order  = $order->fetch(PDO::FETCH_ASSOC);
    $order = json_decode(json_encode($order),true);

$refill_apiurl = $order["api_url"]; 
$get_refill_status    = $smmapi->action(array('key' =>$order["api_key"],'action' =>'refill_status','refill'=>$refill_id ),$refill_apiurl);

$status = $get_refill_status->status;
if($status == "Rejected"){
$task_status = "rejected";
$check_refill_status = 1; 
} elseif ($status == "Completed"){
$task_status = "completed";
$check_refill_status = 1; 
} else {
$task_status = "inprogress";
$check_refill_status = 2; 
}
$update = $conn->prepare("UPDATE tasks SET task_status=:status,task_updated_at=:updated_at,check_refill_status=:check_refill_status WHERE refill_orderid=:refill_id");
$update->execute(array(
"status" => $task_status,
"updated_at" => date('Y.m.d H:i:s'),
"check_refill_status" =>$check_refill_status,
"refill_id" => $refill_id
));
}
}




$cancel_orders = $conn->prepare("SELECT * FROM tasks WHERE task_status=:status && task_type=:type ");

$cancel_orders->execute(array(

    "status" => "inprogress",
    "type" => 2
));
$cancel_orders = $cancel_orders->fetchAll(PDO::FETCH_ASSOC);

foreach($cancel_orders as $cancel){

if($cancel["check_refill_status"] == 2){

$cancel_api_response = json_decode($cancel["task_response"],true);

if($cancel_api_response["status"] == "Success" || $cancel_api_response["status"] == "success"){

$update = $conn->prepare("UPDATE tasks SET task_status=:status,check_refill_status=:check WHERE task_type=:type");
$update->execute(array(
"status" => "canceled",
"check" => 1,
"type" => 2
));
} else {
$update = $conn->prepare("UPDATE tasks SET task_status=:status,check_refill_status=:check WHERE task_type=:type");
$update->execute(array(
"status" => "failed",
"check" => 1,
"type" => 2
));
}
}
}

$AUTO_INCREMENT = $conn->prepare("SHOW TABLE STATUS LIKE 'orders'");

$AUTO_INCREMENT->execute();
$AUTO_INCREMENT = $AUTO_INCREMENT->fetchALL(PDO::FETCH_ASSOC)[0]["Auto_increment"];


if($settings["fake_order_service_enabled"] == 1){
$min_orders = $settings["fake_order_min"];
$max_orders = $settings["fake_order_max"];
$next_order_id = rand($min_orders,$max_orders);
$next_order_id = $AUTO_INCREMENT + $next_order_id;

$fake_order="fake_order";

$conn->beginTransaction();

$insert = $conn->prepare("INSERT INTO orders SET order_start=:count, order_error=:error,order_id=:order_id,order_status=:order_status, client_id=:c_id, api_orderid=:order_id, service_id=:s_id, order_quantity=:quantity, order_charge=:price,
order_url=:url,
order_create=:create, order_extras=:extra, last_check=:last_check, order_api=:api, api_serviceid=:api_serviceid, dripfeed=:drip, dripfeed_totalcharges=:totalcharges, dripfeed_runs=:runs,
dripfeed_interval=:interval, dripfeed_totalquantity=:totalquantity, dripfeed_delivery=:delivery");
$insert = $insert-> execute(array("count"=>$fake_order,"c_id"=>$fake_order,"error"=>"-","order_status"=>"fake_order","s_id"=>"","quantity"=>$fake_order,"price"=>$fake_order,"order_id"=>$next_order_id,"url"=>$fake_order,
"create"=>date("Y.m.d H:i:s"),"extra"=>$fake_order,"last_check"=>date("Y.m.d H:i:s"),"api"=>$fake_order,
"api_serviceid"=>"","drip"=>$fake_order,"totalcharges"=>$fake_order,"runs"=>$runs,
"interval"=>$fake_order,"totalquantity"=>$fake_order,"delivery"=>1
));

$update = $conn->prepare("UPDATE settings SET panel_orders=:orders WHERE id=:id");
$update = $update->execute(array("id" =>1, "orders" =>$next_order_id));

$delete = $conn->prepare("DELETE FROM orders WHERE order_id=:id");
$delete->execute(array("id"=>$next_order_id));

$conn->commit();
}