<?php
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "kiemtra"; 


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$address = $_POST['address'];
$phone = $_POST['phone'];

$sql = "UPDATE employees SET name=?, email=?, address=?, phone=? WHERE id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssi", $name, $email, $address, $phone, $id);

if ($stmt->execute()) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}


$stmt->close();
$conn->close();
?>
