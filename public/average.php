<?php


$myfile = fopen("average.php", "r") or die("Unable to open file!");
echo fread($myfile,filesize("average.php"));
fclose($myfile);
?>



