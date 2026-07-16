<?php

header("Content-Type: application/json");
include "koneksi.php";

$query = mysqli_query(
    $conn,
    "SELECT
        booking.id,
        users.username,
        booking.vehicle_name,
        booking.service_type,
        booking.booking_date,
        booking.booking_time,
        booking.status
     FROM booking
     JOIN users
        ON booking.user_id = users.id
     ORDER BY booking.id DESC"
);

$data = [];

while($row = mysqli_fetch_assoc($query)){
    $data[] = $row;
}

echo json_encode([
    "status"=>"success",
    "data"=>$data
]);

?>