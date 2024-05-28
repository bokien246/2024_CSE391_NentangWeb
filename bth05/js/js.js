document.addEventListener("DOMContentLoaded", function() {
    const itemsPerPage = 10;
    let currentPage = 1;
    let data = [];
    let filteredData = [];

    function fetchData() {
        return fetch('php/data.php')
            .then(response => response.json())
            .then(fetchedData => {
                data = fetchedData;
                filteredData = data;
            })
            .catch(error => {
                console.error('Fetch error:', error);
            });
    }

    function updateTable() {
        const tableBody = document.getElementById('tableBody');
        tableBody.innerHTML = '';

        const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pageData = filteredData.slice(start, end);

        pageData.forEach(employee => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td><input type="checkbox" data-employee-id="${employee.id}"></td>
                <td>${employee.name}</td>
                <td>${employee.email}</td>
                <td>${employee.address}</td>
                <td>${employee.phone}</td>
                <td>
                    <i class="bi-pencil-fill bg-yellow m-3" data-employee-id="${employee.id}"></i>
                    <i class="bi bi-trash-fill bg-red" data-employee-id="${employee.id}"></i>
                </td>
            `;
            tableBody.appendChild(row);

            const editIcon = row.querySelector('.bi-pencil-fill');
            editIcon.addEventListener('click', () => {
                window.location.href = `edit.html?id=${employee.id}`;
            });

            const deleteIcon = row.querySelector('.bi-trash-fill');
            deleteIcon.addEventListener('click', () => handleDeleteButtonClick(employee.id));
        });

        document.getElementById('pagination-info').innerText = `Hiển thị ${pageData.length} / ${filteredData.length} bản ghi`;
    }

    function updatePagination() {
        const pagination = document.querySelector('.pagination');
        pagination.innerHTML = '';

        const prevLink = document.createElement('a');
        prevLink.textContent = 'Trước';
        prevLink.href = '#';
        prevLink.id = 'prev-page';
        prevLink.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                updateTable();
                updatePagination();
            }
        });
        pagination.appendChild(prevLink);

        const numPages = Math.ceil(filteredData.length / itemsPerPage);
        for (let i = 1; i <= numPages; i++) {
            const pageLink = document.createElement('a');
            pageLink.textContent = i;
            pageLink.href = '#';
            pageLink.className = 'page-link';
            if (i === currentPage) {
                pageLink.classList.add('active');
            }
            pageLink.addEventListener('click', () => {
                currentPage = i;
                updateTable();
                updatePagination();
            });
            pagination.appendChild(pageLink);
        }

        const nextLink = document.createElement('a');
        nextLink.textContent = 'Sau';
        nextLink.href = '#';
        nextLink.id = 'next-page';
        nextLink.addEventListener('click', () => {
            if (currentPage < numPages) {
                currentPage++;
                updateTable();
                updatePagination();
            }
        });
        pagination.appendChild(nextLink);
    }

    async function handleDeleteButtonClick(employeeId) {
        if (confirm(`Bạn có chắc chắn muốn xóa nhân viên có ID ${employeeId}?`)) {
            try {
                const response = await fetch('php/delete.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `id=${employeeId}`,
                });

                if (response.ok) {
                    await fetchData();
                    updateTable();
                    updatePagination();
                } else {
                    console.error('Xóa không thành công');
                }
            } catch (error) {
                console.error('Lỗi khi xóa:', error);
            }
        }
    }

    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        filteredData = data.filter(employee => 
            employee.name.toLowerCase().includes(searchTerm) ||
            employee.email.toLowerCase().includes(searchTerm) ||
            employee.address.toLowerCase().includes(searchTerm) ||
            employee.phone.includes(searchTerm)
        );
        currentPage = 1;
        updateTable();
        updatePagination();
    });

    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('#tableBody input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });

    document.getElementById('deleteSelected').addEventListener('click', async function() {
        const selectedIds = Array.from(document.querySelectorAll('#tableBody input[type="checkbox"]:checked'))
            .map(checkbox => checkbox.getAttribute('data-employee-id'));

        if (selectedIds.length > 0 && confirm(`Bạn có chắc chắn muốn xóa các nhân viên đã chọn?`)) {
            try {
                const response = await fetch('php/delete.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `ids=${JSON.stringify(selectedIds)}`,
                });

                if (response.ok) {
                    await fetchData();
                    updateTable();
                    updatePagination();
                } else {
                    console.error('Xóa không thành công');
                }
            } catch (error) {
                console.error('Lỗi khi xóa:', error);
            }
        }
    });

    fetchData().then(() => {
        updateTable();
        updatePagination();
    });
});
