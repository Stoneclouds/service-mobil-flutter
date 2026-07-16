<?php

header("Content-Type: application/json");

include("../config/database.php");

$data=json_decode(file_get_contents("php://input"),true);

$id=$data['id'];

$status=$data['status'];

$conn->query("
UPDATE booking
SET status='$status'
WHERE id='$id'
");

echo json_encode([
"success"=>true
]);