<?php
$servername = "localhost";
$username = "root";
$password = ""; // Điền mật khẩu MySQL của bạn
$dbname = "kiemtra"; // Thay đổi tên cơ sở dữ liệu của bạn

header('Content-Type: application/json');

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

$sql = "SELECT id, name, email, address, phone FROM employees";
$result = $conn->query($sql);

if (!$result) {
    echo json_encode(["error" => "Query failed: " . $conn->error]);
    $conn->close();
    exit();
}

$employees = array();
while ($row = $result->fetch_assoc()) {
    $employees[] = $row;
}

$conn->close();

echo json_encode($employees);
?>
