<?php
header("Content-Type: application/json");

include "koneksi.php";

$id     = $_POST['id'];
$status = $_POST['status'];

$query = mysqli_query(
    $conn,
    "UPDATE services
     SET status='$status'
     WHERE id='$id'"
);

if($query){

    echo json_encode([
        "status"=>"success"
    ]);

}else{

    echo json_encode([
        "status"=>"failed"
    ]);
}
?>