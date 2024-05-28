<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kiemtra";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Cập nhật dữ liệu khi form được submit
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];

    $sql = "UPDATE employees SET name='$name', email='$email', address='$address', phone='$phone' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Cập nhật thành công";
        // Chuyển hướng về trang danh sách sau khi cập nhật
        header("Location: index.php"); 
        exit();
    } else {
        echo "Lỗi: " . $conn->error;
    }
}

$conn->close();
?>