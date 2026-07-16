<?php

header("Content-Type: application/json");

include("../config/database.php");

$user_id=$_GET['user_id'];

$result=$conn->query("
SELECT
vehicle_name,
vehicle_number,
service_type,
status,
booking_date
FROM booking
WHERE user_id='$user_id'
ORDER BY id DESC
");

$data=[];

while($row=$result->fetch_assoc()){

$data[]=$row;

}

echo json_encode($data);