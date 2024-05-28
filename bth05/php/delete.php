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
    if (isset($_POST['id'])) {
        $employeeId = $_POST['id'];
        
        $stmt = $conn->prepare("DELETE FROM employees WHERE id = ?");
        $stmt->bind_param("i", $employeeId);
        
        if ($stmt->execute()) {
            echo "Xóa thành công";
        } else {
            echo "Lỗi: " . $stmt->error;
        }
        $stmt->close();
        
    } elseif (isset($_POST['ids'])) {
        $employeeIds = json_decode($_POST['ids'], true);
        if (empty($employeeIds)) {
            echo "Không có nhân viên nào được chọn để xóa.";
            exit();
        }
        
        $placeholders = implode(',', array_fill(0, count($employeeIds), '?'));
        $types = str_repeat('i', count($employeeIds));
        $stmt = $conn->prepare("DELETE FROM employees WHERE id IN ($placeholders)");
        
        $stmt->bind_param($types, ...$employeeIds);
        
        if ($stmt->execute()) {
            echo "Xóa thành công";
        } else {
            echo "Lỗi: " . $stmt->error;
        }
        $stmt->close();
        
    } else {
        echo "Không có dữ liệu được gửi lên.";
    }
} else {
    echo "Phương thức yêu cầu không hợp lệ.";
}

$conn->close();
?>
