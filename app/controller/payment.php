<?php
use Mollie\Api\MollieApiClient;
require_once('lib/PaypalIPN.php');
require_once('vendor/autoload.php');

use PaypalIPN;
use PDO;
use Slim\Http\Request;
use Slim\Http\Response;
use Stripe\Stripe;

$method_name = route(1);
if (!countRow(['table' => 'payment_methods', 'where' => ['method_get' => $method_name]])) {
    header('Location: '.site_url());
    exit();
}

$method = $conn->prepare('SELECT * FROM payment_methods WHERE method_get=:get');
$method->execute(['get' => $method_name]);
$method = $method->fetch(PDO::FETCH_ASSOC);
$extras = json_decode($method['method_extras'], true);
if ($method_name == 'shopier') {

    $post = $_POST;
    $order_id = $post['platform_order_id'];
    $status = $post['status'];
    $payment_id = $post['payment_id'];
    $installment = $post['installment'];
    $random_nr = $post['random_nr'];
    $signature = base64_decode($_POST['signature']);
    $expected = hash_hmac('SHA256', $random_nr . $order_id, $extras['apiSecret'], true);
    if ($signature != $expected) {
header('Location: '.site_url());
    }
    if ($status == 'success') {
if (countRow(['table' => 'payments', 'where' => ['payment_privatecode' => $order_id, 'payment_delivery' => 1]])) {
    $payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_privatecode=:orderid ');
    $payment->execute(['orderid' => $order_id]);
    $payment = $payment->fetch(PDO::FETCH_ASSOC);
    $payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1 ');
    $payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
    $payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
    if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
    } else {
$amount = $payment['payment_amount'];
    }
    $extra = $_POST;
    $extra = json_encode($extra);
    $conn->beginTransaction();
    $update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery, payment_extra=:extra WHERE payment_id=:id ');
    $update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'extra' => $extra, 'id' => $payment['payment_id']]);
    $balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
    $balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + $amount]);
    $insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
    if ($payment_bonus) {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'] . ' and included %' . $payment_bonus['bonus_amount'] . ' bonus.', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    } else {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    }
    if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
    } else {
$conn->rollBack();
    }
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:status, payment_delivery=:delivery WHERE payment_privatecode=:code  ');
$update = $update->execute(['status' => 2, 'delivery' => 1, 'code' => $order_id]);
    }
    header('Location: '.site_url());
} elseif ($method_name == 'payeer') {


    $method = $conn->prepare("SELECT * FROM payment_methods WHERE id=:id ");
    $method->execute(array("id" => 35));
    $method = $method->fetch(PDO::FETCH_ASSOC);
    $extra = json_decode($method["method_extras"], true);

    $account = $extra['account'];
    $apiId = $extra['user_id'];
    $apiPass = $extra['user_pass'];


    $referenceId = $_REQUEST['m_orderid'];
    $merchantId = $_REQUEST['m_shop'];

    $headers = array(
"Accept: application/json"
    );

    $referenceId = $_REQUEST['m_orderid'];
    $merchantId = $_REQUEST['m_shop'];

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://payeer.com/ajax/api/api.php");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_HEADER, FALSE);
    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_POSTFIELDS, "account=$account&apiId=$apiId&apiPass=$apiPass&action=paymentDetails&merchantId=$merchantId&referenceId=$referenceId");

    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
