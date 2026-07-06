<?php

$host = "localhost";
$user = "root";
$pass = "";
$db   = "servis_mobil";

$conn = mysqli_connect($host,$user,$pass,$db);

if(!$conn){
    die("Koneksi gagal");
}
?>