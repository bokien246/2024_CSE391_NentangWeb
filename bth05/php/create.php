<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kiemtra";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];

    $stmt = $conn->prepare("INSERT INTO employees (name, email, address, phone) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $name, $email, $address, $phone);

    if ($stmt->execute()) {
        echo "Thêm nhân viên thành công";
    } else {
        echo "Lỗi: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Phương thức yêu cầu không hợp lệ";
}

$conn->close();
?>