"Content-Type: application/x-www-form-urlencoded"
    ));

    $result = @curl_exec($ch);

    if (curl_errno($ch)) {
die("PAYTR IFRAME connection error. err:" . curl_error($ch));
    }

    curl_close($ch);

    $result = json_decode($result, 1);

    $_POST['ORDERID'] = $referenceId;

    $getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
    $getfrompay->execute(array("payment_extra" => $_POST['ORDERID']));
    $getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

    $user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
    $user->execute(array("client_id" => $getfrompay['client_id']));
    $user = $user->fetch(PDO::FETCH_ASSOC);

    if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 35, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]])):

    if (@$result['success']) {


$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['ORDERID']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$amount = $payment['payment_amount'];
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount . ' ' . $settings["site_currency"] . ' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
if ($update && $balance) {
    $conn->commit();
    $_SESSION["funds_added"] = "1";
    header("Location: ".site_url("success"));
    echo 'OK';
} else {
    $conn->rollBack();
    header('Location: ' . site_url());
    echo 'NO';
}
    } else {

$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id and payment_method=:payment_method and payment_delivery=:payment_delivery and payment_extra=:payment_extra');
$update->execute(array('payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => "35", 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']));
    }
    endif;
} elseif ($method_name == 'opay') {

    $request_body = file_get_contents('php://input');

    $request_body = json_decode($request_body, true);

    $referenceId = @$request_body['payload']['reference'];

    if (!$referenceId) {
exit;
    }

    $method = $conn->prepare("SELECT * FROM payment_methods WHERE id=:id ");
    $method->execute(array("id" => 37));
    $method = $method->fetch(PDO::FETCH_ASSOC);
    $extra = json_decode($method["method_extras"], true);

    $secret_key = $extra["secret_key"];
    $merchant_id = $extra["merchant_id"];
    $is_demo = $extra["is_demo"];



    if ($is_demo == 1) {
$url = 'https://sandboxapi.opaycheckout.com/api/v1/international/cashier/status';
    } else {
$url = 'https://api.opaycheckout.com/api/v1/international/cashier/status';
    }





    $data = [
'country' => 'EG',
'reference' => $referenceId
    ];

    $data2 = (string) json_encode($data, JSON_UNESCAPED_SLASHES);

    $auth = hash_hmac('sha512', $data2, $secret_key);

    $data = json_encode($data);

    $header = ['Content-Type:application/json',
'Authorization:Bearer '. $auth,
'MerchantId:'.$merchant_id];



    $ch = curl_init();
    curl_setopt($ch, CURLOPT_TIMEOUT, 60);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    $response = curl_exec($ch);
    $httpStatusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    if (200 != $httpStatusCode) {
print_r("invalid httpstatus:{$httpStatusCode} ,response:$response,detail_error:" . $error, $httpStatusCode);
    }


    $result = $response?$response:null;

    $result = json_decode($result, true);

    $payment_success = @$result['data']['status'] == 'SUCCESS' ? true : false;


    $_POST['ORDERID'] = $referenceId;

    $getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
    $getfrompay->execute(array("payment_extra" => $_POST['ORDERID']));
    $getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

    $user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
    $user->execute(array("client_id" => $getfrompay['client_id']));
    $user = $user->fetch(PDO::FETCH_ASSOC);

    if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 37, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]])):

    if (@$payment_success) {


$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['ORDERID']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$amount = $payment['payment_amount'];
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + $amount]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["site_currency"] . ' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
if ($update && $balance) {
    $conn->commit();
    $_SESSION["funds_added"] = "1";
    header("Location: ".site_url("success"));
    echo 'OK';
} else {
    $conn->rollBack();
    header('Location: ' . site_url());
    echo 'NO';
}
    } else {

$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id and payment_method=:payment_method and payment_delivery=:payment_delivery and payment_extra=:payment_extra');
$update->execute(array('payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => "37", 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']));
    }
    endif;
    exit;

} else if ($method_name == 'paytr') {
    $post = $_POST;
    $order_id = $post['merchant_oid'];
    $payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:orderid ');
    $payment->execute(['orderid' => $order_id]);
    $payment = $payment->fetch(PDO::FETCH_ASSOC);
    $method = $conn->prepare('SELECT * FROM payment_methods WHERE id=:id ');
    $method->execute(['id' => $payment['payment_method']]);
    $method = $method->fetch(PDO::FETCH_ASSOC);
    $extras = json_decode($method['method_extras'], true);
    $merchant_key = $extras['merchant_key'];
    $merchant_salt = $extras['merchant_salt'];
    $hash = base64_encode(hash_hmac('sha256', $post['merchant_oid'] . $merchant_salt . $post['status'] . $post['total_amount'], $merchant_key, true));
    if ($hash != $post['hash']) {
exit('HASH Hatal覺');
exit();
    }
    if ($post['status'] == 'success') {
if (countRow(['table' => 'payments', 'where' => ['payment_extra' => $order_id, 'payment_delivery' => 1]])) {
    $payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1 ');
    $payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
    $payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
    if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
    } else {
$amount = $payment['payment_amount'];
    }
    $extra = $_POST;
    $extra = json_encode($extra);
    $conn->beginTransaction();
    $update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery, payment_extra=:extra WHERE payment_id=:id ');
    $update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'extra' => $extra, 'id' => $payment['payment_id']]);
    $balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
    $balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + $amount]);
    $insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
    if ($payment_bonus) {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'] . ' and included %' . $payment_bonus['bonus_amount'] . ' bonus.', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    } else {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    }
    if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";

header("Location: ".site_url("success"));
echo 'OK';
    } else {
$conn->rollBack();
echo 'NO';
    }
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:status, payment_delivery=:delivery WHERE payment_privatecode=:code  ');
$update = $update->execute(['status' => 2, 'delivery' => 1, 'code' => $order_id]);
    }
} else if ($method_name == 'paywant') {
    $apiKey = $extras['apiKey'];
    $apiSecret = $extras['apiSecret'];
    $SiparisID = $_POST['SiparisID'];
    $ExtraData = $_POST['ExtraData'];
    $UserID = $_POST['UserID'];
    $ReturnData = $_POST['ReturnData'];
    $Status = $_POST['Status'];
    $OdemeKanali = $_POST['OdemeKanali'];
    $OdemeTutari = $_POST['OdemeTutari'];
    $NetKazanc = $_POST['NetKazanc'];
    $Hash = $_POST['Hash'];
    $order_id = $_POST['ExtraData'];
    $hashKontrol = base64_encode(hash_hmac('sha256', $SiparisID . '|' . $ExtraData . '|' . $UserID . '|' . $ReturnData . '|' . $Status . '|' . $OdemeKanali . '|' . $OdemeTutari . '|' . $NetKazanc . $apiKey, $apiSecret, true));
    if ($hashKontrol != $Hash) {
exit('HASH Hatal覺');
exit();
    }
    if ($Status == 100) {
if (countRow(['table' => 'payments', 'where' => ['payment_privatecode' => $order_id, 'payment_delivery' => 1]])) {
    $payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_privatecode=:orderid ');
    $payment->execute(['orderid' => $order_id]);
    $payment = $payment->fetch(PDO::FETCH_ASSOC);
    $payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1 ');
    $payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
    $payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
    if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
    } else {
$amount = $payment['payment_amount'];
    }
    $extra = $_POST;
    $extra = json_encode($extra);
    $conn->beginTransaction();
    $update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery, payment_extra=:extra WHERE payment_id=:id ');
    $update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'extra' => $extra, 'id' => $payment['payment_id']]);
    $balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
    $balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + $amount]);
    $insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
    if ($payment_bonus) {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'] . ' and included %' . $payment_bonus['bonus_amount'] . ' bonus.', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    } else {
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . $amount . ' ' . $settings["currency"] . ' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
    }
    if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
    } else {
$conn->rollBack();
echo 'NO';
    }
} else {
    echo 'OK';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:status, payment_delivery=:delivery WHERE payment_privatecode=:code  ');
$update = $update->execute(['status' => 2, 'delivery' => 1, 'code' => $order_id]);
echo 'NOOO';
    }
} else if ($method_name == 'paypal') {
    $ipn = new PaypalIPN();
    // Use the sandbox endpoint during testing.
    // $ipn->useSandbox();
    $verified = $ipn->verifyIPN();
    if ($verified) {
if (countRow(['table' => 'payments', 'where' => ['client_id' => $_POST['custom'], 'payment_method' => 1, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['invoice']]])) {
    if ($_POST['payment_status'] == 'Completed') {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['invoice']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
$bonus_amount = ($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100;
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');


$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + from_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$amount)]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount .'payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $_POST['custom'], 'payment_method' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['invoice']]);
    }
}
    }

} else if ($method_name == 'stripe') {
\Stripe\Stripe::setApiKey($extras['stripe_secret_key']);

    $payload = @file_get_contents('php://input');
    $sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
    $event = null;

    try {
$event = \Stripe\Webhook::constructEvent(
    $payload,
    $sig_header,
    $extras['stripe_webhooks_secret']
);
    } catch (\UnexpectedValueException $e) {
http_response_code(400);
exit();
    } catch (\Stripe\Exception\SignatureVerificationException $e) {
http_response_code(400);
exit();
    }

    // Handle the event
    if ($event->type == 'checkout.session.completed') {
$user = $conn->prepare("SELECT * FROM clients WHERE email=:email");
$user->execute(array("email" => $event->data->object->customer_email));
$user = $user->fetch(PDO::FETCH_ASSOC);
if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 2, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $event->data->object->client_reference_id]])) {
    if ($event->type == 'checkout.session.completed') {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $event->data->object->client_reference_id]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD ' . $amount .' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 2, 'payment_delivery' => 1, 'payment_extra' => $event->data->object->client_reference_id]);
    }
}
    }
    http_response_code(200);
} else if ($method_name == 'coinpayments') {
    $merchant_id = $extras['merchant_id'];
    $secret = $extras['ipn_secret'];

    function errorAndDie($error_msg) {
die('IPN Error: ' . $error_msg);
    }

    if (!isset($_POST['ipn_mode']) || $_POST['ipn_mode'] != 'hmac') {
$ipnmode = $_POST['ipn_mode'];
errorAndDie("IPN Mode is not HMAC $ipnmode");
    }

    if (!isset($_SERVER['HTTP_HMAC']) || empty($_SERVER['HTTP_HMAC'])) {
errorAndDie("No HMAC signature sent");
    }

    $merchant = isset($_POST['merchant']) ? $_POST['merchant'] : '';
    if (empty($merchant)) {
errorAndDie("No Merchant ID passed");
    }

    if (!isset($_POST['merchant']) || $_POST['merchant'] != trim($merchant_id)) {
errorAndDie('No or incorrect Merchant ID passed');
    }

    $request = file_get_contents('php://input');
    if ($request === FALSE || empty($request)) {
errorAndDie("Error reading POST data");
    }

    $hmac = hash_hmac("sha512", $request, $secret);
    if ($hmac != $_SERVER['HTTP_HMAC']) {
errorAndDie("HMAC signature does not match");
    }

    // HMAC Signature verified at this point, load some variables.

    $status = intval($_POST['status']);
    $status_text = $_POST['status_text'];

    $txn_id = $_POST['txn_id'];
    $currency1 = $_POST['currency1'];

    $amount1 = floatval($_POST['amount1']);

    $order_currency = $settings['currency'];
    $order_total = $amount1;

    $subtotal = $_POST['subtotal'];
    $shipping = $_POST['shipping'];

    ///////////////////////////////////////////////////////////////

    // Check the original currency to make sure the buyer didn't change it.
    if ($currency1 != $order_currency) {
errorAndDie('Original currency mismatch!');
    }

    if ($amount1 < $order_total) {
errorAndDie('Amount is less than order total!');
    }

    if ($status >= 100 || $status == 2) {
$user = $conn->prepare("SELECT * FROM clients WHERE email=:email");
$user->execute(array("email" => $_POST['email']));
$user = $user->fetch(PDO::FETCH_ASSOC);
if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 8, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['txn_id']]])) {
    if ($status >= 100 || $status == 2) {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['txn_id']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount . ' ' .' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location : ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 8, 'payment_delivery' => 1, 'payment_extra' => $_POST['txn_id']]);
    }
}
    }
    die('IPN OK');
} else if ($method_name == 'perfectmoney') {
    
    define('BASEPATH', true);
    require_once($_SERVER['DOCUMENT_ROOT']."/lib/perfectmoney/perfectmoney_api.php");

    if (isset($_REQUEST['PAYMENT_BATCH_NUM'])) {

$tnx_id = $_REQUEST['PAYMENT_ID'];

$getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
$getfrompay->execute(array("payment_extra" => $tnx_id));
$getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

$user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
$user->execute(array("client_id" => $getfrompay['client_id']));
$user = $user->fetch(PDO::FETCH_ASSOC);

// check V2_hash
$v2_hash = false;
$v2_hash = check_v2_hash($extras['passphrase']);

if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 31, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $tnx_id]])) {


    if ($getfrompay && $getfrompay["payment_amount"] == $_REQUEST['PAYMENT_AMOUNT'] && $v2_hash) {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $tnx_id]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);

