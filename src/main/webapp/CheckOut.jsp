<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Checkout Page</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        * {
            /*font-family: 'Material Symbols Outlined', sans-serif;*/
        }
        body {
            background-color: white
        }
        .imgCheckout {
            width: 10%;
            height: auto;
        }
        input[type="text"], select{
            border-radius: 5px;
            border-color: #28a745 !important;
            outline: none !important;
            box-shadow: none !important;
        }
        input[type="text"]:focus {
            outline: none !important;
            box-shadow: 0 4px 6px rgba(11, 53, 22, 0.8), 0 1px 3px rgba(40, 167, 69, 0.5) !important;
        }
        .text-primary, .badge {
            color: #28a745 !important;
        }
        .badge {
            background-color: #28a745 !important;
            border: none;
            color: white !important;
        }
        .table td:nth-child(4),
        .table th:nth-child(4){
            text-align: center;
            vertical-align: middle; /* Căn giữa theo chiều dọc */
        }
        input[type="radio"] {
            border: 2px solid #28a745!important;
            outline: none !important;
            box-shadow: none !important;
        }
        input[type="radio"]:checked{
            background-color: #28a745 !important;
            border-color: #28a745 !important;
            outline: none !important;
            box-shadow: none !important;
        }
        input[type="radio"]:focus, input[type="radio"]:active{
            outline: none !important;
            box-shadow: none !important;
        }
        .btn-primary {
            background: #28a745;
            color: white;
            gap: 20px;
            transition: all .2s;
            position: relative;
            outline: none !important;
            box-shadow: none !important;
        }
        .btn-primary:active {
            transform: translateY(-7px);
            outline: none !important;
            box-shadow: none !important;
        }
        .btn-primary:focus, .btn-primary:active {
            background: #28a745;
            outline: none !important;
            box-shadow: none !important;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            background: #28a745 !important;
            outline: none !important;
            box-shadow: none !important;
        }
    </style>
</head>

