<?php
$servername = "localhost";
$username = "root";
$password = ""; // Điền mật khẩu MySQL của bạn
$dbname = "kiemtra"; // Thay đổi tên cơ sở dữ liệu của bạn

header('Content-Type: application/json');

// Kết nối tới cơ sở dữ liệu
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Kiểm tra xem có 'id' trong URL không
if (!isset($_GET['id'])) {
    echo json_encode(["error" => "No employee id provided"]);
    $conn->close();
    exit();
}

$employeeId = $_GET['id'];

// Truy vấn lấy thông tin nhân viên dựa trên id
$sql = "SELECT id, name, email, address, phone FROM employees WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $employeeId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $employee = $result->fetch_assoc();
    echo json_encode($employee);
} else {
    echo json_encode(["error" => "Employee not found"]);
}

$stmt->close();
$conn->close();
?>
