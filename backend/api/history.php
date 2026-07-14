<?php

header("Content-Type: application/json");
include "koneksi.php";

$user_id = $_GET['user_id'];

$query = mysqli_query(
    $conn,
    "SELECT *
     FROM booking
     WHERE user_id='$user_id'
     ORDER BY booking_date DESC, booking_time DESC"
);

$data = [];

while($row = mysqli_fetch_assoc($query)){
    $data[] = $row;
}

echo json_encode([
    "status" => "success",
    "data" => $data
]);

?>