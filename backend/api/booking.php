<?php

header("Content-Type: application/json");
include "koneksi.php";

$user_id        = $_POST['user_id'];
$vehicle_name   = $_POST['vehicle_name'];
$vehicle_number = $_POST['vehicle_number'];
$service_type   = $_POST['service_type'];
$booking_date   = $_POST['booking_date'];
$booking_time   = $_POST['booking_time'];
$notes          = $_POST['notes'];

$query = mysqli_query(
    $conn,
    "INSERT INTO booking
    (
        user_id,
        vehicle_name,
        vehicle_number,
        service_type,
        booking_date,
        booking_time,
        notes,
        status
    )
    VALUES
    (
        '$user_id',
        '$vehicle_name',
        '$vehicle_number',
        '$service_type',
        '$booking_date',
        '$booking_time',
        '$notes',
        'Pending'
    )"
);

if($query){

    echo json_encode([
        "status"=>"success"
    ]);

}else{

    echo json_encode([
        "status"=>"failed",
        "error"=>mysqli_error($conn)
    ]);

}