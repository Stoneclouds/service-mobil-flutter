<?php
header("Content-Type: application/json");

include "koneksi.php";

$username      = $_POST['username'];
$keluhan       = $_POST['keluhan'];
$jenis_servis  = $_POST['jenis_servis'];
$prioritas     = $_POST['prioritas'];

$query = mysqli_query(
    $conn,
    "INSERT INTO services
    (username,keluhan,jenis_servis,prioritas,status)
    VALUES
    (
        '$username',
        '$keluhan',
        '$jenis_servis',
        '$prioritas',
        'Menunggu'
    )"
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