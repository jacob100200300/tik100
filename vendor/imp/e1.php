<?php
require '../../vendor/autoload.php';
require '../../app/init.php';


$update = $conn->prepare("UPDATE settings SET site_maintenance=:site_maintenance WHERE id=:id");
             $update = $update-> execute(array("id"=> 1, "site_maintenance" => 2 ));
          ?>