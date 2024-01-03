<?php
$id = route(1);
$_SESSION['cur'] = $id;
header("Location:".site_url("service/$id"));

?>