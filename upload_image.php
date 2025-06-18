<?php
$folder = "captures/";
if (!file_exists($folder)) {
    mkdir($folder, 0777, true);
}
$file = $folder . time() . ".jpg";
move_uploaded_file($_FILES["image"]["tmp_name"], $file);
?>
