<?php

$host = "localhost";
$user = "root";
$pass = "";
$db   = "servis_mobil";

$conn = new mysqli($host,$user,$pass,$db);

if($conn->connect_error){
    die("Connection failed");
}

$conn->set_charset("utf8");