<?php

require __DIR__.'/vendor/autoload.php';


require __DIR__.'/app/init.php';


$smmapi = new SMMApi();


$orders = $conn->prepare("SELECT * FROM tasks WHERE task_status=:status && task_type=:type ");
$orders->execute(array(
    "status" => "inprogress",
    "type" => 1
));
$orders = $orders->fetchAll(PDO::FETCH_ASSOC);

foreach ($orders as $order):
    $id = $order["task_id"];
    $api = $conn->prepare("SELECT * FROM tasks LEFT JOIN services ON services.service_id = tasks.service_id LEFT JOIN orders ON orders.order_id = tasks.order_id LEFT JOIN service_api ON services.service_api = service_api.id WHERE tasks.task_id=:id ");
    $api->execute(array(
        "id" => $id
    ));
    $api = $api->fetch(PDO::FETCH_ASSOC);
    
    $send_refill = $smmapi->action(array(
        'key' => $api["api_key"],
        'action' => 'refill',
        'order' => $api["api_orderid"],
    ), $api["api_url"]);
    print_r($send_refill);
    
    if (@$send_refill->refill):
        $r_id   = $send_refill->refill;
        $update = $conn->prepare("UPDATE tasks SET task_status=:status, refill_orderid=:r_id WHERE task_id=:id");
        $update = $update->execute(array(
            "status" => 'success',
            "id" => $id,
            "r_id" => $r_id
        ));
    endif;
endforeach;
