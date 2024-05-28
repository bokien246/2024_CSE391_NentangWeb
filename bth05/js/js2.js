const urlParams = new URLSearchParams(window.location.search);
const employeeId = urlParams.get('id');

const form = document.querySelector('form');

if (employeeId) {
    fetch(`php/get_employee.php?id=${employeeId}`)
        .then(response => response.json())
        .then(employee => {
            console.log('Employee data:', employee); // Kiểm tra dữ liệu trả về
            if (employee.error) {
                console.error(employee.error);
            } else {
                document.getElementById('employeeId').value = employeeId; // Đặt giá trị cho trường ẩn
                document.getElementById('name').value = employee.name;
                document.getElementById('email').value = employee.email;
                document.getElementById('address').value = employee.address;
                document.getElementById('phone').value = employee.phone;
            }
        })
        .catch(error => {
            console.error('Lỗi khi lấy dữ liệu nhân viên:', error);
        });
} else {
    console.error('Không tìm thấy employeeId trong URL');
}

form.addEventListener('submit', async (event) => {
    event.preventDefault();

    const formData = new FormData(form);

    try {
        const response = await fetch('php/update_employee.php', {
            method: 'POST',
            body: formData
        });

        if (response.ok) {
            alert('Cập nhật thành công!');
            window.location.href = 'index.html';
        } else {
            console.error('Cập nhật không thành công');
        }
    } catch (error) {
        console.error('Lỗi khi gửi yêu cầu cập nhật:', error);
    }
});
