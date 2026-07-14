<?php

header("Content-Type: application/json");

include("../config/database.php");

$data = json_decode(file_get_contents("php://input"), true);

$user_id = $data['user_id'];
$vehicle_name = $data['vehicle_name'];
$vehicle_number = $data['vehicle_number'];
$service_type = $data['service_type'];
$booking_date = $data['booking_date'];
$booking_time = $data['booking_time'];
$notes = $data['notes'];

$sql = "INSERT INTO booking(
user_id,
vehicle_name,
vehicle_number,
service_type,
booking_date,
booking_time,
notes
)
VALUES(?,?,?,?,?,?,?)";

$stmt = $conn->prepare($sql);

$stmt->bind_param(
"issssss",
$user_id,
$vehicle_name,
$vehicle_number,
$service_type,
$booking_date,
$booking_time,
$notes
);

if($stmt->execute()){

echo json_encode([
"success"=>true,
"message"=>"Booking berhasil"
]);

}else{

echo json_encode([
"success"=>false,
"message"=>"Booking gagal"
]);

}