<body>
<div class="container">
    <main>
        <%--Hình checkout--%>
        <div class="py-5 text-center">
            <img class="imgCheckout d-block mx-auto mb-4" src="imageCheckout/pack.gif">
        </div>
        <%--Phần tổng--%>
        <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="mb-3 text-primary">Địa chỉ nhận hàng</h4>
                <%--Phần điền thông tin checkout--%>
                <form id="prescriptionForm">
                    <form class="needs-validation" novalidate enctype="multipart/form-data">
                        <div class="row g-3">
                            <%--Điển địa chỉ--%>
                            <div class="col-12">
                                <label for="address" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" name="address" id="address" placeholder="Số 02 đường Nguyễn Duy Trinh" required>
                                <div class="invalid-feedback">
                                    Hãy điền địa chỉ nhận hàng.
                                </div>
                            </div>
                            <%--Chọn thành phố--%>
                            <div class="col-md-6">
                                <label for="City" class="form-label">Thành phố</label>
                                <select name="city" class="form-select" id="City" required>
                                    <option value="">Chọn...</option>
                                    <option value="HoChiMinh">Hồ Chí Minh</option>
                                </select>
                                <div class="invalid-feedback">
                                    Hãy chọn Thành phố.
                                </div>
                            </div>
                            <%--Chọn quận/huyện--%>
                            <div class="col-md-6">
                                <label for="District" class="form-label">Quận/Huyện</label>
                                <select name="district" class="form-select" id="District" required>
                                    <option value="">Chọn...</option>
                                    <option>Quận 1</option>
                                    <option>Quận 3</option>
                                    <option>Quận 4</option>
                                    <option>Quận 5</option>
                                    <option>Quận 6</option>
                                    <option>Quận 7</option>
                                    <option>Quận 8</option>
                                    <option>Quận 9</option>
                                    <option>Quận 10</option>
                                    <option>Quận 11</option>
                                    <option>Quận 12</option>
                                    <option>Quận Tân Bình</option>
                                    <option>Quận Tân Phú</option>
                                    <option>Quận Bình Tân</option>
                                    <option>Quận Bình Thạnh</option>
                                    <option>Quận Gò Vấp</option>
                                    <option>Quận Phú Nhuận</option>
                                    <option>Thành phố Thủ Đức</option>
                                </select>
                                <div class="invalid-feedback">
                                    Hãy chọn Quận/Huyện.
                                </div>
                            </div>
                        </div>
                        <hr class="my-4">
                        <%--Điền phương thức thanh toán--%>
                        <h4 class="mb-3 text-primary">Phương thức thanh toán</h4>
                        <div class="my-3">
                            <div class="form-check">
                                <input id="COD" name="paymentMethod" type="radio" class="form-check-input" value="Tiền mặt" checked required>
                                <label class="form-check-label" for="COD">Thanh toán khi nhận hàng</label>
                            </div>
                            <div class="form-check">
                                <input id="Momo" name="paymentMethod" type="radio" class="form-check-input" value="Momo" required>
                                <label class="form-check-label" for="Momo">Thanh toán bằng Momo</label>
                            </div>
                        </div>
                        <hr class="my-4">
                        <button class="w-100 btn btn-primary btn-primary-animated btn-lg" id="orderButton" type="button">Đặt hàng</button>
                    </form>
                </form>
            </div>

            <%--Phần các sản phẩm đã mua--%>
            <form class="col-md-7 col-lg-8">
                <%--Đơn hàng của bạn--%>
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Đơn hàng của bạn</span>
                </h4>

                <table class="table mb-3" id="medicinesTable">
                    <thead>
                    <tr>
                        <th scope="col">Tên thuốc</th>
                        <th scope="col">Danh mục thuốc</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${sessionScope.khachHang.getLastOrder().danhSachSanPham}">
                        <tr data-ke-don="${p.sanPham.sanPham.loaiThuoc.danhMucThuoc.tenDanhMucThuoc == 'Thuốc kê đơn' ? 'true' : 'false'}">
                            <td>${p.sanPham.sanPham.tenSanPham}</td>
                            <td>${p.sanPham.sanPham.loaiThuoc.danhMucThuoc.tenDanhMucThuoc}</td>
                            <td>${p.soLuongMua}</td>
                            <td>${p.tongGiaTien}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                    <form class="needs-validation" novalidate enctype="multipart/form-data">
                        <div class="mb-3">
                            <h4 class="mb-3 text-primary">Gửi đơn thuốc</h4>
                            <input type="text" class="form-control" id="Prescription" placeholder="https://drive.google.com/file/d/<FILE_ID>/view?usp=sharing">
                            <div class="invalid-feedback">
                                Hãy nhập link drive đơn thuốc.
                            </div>
                        </div>
                    </form>
            </form>
            <script>
                document.getElementById("orderButton").addEventListener("click", function (e) {
                    let requireImage = false;

                    // Kiểm tra nếu có thuốc kê đơn trong danh sách sản phẩm
                    document.querySelectorAll("tr[data-ke-don='true']").forEach(function (row) {
                        requireImage = true; // Nếu có ít nhất một sản phẩm kê đơn
                    });

                    if (requireImage) {
                        // Lấy giá trị từ trường nhập link ảnh
                        let imageLink = document.getElementById("Prescription").value.trim();

                        // Kiểm tra nếu chưa nhập link ảnh
                        if (imageLink === "") {
                            alert("Vui lòng nhập link ảnh đơn thuốc cho thuốc kê đơn trước khi đặt hàng!");
                            e.preventDefault(); // Ngừng hành động đặt hàng
                            return;
                        }
                    }

                    // Nếu tất cả điều kiện đều thỏa mãn, gửi form đến servletDatHang
                    document.getElementById("prescriptionForm").action = "servletCheckOut";  // Chuyển hướng action của form tới servletDatHang
                    document.getElementById("prescriptionForm").submit(); // Gửi form
                });
            </script>
            </div>
        </div>
    </main>
</div>
</body>
</html>
