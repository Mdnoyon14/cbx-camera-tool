<?php
$ip = $_SERVER['REMOTE_ADDR'];
$file = 'ip.txt';
file_put_contents($file, $ip);
?>
