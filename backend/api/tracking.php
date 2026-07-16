  <?php

header("Content-Type: application/json");
include "koneksi.php";

$user_id = $_GET['user_id'];

$query = mysqli_query(
    $conn,
    "SELECT *
     FROM booking
     WHERE user_id='$user_id'
     ORDER BY booking_date DESC, booking_time DESC
     LIMIT 1"
);

if(mysqli_num_rows($query)>0){

    $data = mysqli_fetch_assoc($query);

    echo json_encode([
        "status"=>"success",
        "data"=>$data
    ]);

}else{

    echo json_encode([
        "status"=>"empty"
    ]);

}

?>