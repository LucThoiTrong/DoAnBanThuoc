<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý kho - Đặt thêm hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #e9ecef;
        }
        .table-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .btn-add, .btn-confirm-changes {
            background-color: #007bff;
            color: white;
        }
        .btn-add:hover, .btn-confirm-changes:hover {
            background-color: #0056b3;
        }
        .highlight {
            color: #ffc107;
            font-weight: bold;
        }
        .arrow-up {
            color: #ffc107;
            font-size: 18px;
        }
        .order-frame-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1050;
        }

        .order-frame {
            width: 80%;
            max-width: 700px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
            overflow-y: auto;
        }

        .order-frame-header {
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 15px;
        }

        .order-frame-footer {
            margin-top: 15px;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">Vitamin A+</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#DonNhapHang">Đơn nhập hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đăng xuất</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold">Quản lý tồn kho</h3>
        <input type="text" id="searchInput" class="form-control w-25" placeholder="Tìm kiếm mã/tên thuốc...">
    </div>
    <div class="table-card p-4">
        <table class="table table-bordered align-middle">
            <thead class="table-primary text-center">
            <tr>
                <th>Mã thuốc</th>
                <th>Tên thuốc</th>
                <th>Đơn vị tính</th>
                <th>Giá bán</th>
                <th>Giá nhập</th>
                <th>Số lượng hiện tại</th>
                <th>Đặt thêm</th>
            </tr>
            </thead>
            <tbody id="productTable">
            <c:forEach var="chiTiet" items="${productList}">
                <tr data-product-id="${chiTiet.id}">
                    <td class="text-center">${chiTiet.id}</td>
                    <td class="name">${chiTiet.sanPham.tenSanPham}</td>
                    <td class="text-center" data-unit-id="${chiTiet.donViTinh.id}">${chiTiet.donViTinh.tenDonViTinh}</td>
                    <td class="text-end">${chiTiet.giaBan}đ</td>
                    <td class="text-end">${chiTiet.giaNhap}đ</td>
                    <td class="text-center quantity-cell" data-quantity="${chiTiet.soLuongSanPhamTrongKho}">${chiTiet.soLuongSanPhamTrongKho}</td>
                    <td class="text-center">
                        <button class="btn btn-sm btn-add"
                                data-bs-toggle="modal"
                                data-bs-target="#orderModal">Nhập thêm</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- Xác nhận thay đổi -->
        <div class="text-start mt-3">
            <button class="btn btn-confirm-changes" id="confirmChangesBtnTable">Xác nhận thay đổi</button>
        </div>
    </div>
</div>

<!-- Frame Đơn nhập hàng -->
<div class="order-frame-overlay d-none" id="orderFrameOverlay">
    <div class="order-frame">
        <div class="order-frame-header d-flex justify-content-between align-items-center">
            <h5 class="fw-bold">Đơn nhập hàng</h5>
            <button type="button" class="btn-close" id="closeOrderFrameBtn" aria-label="Close"></button>
        </div>
        <div class="order-frame-body">
            <table class="table table-bordered align-middle">
                <thead class="table-secondary text-center">
                <tr>
                    <th>Mã thuốc</th>
                    <th>Tên thuốc</th>
                    <th>Đơn vị tính</th>
                    <th>Giá nhập</th>
                    <th>Số lượng nhập thêm</th>
                    <th>Xóa</th>
                </tr>
                </thead>
                <tbody id="orderDetailsTable"></tbody>
            </table>
        </div>
        <div class="order-frame-footer text-end">
            <button class="btn btn-primary" id="submitOrderFrame">Xác nhận đơn</button>
        </div>
    </div>
</div>

<!-- Order Modal -->
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel" style="font-weight: bold">Nhập thêm hàng?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="orderForm">
                    <div class="mb-3">
                        <label for="product-name" class="form-label" style="font-weight: bold">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="product-name" style="cursor: default" readonly>
                    </div>
                    <div class="mb-3" style="display: flex; justify-content: space-between">
                        <div>
                            <label for="product-unit" class="form-label" style="font-weight: bold">Đơn vị</label>
                            <input type="text" class="form-control" id="product-unit" style="cursor: default" readonly>
                        </div>
                        <div>
                            <label for="quantity" class="form-label" style="font-weight: bold">Số lượng cần nhập thêm</label>
                            <input type="number" class="form-control" id="quantity" min="1" placeholder="Nhập số lượng" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Xác nhận</button>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Hàm tìm kiếm
    const searchInput = document.getElementById('searchInput');
    const productTable = document.getElementById('productTable');
    // Hàm loại bỏ dấu tiếng Việt
    function removeAccents(str) {
        return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/đ/g, 'd').replace(/Đ/g, 'D');
    }
    // TÌm kiếm bằng tên sản phẩm
    searchInput.addEventListener('input', () => {
        const filter = removeAccents(searchInput.value.toLowerCase());
        const rows = Array.from(productTable.querySelectorAll('tr[data-product-id]'));
        const matchedProducts = new Set();

        // Find matching products
        rows.forEach(row => {
            const productId = row.getAttribute('data-product-id');
            const productName = removeAccents(row.querySelector('td:nth-child(2)').textContent.toLowerCase());
            if (productId.toLowerCase().includes(filter) || productName.includes(filter)) {
                matchedProducts.add(productId);
            }
        });
        // Hiện các sản phẩm khớp
        rows.forEach(row => {
            const productId = row.getAttribute('data-product-id');
            row.style.display = matchedProducts.has(productId) ? '' : 'none';
        });
    });

    const orderFrameOverlay = document.getElementById('orderFrameOverlay');
    const closeOrderFrameBtn = document.getElementById('closeOrderFrameBtn');
    const submitOrderFrame = document.getElementById('submitOrderFrame');

    const addButtons = document.querySelectorAll('.btn-add');

    // Mở frame Đơn nhập hàng
    document.querySelector('.nav-link[href="#DonNhapHang"]').addEventListener('click', () => {
        orderFrameOverlay.classList.remove('d-none');
    });

    // Đóng frame Đơn nhập hàng
    closeOrderFrameBtn.addEventListener('click', () => {
        orderFrameOverlay.classList.add('d-none');
    });

    const orderModal = document.getElementById('orderModal');
    const productNameInput = document.getElementById('product-name');
    const productUnitInput = document.getElementById('product-unit');
    const quantityInput = document.getElementById('quantity');
    const orderDetailsTable = document.getElementById('orderDetailsTable');

    // Khi nhấn nút "Nhập thêm" trong bảng chính
    document.querySelectorAll('.btn-add').forEach(button => {
        button.addEventListener('click', (event) => {
            const row = event.target.closest('tr'); // Lấy dòng hiện tại
            const productName = row.querySelector('.name').textContent.trim(); // Lấy tên sản phẩm
            const productUnit = row.querySelector('td[data-unit-id]').textContent.trim(); // Lấy đơn vị tính
            const productId = row.getAttribute('data-product-id'); // Lấy mã sản phẩm

            // Đưa dữ liệu vào modal
            productNameInput.value = productName;
            productUnitInput.value = productUnit;
            quantityInput.value = ""; // Xóa số lượng cũ
            quantityInput.setAttribute('data-product-id', productId); // Gắn mã sản phẩm vào input số lượng
        });
    });

    // Xử lý khi nhấn "Xác nhận" trong modal
    document.getElementById('orderForm').addEventListener('submit', (e) => {
        e.preventDefault();

        // Lấy thông tin từ modal
        const productName = productNameInput.value;
        const productUnit = productUnitInput.value;
        const productId = quantityInput.getAttribute('data-product-id');
        const quantity = parseInt(quantityInput.value);

        if (!quantity || quantity < 1) {
            alert('Số lượng phải lớn hơn 0');
            return;
        }

        // Kiểm tra sản phẩm đã tồn tại trong bảng "Đơn nhập hàng"
        let existingRow = Array.from(orderDetailsTable.querySelectorAll('tr'))
            .find(row => row.getAttribute('data-product-id') === productId);

        if (existingRow) {
            // Nếu sản phẩm đã tồn tại, cộng dồn số lượng
            const quantityCell = existingRow.querySelector('.quantity-cell');
            const existingQuantity = parseInt(quantityCell.textContent);
            quantityCell.textContent = existingQuantity + quantity;
        } else {
            // Nếu chưa tồn tại, thêm sản phẩm mới
            const newRow = document.createElement('tr');
            newRow.setAttribute('data-product-id', productId);
            newRow.innerHTML = `
        <td>${productId}</td>
        <td>${productName}</td>
        <td>${productUnit}</td>
        <td>${productPrice}</td>
        <td class="text-center quantity-cell">${quantity}</td>
        <td class="text-center">
          <button class="btn btn-sm btn-danger remove-row">Xóa</button>
        </td>
      `;

            // Thêm sự kiện xóa cho nút "Xóa"
            newRow.querySelector('.remove-row').addEventListener('click', (e) => {
                e.target.closest('tr').remove();
            });

            // Thêm dòng vào bảng "Đơn nhập hàng"
            orderDetailsTable.appendChild(newRow);
        }

        // Đóng modal
        bootstrap.Modal.getInstance(orderModal).hide();
    });

    // Xử lý khi nhấn nút "Xác nhận đơn"
    submitOrderFrame.addEventListener('click', () => {
        const orderRows = Array.from(orderDetailsTable.querySelectorAll('tr'));

        if (orderRows.length === 0) {
            return alert('Chưa có sản phẩm nào trong đơn!');
        }

        const orderData = orderRows.map(row => {
            const cells = row.querySelectorAll('td');
            return {
                name: cells[0].textContent,
                unit: cells[1].textContent,
                quantity: cells[2].textContent
            };
        });

        console.log('Đơn nhập hàng đã được xác nhận:', orderData);

        // Sau khi xử lý xong, đóng frame
        orderFrameOverlay.classList.add('d-none');
        orderDetailsTable.innerHTML = ''; // Xóa dữ liệu cũ
    });

</script>
</body>
</html>