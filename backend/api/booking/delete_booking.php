<?php

header("Content-Type: application/json");

include("../config/database.php");

$id=$_GET['id'];

$conn->query("
DELETE FROM booking
WHERE id='$id'
");

echo json_encode([
"success"=>true
]);