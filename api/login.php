<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

$username = $data['username'];
$password = $data['password'];

$sql = "SELECT * FROM users 
WHERE (username_en='$username' OR username_ar='$username')
AND password='$password'";

$res = $conn->query($sql);

if($res->num_rows){
    echo json_encode(["status"=>"success"]);
}else{
    echo json_encode(["status"=>"error"]);
}
?>