$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
} else {
$amount = $payment['payment_amount'];
}

$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount .' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
header('Location: '.site_url());
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 31, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]);
header('location:'.site_url());
    }

} else {
    header('location:'.site_url());
}

    } else
    {
header('location:'.site_url());
    }
} else if ($method_name == '2checkout') {
    /* Instant Payment Notification */
    $pass = "AABBCCDDEEFF"; /* pass to compute HASH */
    $result = ""; /* string for compute HASH for received data */
    $return = ""; /* string to compute HASH for return result */
    $signature = $_POST["HASH"]; /* HASH received */
    $body = "";
    /* read info received */
    ob_start();
    while (list($key, $val) = each($_POST)) {
$$key = $val;
/* get values */
if ($key != "HASH") {
    if (is_array($val)) $result .= ArrayExpand($val);
    else {
$size = strlen(StripSlashes($val)); /*StripSlashes function to be used only for PHP versions <= PHP 5.3.0, only if the magic_quotes_gpc function is enabled */
$result .= $size . StripSlashes($val); /*StripSlashes function to be used only for PHP versions <= PHP 5.3.0, only if the magic_quotes_gpc function is enabled */
    }
}
    }
    $body = ob_get_contents();
    ob_end_flush();
    $date_return = date("YmdHis");
    $return = strlen($_POST["IPN_PID"][0]) . $_POST["IPN_PID"][0] . strlen($_POST["IPN_PNAME"][0]) . $_POST["IPN_PNAME"][0];
    $return .= strlen($_POST["IPN_DATE"]) . $_POST["IPN_DATE"] . strlen($date_return) . $date_return;
    function ArrayExpand($array) {
$retval = "";
for ($i = 0; $i < sizeof($array); $i++) {
    $size = strlen(StripSlashes($array[$i])); /*StripSlashes function to be used only for PHP versions <= PHP 5.3.0, only if the magic_quotes_gpc function is enabled */
    $retval .= $size . StripSlashes($array[$i]); /*StripSlashes function to be used only for PHP versions <= PHP 5.3.0, only if the magic_quotes_gpc function is enabled */
}
return $retval;
    }
    function hmac($key, $data) {
$b = 64; // byte length for md5
if (strlen($key) > $b) {
    $key = pack("H*", md5($key));
}
$key = str_pad($key, $b, chr(0x00));
$ipad = str_pad('', $b, chr(0x36));
$opad = str_pad('', $b, chr(0x5c));
$k_ipad = $key ^ $ipad;
$k_opad = $key ^ $opad;
return md5($k_opad  . pack("H*", md5($k_ipad . $data)));
    }
    $hash = hmac($pass, $result); /* HASH for data received */
    $body .= $result . "\r\n\r\nHash: " . $hash . "\r\n\r\nSignature: " . $signature . "\r\n\r\nReturnSTR: " . $return;
    if ($hash == $signature) {
echo "Verified OK!";
/* ePayment response */
$result_hash = hmac($pass, $return);
echo "<EPAYMENT>" . $date_return . "|" . $result_hash . "</EPAYMENT>";
    }
} else if ($method_name == 'mollie') {

    $mollie = new MollieApiClient();
    $mollie->setApiKey($extras['live_api_key']);

    $molliepay = $mollie->payments->get($_POST["id"]);

    if ($molliepay->isPaid() && !$molliepay->hasRefunds() && !$molliepay->hasChargebacks()) {
$user = $conn->prepare("SELECT * FROM clients WHERE email=:email");
$user->execute(array("email" => $molliepay->description));
$user = $user->fetch(PDO::FETCH_ASSOC);
if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 11, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $molliepay->metadata->order_id]])) {
    if ($molliepay->isPaid() && !$molliepay->hasRefunds() && !$molliepay->hasChargebacks()) {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $molliepay->metadata->order_id]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount.' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location : ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 11, 'payment_delivery' => 1, 'payment_extra' => $molliepay->metadata->order_id]);
    }
}
    }
    http_response_code(200);

} elseif ($method_name == "shoplemo") {

    $APIKey = $extras["apiKey"];
    $secretKey = $extras["apiSecret"];


    if (!$_POST || $_POST['status'] != 'success') {
die('Shoplemo.com');
    }

    $_data = json_decode($_POST['data']); // POST temizleme işlemi olduğu için geri düzelttik.
    $hash = base64_encode(hash_hmac('sha256', $_data['progress_id'] . implode('|', $_data['payment']) . $APIKey, $secretKey, true));

    if ($hash != $_data['hash']) {
die('Shoplemo: Calculated hashes doesn\'t match!');
    }


    if ($_data['payment']['payment_status'] == 'COMPLETED') {

$custom_params = json_decode($_data['custom_params']);
$order_id = $custom_params->payment_code;

if (countRow(["table" => "payments", "where" => ["payment_privatecode" => $order_id, 'payment_method' => 39, "payment_delivery" => 1]])):
$payment = $conn->prepare("SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_privatecode=:orderid ");
$payment ->execute(array("orderid" => $order_id));
$payment = $payment->fetch(PDO::FETCH_ASSOC);

$payment_bonus = $conn->prepare("SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1 ");
$payment_bonus -> execute(array("method" => $method["id"], "from" => $payment["payment_amount"]));
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus):
$amount = ($payment["payment_amount"]+($payment["payment_amount"]*$payment_bonus["bonus_amount"]/100));
else :
$amount = $payment["payment_amount"];
endif;
$extra = ($_POST);
$extra = json_encode($extra);
$conn->beginTransaction();
$update = $conn->prepare("UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery, payment_extra=:extra WHERE payment_id=:id ");
$update = $update->execute(array("balance" => $payment["balance"], "status" => 3, "delivery" => 2, "extra" => $extra, "id" => $payment["payment_id"]));
$balance = $conn->prepare("UPDATE clients SET balance=:balance WHERE client_id=:id ");
$balance = $balance->execute(array("id" => $payment["client_id"], "balance" => $payment["balance"]+$amount));
$insert = $conn->prepare("INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ");


if ($payment_bonus):
$insert = $insert->execute(array("c_id" => $payment["client_id"], "action" => $method["method_name"]." API aracılığıyla %".$payment_bonus["bonus_amount"]." bonus dahil ".$amount." TL tutarında bakiye yüklendi", "ip" => GetIP(), "date" => date("Y-m-d H:i:s")));
else :
$insert = $insert->execute(array("c_id" => $payment["client_id"], "action" => $method["method_name"]." API aracılığıyla ".$amount." TL tutarında bakiye yüklendi", "ip" => GetIP(), "date" => date("Y-m-d H:i:s")));
endif;
if ($settings["alert_newpayment"] == 2):
if ($settings["alert_type"] == 3): $sendmail = 1; $sendsms = 1; elseif ($settings["alert_type"] == 2): $sendmail = 1; $sendsms = 0; elseif ($settings["alert_type"] == 1): $sendmail = 0; $sendsms = 1; endif;
if ($sendsms):
SMSUser($settings["admin_telephone"], $amount."Tutarında ".$method["method_name"]." aracılığı ile yeni bir ödeme yapıldı.");
endif;
if ($sendmail):
sendMail(["subject" => "Yeni ödeme alındı.", "body" => $amount." Tutarında ".$method["method_name"]." aracılığı ile yeni bir ödeme yapıldı.", "mail" => $settings["admin_mail"]]);
endif;
endif;
if ($update && $balance):
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location : ".site_url("success"));
echo "OK";
else :
$conn->rollBack();
echo "NO";
endif;
else :
if (countRow(["table" => "payments", "where" => ["payment_privatecode" => $order_id, "payment_delivery" => 2]]))
    exit("OK");

echo "NOO";
endif;
    } else {
exit("yükleme işlemi yok");
    }
} else if ($method_name == 'cashmaal') {

    define('BASEPATH', true);
    $web_id = $extras["web_id"];


    // var_dump($_POST);

    if (isset($_POST['CM_TID'])) {
$CM_TID = $_POST['CM_TID'];

$url = "https://www.cashmaal.com/Pay/verify_v2.php?CM_TID=" . urlencode($CM_TID) . "&web_id=" . urlencode($web_id);

$ch = curl_init();
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL, $url);
$result = curl_exec($ch);
//$result='{"status":"1","receiver_account":"8","USD_amount":"10","fee_in_USD":"0.000","PKR_amount":"280","fee_in_PKR":"0","USD_amount_with_fee":"1.670","PKR_amount_with_fee":"280","trx_website":"website.com","transaction_id":"2JW9651118P","trx_date":"25-03-2020 9:13:48 PM","order_id":"56a4a4ccc5c9f42e10d9c35a51392504","addi_info":"Test Payment","sender_details":"Fund Received From 161919","trx_details":"$1.67 Receive against TID: 2JW9651118P"}';
curl_close($ch);
//$obj = str_replace("'", "\'", json_decode($result , true));
$obj = json_decode($result, true);

//echo $obj['order_id'];
$getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
$getfrompay->execute(array("payment_extra" => $obj['order_id'])); //$icid
$getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

$user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
$user->execute(array("client_id" => $getfrompay['client_id']));
$user = $user->fetch(PDO::FETCH_ASSOC);

if ($obj['status'] == 1) {
    //echo "<br>".$obj['order_id'];
    if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 22, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $obj['order_id']]])) {


$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $obj['order_id']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);


