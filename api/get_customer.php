<?php
include "db.php";

$card = $_GET['card'];

$res = $conn->query("SELECT * FROM customers WHERE card_number='$card'");
echo json_encode($res->fetch_assoc());
?>
