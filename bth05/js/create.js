document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById('editForm');

    form.addEventListener('submit', async function(event) {
        event.preventDefault();

        const formData = new FormData(form);

        try {
            const response = await fetch('php/create.php', {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                alert('Thêm nhân viên thành công!');
                window.location.href = 'index.html'; // Chuyển hướng về trang index sau khi thêm thành công
            } else {
                console.error('Thêm nhân viên không thành công');
            }
        } catch (error) {
            console.error('Lỗi khi gửi yêu cầu thêm:', error);
        }
    });
});