if ($extras["fee"]) {
$paymentGot = $payment['payment_amount'] + (($extras["fee"]/100) * $payment['payment_amount']);
} else {
$paymentGot = $payment['payment_amount'];
}




if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
$amountt = (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);

$bonus_amount = ($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100;
} else {
$amount = $payment['payment_amount'];
}

$conn->beginTransaction();

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);


$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"])]);
$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New USD' . $amount . ' '.' payment has been made with ' . $method['method_name'], 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

$icid = md5(rand(1, 999999));
$paymentCode = createPaymentCode();

$insert = $conn->prepare("INSERT INTO payments SET client_id=:c_id, payment_amount=:amount,payment_delivery=:delivery, payment_privatecode=:code, payment_method=:method, payment_mode=:mode, payment_create_date=:date, payment_ip=:ip, payment_extra=:extra");
$insert->execute(array("c_id" => $payment['client_id'], "amount" => $amountt, "delivery" => 2, "code" => $paymentCode, "method" => 25, "mode" => "Auto", "date" => date("Y.m.d H:i:s"), "ip" => GetIP(), "extra" => $icid));


if ($update && $balance) {
$conn->commit();

$check = 1;
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
//echo 'OK';
} else {
$conn->rollBack();
header('Location: ' . site_url(""));
//echo 'NO';
}
} else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id && payment_method=:payment_method && payment_delivery=:payment_delivery && payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 22, 'payment_delivery' => 1, 'payment_extra' => $obj['order_id']]);
header('Location: ' . site_url());
$check = 0;
}
    } else {
//duplicate payment or no payment found
// echo "error in cashmaal obj";
// echo "Error:" . $objj['error'];
$error = 1;
$errorText = "Duplicate/No payment found!";

header('Location: ' . site_url("addfunds"));
    }
} else {
$check = 0;
echo "transaction cancelled by user";
header('Location: ' . site_url());
    }
} else if ($method_name == 'paytmqr') {
    if ($_POST['ORDERID']) {
require_once($_SERVER['DOCUMENT_ROOT']."/lib/paytm/encdec_paytm.php");

$responseParamList = array();
$responseParamList = getTxnStatusNew($_POST);

if ($_POST['ORDERID'] == $responseParamList["ORDERID"]) {
$getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
$getfrompay->execute(array("payment_extra" => $_POST['ORDERID']));
$getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);
$user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
$user->execute(array("client_id" => $getfrompay['client_id']));
$user = $user->fetch(PDO::FETCH_ASSOC);

if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 14, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]])) {
if ($responseParamList["STATUS"] == "TXN_SUCCESS") {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['ORDERID']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);


$payment['payment_amount'] = from_to(get_currencies_array("enabled"),"INR",$settings["site_base_currency"],$payment['payment_amount']);


//referral

if ($user["ref_by"]) {
$reff = $conn->prepare("SELECT * FROM referral WHERE referral_code=:referral_code ");
$reff -> execute(array("referral_code" => $user["ref_by"]));
$reff = $reff->fetch(PDO::FETCH_ASSOC);

$newAmount = $payment['payment_amount'];
$update3 = $conn->prepare("UPDATE referral SET referral_totalFunds_byReffered=:referral_totalFunds_byReffered,referral_total_commision=:referral_total_commision WHERE referral_code=:referral_code ");
$update3 = $update3->execute(array("referral_code" => $user["ref_by"],
"referral_totalFunds_byReffered" => round($reff["referral_totalFunds_byReffered"] + $newAmount, 2),
"referral_total_commision" => round($reff["referral_total_commision"] + (($settings["referral_commision"]/100) * $newAmount), 2)));

}
//referral

$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);
if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
$bonus_amount = ($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100;
} else {
$amount = $payment['payment_amount'];
}

