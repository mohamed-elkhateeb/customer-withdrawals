<?php
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

$card = $data['card'];
$amount = $data['amount'];

$cust = $conn->query("SELECT * FROM customers WHERE card_number='$card'")->fetch_assoc();

$remaining = $cust['credit_limit'] - $cust['used_amount'];

if($amount > $remaining){
    echo json_encode(["status"=>"no_balance"]);
    exit;
}

$conn->query("UPDATE customers SET used_amount = used_amount + $amount WHERE id=".$cust['id']);

$conn->query("INSERT INTO withdrawals (customer_id,amount) 
VALUES (".$cust['id'].",$amount)");

echo json_encode(["status"=>"success"]);
?>
