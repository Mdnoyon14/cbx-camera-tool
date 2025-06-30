<?php
if(isset($_FILES['image']['tmp_name'])){
 
  $upload_dir = "captures/"; 
  $file_name = time() . ".jpg";
  move_uploaded_file($_FILES['image']['tmp_name'], $upload_dir . $file_name);
}
?>