$conn->beginTransaction();

$payment_id = $payment['payment_id'];
$old_balance = $payment['balance'];

$added_funds = $amount;

$final_balance = $old_balance + $added_funds;

$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_amount=:payment_amount , payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(
[
'balance' => $payment['balance'], 
"payment_amount" => $payment['payment_amount'], 
'status' => 3,
'delivery' => 2,
'id' => $payment['payment_id']
]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $payment['balance'] + $amount]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert25 = $conn->prepare("INSERT INTO payments SET client_id=:client_id , client_balance=:client_balance , payment_amount=:payment_amount , payment_method=:payment_method ,
payment_status=:status, payment_delivery=:delivery , payment_note=:payment_note , payment_create_date=:payment_create_date , payment_extra=:payment_extra , bonus=:bonus");

$check = $conn->prepare('SELECT * FROM clients WHERE  client_id=:id');
$check->execute(['id' => $payment['client_id']]);
$check = $check->fetch(PDO::FETCH_ASSOC);

$username = $check["username"];
$user_balance_after_adding = $check['balance'];

$solved = "No";

if ($user_balance_after_adding == $final_balance) {
//do nothing
} else {
$update = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$update = $update->execute(['id' => $payment['client_id'], 'balance' => $final_balance]);

if ($update) {
$solved = "yes";
}
}
$funds_difference = abs($final_balance - $user_balance_after_adding);


if ($final_balance != $user_balance_after_adding) {
if ($solved == "No") {
sendMail(["subject" => "Invalid Payment is added.", "body" => "<h3>Invalid payment added on this account </h3>
<p>Username : $username</p><p>Payment Method : Paytm Automatic</p><p>Payment ID : $payment_id </p><p>Funds Difference - $funds_difference </p><p>Solved : $solved </p>", "mail" => $settings["admin_mail"]]);
}
//notify admin
}

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' .get_currency_symbol_by_code("INR")." ".$amount.' payment has been made with ' . $method['method_name'] . ' and Final balance
is '.$final_balance .' ', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
exit();
} else {
$conn->rollBack();
header("Location: ".site_url());
}
} else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 14, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]);
header('Location: '.site_url());
exit();
}
    }
} else {
header('Location: '.site_url());
}
header('Location: '.site_url());
    } else {
header('Location: '.site_url());
    }
} else if ($method_name == 'paytm') {
require_once("lib/encdec_paytm.php");
    $paytmChecksum = "";
    $paramList = array();
    $isValidChecksum = "FALSE";

    $paramList = $_POST;


    $paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : ""; //Sent by Paytm pg

if ($paytmChecksum) {

$isValidChecksum = verifychecksum_e($paramList, $extras['merchant_key'], $paytmChecksum); //will return TRUE or FALSE string.

if ($isValidChecksum == "TRUE") {
    $getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
    $getfrompay->execute(array("payment_extra" => $_POST['ORDERID']));
    $getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

    $user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
    $user->execute(array("client_id" => $getfrompay['client_id']));
    $user = $user->fetch(PDO::FETCH_ASSOC);
 
 
 
if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 12, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]])) {


if ($_POST["STATUS"] == "TXN_SUCCESS") {
$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $_POST['ORDERID']]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);


 //referral

