<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #22AA4A;
            color: white;
            text-align: center;
        }
        .table td {
            vertical-align: middle;
            text-align: center;
        }
        .table td img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }
        .price-old {
            font-size: 0.9rem;
            color: #6c757d;
            text-decoration: line-through;
        }
        .price-new {
            font-size: 1.2rem;
            color: #007bff;
            font-weight: bold;
        }
        .btn-quantity {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border: 1px solid #dee2e6;
            color: #6c757d;
        }
        .btn-quantity:hover {
            background-color: #f1f1f1;
        }
        .input-quantity {
            width: 60px;
            text-align: center;
            border: 1px solid #dee2e6;
            border-radius: 8px;
        }
        .btn-danger {
            font-size: 0.9rem;
        }
        .badge {
            font-size: 0.8rem;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .checkout-summary {
            background-color: /*#fff3cd*/ white;
            border: 1px solid /*#ffeeba*/ white;
            border-radius: 10px;
            position: sticky;
            top: 20px;
            z-index: 100;
        }

        /* Media queries */
        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.9rem;
            }
            .table td img {
                width: 60px;
                height: 60px;
            }
            .input-quantity {
                width: 50px;
            }
            .btn-quantity {
                width: 30px;
                height: 30px;
            }
            .checkout-summary {
                position: relative;
                top: auto;
                margin-top: 20px;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }
            .table th, .table td {
                font-size: 0.8rem;
            }
            .input-quantity {
                width: 40px;
            }
            .btn-quantity {
                width: 25px;
                height: 25px;
            }
            .checkout-summary {
                margin-top: 15px;
            }
        }

    </style>
</head>
<body>
<div class="container my-4">
    <div class="row"><h5 class="mb-3"><input type="checkbox" class="checkbox-custom me-2">Chọn tất cả</h5></div>
    <div class="row">
        <!-- Danh sách sản phẩm -->
        <div class="col-md-8">
            <div class="card p-3">
                <table class="table table-bordered align-middle text-center">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Thông tin sản phẩm</th>
                        <th>Giá thành</th>
                        <th>Số lượng</th>
                        <th>Đơn vị</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Sản phẩm sẽ lặp lại như trên -->
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox-custom"></td>
                        <td class="d-flex align-items-center">
                            <img src="screenshot_1732016932.png" alt="Sản phẩm">
                            <div class="ms-3 text-start">
                                <h6 class="mb-1">Hỗn dịch uống men vi sinh Enterogermina Gut Defense Sanofi</h6>
                                <p class="small text-muted mb-1">Tăng cường tiêu hóa, hỗ trợ bảo vệ...</p>
                                <div class="badge bg-primary text-white">Giảm ngay 10% áp dụng đến 30/11</div>
                            </div>
                        </td>
                        <td>
                            <p>
                                <span class="price-old">184.000đ</span><br>
                                <span class="price-new">165.000đ</span>
                            </p>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="btn btn-quantity">-</button>
                                <input type="text" value="1" class="input-quantity mx-2">
                                <button class="btn btn-quantity">+</button>
                            </div>
                        </td>
                        <td>Hộp</td>
                        <td><button class="btn btn-danger">Xóa</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Thanh toán -->
        <div class="col-md-4">
            <div class="card p-3 checkout-summary">
                <h6 class="mb-3"><strong>Tóm tắt thanh toán</strong></h6>
                <div class="d-flex justify-content-between">
                    <span>Tổng tiền</span>
                    <span>165.000đ</span>
                </div>
                <hr>
                <div class="d-flex justify-content-between">
                    <strong>Thành tiền</strong>
                    <strong class="text-danger">165.000đ</strong>
                </div>
                <button class="btn btn-primary w-100 mt-3">Mua hàng</button>
                <p class="text-muted small mt-3">
                    Bằng việc tiến hành đặt mua hàng, bạn đồng ý với
                    <a href="#">Điều khoản dịch vụ</a> và
                    <a href="#">Chính sách xử lý dữ liệu cá nhân</a>.
                </p>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Lấy checkbox "Chọn tất cả" và các checkbox sản phẩm
    const selectAllCheckbox = document.querySelector('.checkbox-custom.me-2'); // Checkbox "Chọn tất cả"
    const productCheckboxes = document.querySelectorAll('.checkbox-custom:not(.me-2)'); // Các checkbox sản phẩm

    // Lắng nghe sự kiện thay đổi trên checkbox "Chọn tất cả"
    selectAllCheckbox.addEventListener('change', function () {
        productCheckboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    });

    // Lắng nghe sự thay đổi từng checkbox sản phẩm để cập nhật trạng thái của checkbox "Chọn tất cả"
    productCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            const allChecked = Array.from(productCheckboxes).every(cb => cb.checked);
            const anyChecked = Array.from(productCheckboxes).some(cb => cb.checked);

            // Nếu tất cả được chọn, checkbox "Chọn tất cả" được đánh dấu
            selectAllCheckbox.checked = allChecked;

            // Nếu không checkbox nào được chọn, checkbox "Chọn tất cả" không được đánh dấu
            selectAllCheckbox.indeterminate = !allChecked && anyChecked;
        });
    });
</script>
</body>
</html>
