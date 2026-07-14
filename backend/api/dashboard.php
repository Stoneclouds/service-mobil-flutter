<?php

header("Content-Type: application/json");

include("config/database.php");

$total = $conn->query("
SELECT COUNT(*) total
FROM booking
")->fetch_assoc()['total'];

$pending = $conn->query("
SELECT COUNT(*) total
FROM booking
WHERE status='Pending'
")->fetch_assoc()['total'];

$finished = $conn->query("
SELECT COUNT(*) total
FROM booking
WHERE status='Finished'
")->fetch_assoc()['total'];

echo json_encode([
    "booking"=>$total,
    "pending"=>$pending,
    "done"=>$finished,
    "points"=>$finished*10
]); 