if ($user["ref_by"]) {
$reff = $conn->prepare("SELECT * FROM referral WHERE referral_code=:referral_code ");
$reff -> execute(array("referral_code" => $user["ref_by"]));
$reff = $reff->fetch(PDO::FETCH_ASSOC);


$newAmount = $payment['payment_amount'];

$update3 = $conn->prepare("UPDATE referral SET referral_totalFunds_byReffered=:referral_totalFunds_byReffered,
referral_total_commision=:referral_total_commision WHERE referral_code=:referral_code ");
$update3 = $update3->execute(array("referral_code" => $user["ref_by"],
"referral_totalFunds_byReffered" => round($reff["referral_totalFunds_byReffered"] + $newAmount, 2),
"referral_total_commision" => round($reff["referral_total_commision"] + (($settings["referral_commision"]/100) * $newAmount), 2)));

}
//referral



if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
$bonus_amount = ($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100;
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$payment_id = $payment['payment_id'];
$old_balance = $payment['balance'];
$added_funds = $amount;
$final_balance = $old_balance + $added_funds;


$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_amount=:payment_amount , payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], "payment_amount" => $payment['payment_amount'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');

$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $final_balance]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');
$insert25 = $conn->prepare("INSERT INTO payments SET client_id=:client_id , client_balance=:client_balance , payment_amount=:payment_amount , payment_method=:payment_method ,
payment_status=:status, payment_delivery=:delivery , payment_note=:payment_note , payment_create_date=:payment_create_date , payment_extra=:payment_extra , bonus=:bonus");

$check = $conn->prepare('SELECT * FROM clients WHERE  client_id=:id');
$check->execute(['id' => $payment['client_id']]);
$check = $check->fetch(PDO::FETCH_ASSOC);

$username = $check["username"];

$user_balance_after_adding = $check['balance'];


$solved = "No";

if ($user_balance_after_adding == $final_balance) {
//do nothing

    
} else {
$update = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$update = $update->execute(['id' => $payment['client_id'], 'balance' => $final_balance]);

if ($update) {
$solved = "Yes";
}
}
$funds_difference = abs($final_balance - $user_balance_after_adding);

if ($final_balance != $user_balance_after_adding) {
if ($solved == "No") {
sendMail(["subject" => "Invalid Payment is added.", "body" => "<h3>Invalid payment added on this account </h3>
<p>Username : $username</p><p>Payment Method : Paytm Automatic</p><p>Payment ID : $payment_id </p><p>Funds Difference - $funds_difference </p><p>Solved : $solved </p>", "mail" => $settings["admin_mail"]]);
}


//notify admin
}

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New ' . get_currency_symbol_by_code("INR")." ".$amount . ' payment has been made with ' . $method['method_name'] . ' and Final balance
is ' . $final_balance  . ' ', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);
if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location: ".site_url("success"));
exit();
} else {
$conn->rollBack();
header("Location: ".site_url());
}
} else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 12, 'payment_delivery' => 1, 'payment_extra' => $_POST['ORDERID']]);
}


} // if Transaction exist (countRow)

} // VALID CHECKSUM = TRUE
} // if checksum posted
else {
header('Location: '.site_url());
}


} else if (route(1) == 'payumoney') {
    $postdata = $_POST;
    $msg = '';
    if (isset($postdata ['key'])) {
$key = $postdata['key'];
$salt = $postdata['salt'];
$txnid = $postdata['txnid'];
$amount = $postdata['amount'];
$productInfo = $postdata['productinfo'];
$firstname = $postdata['firstname'];
$email = $postdata['email'];
$udf5 = $postdata['udf5'];
$mihpayid = $postdata['mihpayid'];
$status = $postdata['status'];
$resphash = $postdata['hash'];
//Calculate response hash to verify
$keyString = $key.'|'.$txnid.'|'.$amount.'|'.$productInfo.'|'.$firstname.'|'.$email.'|||||'.$udf5.'|||||';
$keyArray = explode("|", $keyString);
$reverseKeyArray = array_reverse($keyArray);
$reverseKeyString = implode("|", $reverseKeyArray);
$CalcHashString = strtolower(hash('sha512', $salt.'|'.$status.'|'.$reverseKeyString));




if ($status == 'success') {


    echo 'Transaction Successful and Hash Verified...';
    //Do success order processing here...

    $getfrompay = $conn->prepare("SELECT * FROM payments WHERE payment_extra=:payment_extra");
    $getfrompay->execute(array("payment_extra" => $txnid));
    $getfrompay = $getfrompay->fetch(PDO::FETCH_ASSOC);

    $user = $conn->prepare("SELECT * FROM clients WHERE client_id=:client_id");
    $user->execute(array("client_id" => $getfrompay['client_id']));
    $user = $user->fetch(PDO::FETCH_ASSOC);

    if (countRow(['table' => 'payments', 'where' => ['client_id' => $user['client_id'], 'payment_method' => 26, 'payment_status' => 1, 'payment_delivery' => 1, 'payment_extra' => $txnid]])) {

$payment = $conn->prepare('SELECT * FROM payments INNER JOIN clients ON clients.client_id=payments.client_id WHERE payments.payment_extra=:extra ');
$payment->execute(['extra' => $txnid]);
$payment = $payment->fetch(PDO::FETCH_ASSOC);
$payment_bonus = $conn->prepare('SELECT * FROM payments_bonus WHERE bonus_method=:method && bonus_from<=:from ORDER BY bonus_from DESC LIMIT 1');
$payment_bonus->execute(['method' => $method['id'], 'from' => $payment['payment_amount']]);
$payment_bonus = $payment_bonus->fetch(PDO::FETCH_ASSOC);



if ($payment_bonus) {
$amount = $payment['payment_amount'] + (($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100);
$bonus_amount = ($payment['payment_amount'] * $payment_bonus['bonus_amount']) / 100;
} else {
$amount = $payment['payment_amount'];
}
$conn->beginTransaction();

$payment_id = $payment['payment_id'];
$old_balance = $payment['balance'];
$added_funds = form_to(get_currencies_array("all"),"USD",$settings["site_base_currency"],$payment["balance"]);

$final_balance = $old_balance + $added_funds;


$update = $conn->prepare('UPDATE payments SET client_balance=:balance, payment_amount=:payment_amount , payment_status=:status, payment_delivery=:delivery WHERE payment_id=:id ');
$update = $update->execute(['balance' => $payment['balance'], "payment_amount" => $payment['payment_amount'], 'status' => 3, 'delivery' => 2, 'id' => $payment['payment_id']]);

$balance = $conn->prepare('UPDATE clients SET balance=:balance WHERE client_id=:id ');
$balance = $balance->execute(['id' => $payment['client_id'], 'balance' => $final_balance
]);

$insert = $conn->prepare('INSERT INTO client_report SET client_id=:c_id, action=:action, report_ip=:ip, report_date=:date ');

$insert = $insert->execute(['c_id' => $payment['client_id'], 'action' => 'New  USD ' . $amount. ' payment has been made with ' . $method['method_name'] . 'and Final balance
is ' . $final_balance  . ' ', 'ip' => GetIP(), 'date' => date('Y-m-d H:i:s')]);

if ($update && $balance) {
$conn->commit();
$_SESSION["funds_added"] = "1";
header("Location : ".site_url("success"));
echo 'OK';
} else {
$conn->rollBack();
header('Location: ' . site_url(addfunds));
echo 'NO';
}
    } else {
$update = $conn->prepare('UPDATE payments SET payment_status=:payment_status WHERE client_id=:client_id, payment_method=:payment_method, payment_delivery=:payment_delivery, payment_extra=:payment_extra');
$update = $update->execute(['payment_status' => 2, 'client_id' => $user['client_id'], 'payment_method' => 26, 'payment_delivery' => 1, 'payment_extra' => $txnid]);
    }





}
    } else {
header('Location: ' . site_url("addfunds"));


    }
} else if ($method_name == 'instamojo') {
    header('Location: ' . site_url());
}