<?php

header("Content-Type: application/json");
include "koneksi.php";

$user_id = $_GET['user_id'];

$user = mysqli_fetch_assoc(
    mysqli_query(
        $conn,
        "SELECT id,username,role
         FROM users
         WHERE id='$user_id'"
    )
);

$totalBooking = mysqli_fetch_assoc(
    mysqli_query(
        $conn,
        "SELECT COUNT(*) total
         FROM booking
         WHERE user_id='$user_id'"
    )
)['total'];

$finished = mysqli_fetch_assoc(
    mysqli_query(
        $conn,
        "SELECT COUNT(*) total
         FROM booking
         WHERE user_id='$user_id'
         AND status='Finished'"
    )
)['total'];

echo json_encode([
    "status"=>"success",

    "data"=>[
        "username"=>$user["username"],
        "role"=>$user["role"],
        "booking"=>$totalBooking,
        "points"=>$finished*10
    ]
]);

?>