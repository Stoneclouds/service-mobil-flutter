<?php

include "../config/database.php";

$query = mysqli_query($conn,"
SELECT
booking.*,
users.username
FROM booking
JOIN users
ON booking.user_id = users.id
ORDER BY booking.id DESC
");

$data=[];

while($row=mysqli_fetch_assoc($query))
{
    $data[]=$row;
}

echo json_encode($data);

?>