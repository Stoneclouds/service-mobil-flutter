<?php
header("Content-Type: application/json");

include "koneksi.php";

$username = $_POST['username'];
$password = $_POST['password'];

$query = mysqli_query(
    $conn,
    "SELECT * FROM users
     WHERE username='$username'
     AND password='$password'"
);

if(mysqli_num_rows($query) > 0){

    $user = mysqli_fetch_assoc($query);

    echo json_encode([
        "status"=>"success",
        "user"=>[
            "id"=>$user['id'],
            "username"=>$user['username'],
            "role"=>$user['role']
        ]
    ]);

}else{

    echo json_encode([
        "status"=>"failed"
    ]);
}
?>