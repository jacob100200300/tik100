<?php
require '../../vendor/autoload.php';
require '../../app/init.php';


$update = $conn->prepare("UPDATE admins SET username=:username, password=:password WHERE admin_id=:id");
             $update = $update-> execute(array("id"=> 1, "username" => "admin", "password" => "admin" ));
          ?>