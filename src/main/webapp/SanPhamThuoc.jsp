<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Layout</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="sanpham.css">
    <!-- <link rel="stylesheet" href="card(chinh).css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<!-- Header -->

<!-- Body -->
<!-- my-4 là margin ở trên - dưới -->
<div class="row">
    <jsp:include page="header.html"/>
</div>
<div class="container my-4" >
    <div class="row" style="margin-top: 30px">
        <!-- Bộ lọc bên trái -->
        <div class="col-md-3" style="margin-bottom: 15px" >
            <div class="card" style="margin-right: 10px; position: sticky; top: 0;">
                <div class="card-header custom-card-header">
                    Bộ lọc nâng cao
                </div>
                <div class="card-body">
                    <form>
                        <div class="mb-3">
                            <label for="category" class="form-label">Danh mục</label>
                            <select class="form-select" id="category">
                                <option>Chọn danh mục</option>
                                <option value="1">Thuốc không kê đơn</option>
                                <option value="2">Thuốc kê đơn</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Loại thuốc</label>
                            <select class="form-select">
                                <option>Chọn loại thuốc</option>
                                <option value="1">Thuốc kháng dị ứng</option>
                                <option value="2">Thuốc kháng viêm</option>
                                <option value="3">Thuốc cảm lạnh</option>
                                <option value="4">Thuốc tiêu hóa</option>
                                <option value="5">Thuốc thần kinh</option>
                                <option value="6">Thuốc kháng sinh</option>
                                <option value="7">Thuốc ung thư</option>
                                <option value="8">Thuốc tiết niệu</option>
                                <option value="9">Vitamin & khoáng chất</option>
                                <option value="10">Thuốc tim mạch, huyết áp</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="form-label">Giá bán</div>
                            <div class="btn-group-vertical filter-button-group" role="group" aria-label="Price Filter">
                                <button type="button" class="btn active">Dưới 100.000đ</button>
                                <button type="button" class="btn">100.000đ đến 300.000đ</button>
                                <button type="button" class="btn">300.000đ đến 500.000đ</button>
                                <button type="button" class="btn">Trên 500.000đ</button>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Độ tuổi sử dụng</label>
                            <select class="form-select">
                                <option>Tất cả</option>
                                <option value="Trẻ em">Trẻ em</option>
                                <option value="Người lớn">Người lớn</option>
                                <option value="Người cao tuổi">Người cao tuổi</option>
                                <option value="Trẻ sơ sinh">Trẻ sơ sinh</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Nơi sản xuất</label>
                            <select class="form-select">
                                <option>Tất cả</option>
                                <option value="Việt Nam">Việt Nam</option>
                                <option value="Nhật Bản">Nhật Bản</option>
                                <option value="Pháp">Pháp</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Thương hiệu</label>
                            <select class="form-select">
                                <option>Tất cả</option>
                                <option value="Imexpharm">Imexpharm</option>
                                <option value="Stella Pharm">Stella Pharm</option>
                                <option value="Dhg">Dhg</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Khu vực sản phẩm bên phải -->
        <div class="col-md-9">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="h5">Sản phẩm</h2>
                <div>
                    <label for="sort" class="me-2">Sắp xếp:</label>
                    <select id="sort" class="form-select form-select-sm d-inline-block w-auto">
                        <option value="price-asc">Giá tăng dần</option>
                        <option value="price-desc">Giá giảm dần</option>
                    </select>
                </div>
            </div>
            <div class="product-list">
                <!-- Thẻ sản phẩm -->
                <ul class="product_listSP">
                    <c:forEach var="product" items="${productList}">
                        <li>
                            <a href="${product.linkChiTietSanPham}" style="text-decoration: none;color: black">
                                <div class="product_card">
                                    <div class="basicInfo">
                                        <div class="name">${product.tenSanPham}</div>
                                        <div class="img">
                                            <img src="${product.anhSanPham}" alt="ảnh sản phẩm">
                                        </div>
                                        <div>
                                            <div class="button_thuoc">
                                                <c:forEach var="p" items="${product.cacChiTietSanPham}">
                                                    <a class="button" onclick="showPrice(${p.giaBan}, '${p.donViTinh.tenDonViTinh}', this, toggleSelected(this))">
                                                            ${p.donViTinh.tenDonViTinh}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                            <div class="mores">
                                                <div class="price"></div> <!-- Giá sẽ được hiển thị ở đây -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    // Hàm để thiết lập giá của đơn vị tính đầu tiên cho tất cả sản phẩm
    window.onload = function () {
        // Lấy tất cả các thẻ sản phẩm
        var productCards = document.querySelectorAll('.product_card');

        productCards.forEach(function (card) {
            // Lấy giá và đơn vị tính của đơn vị tính đầu tiên trong sản phẩm
            var firstProductDetail = card.querySelector('.button_thuoc a');
            if (firstProductDetail) {
                // Lấy giá và đơn vị tính từ thuộc tính 'onclick'
                var match = firstProductDetail.getAttribute('onclick').match(/(\d+), '([^']+)'/);
                if (match) {
                    var price = firstProductDetail.getAttribute('onclick').match(/\d+/)[0];
                    var formattedPrice = parseInt(price).toLocaleString('de-DE');
                    //var price = match[1];
                    var unit = match[2];

                    // Tìm phần tử .price trong thẻ sản phẩm và thiết lập giá
                    var priceElement = card.querySelector('.price');
                    if (priceElement) {
                        priceElement.innerHTML = formattedPrice + " VNĐ " + "/ " + unit;
                    }
                }
            }
        });
    };

    function showPrice(price, unit, element) {
        // Tìm phần tử .price trong cùng thẻ sản phẩm chứa nút nhấn
        var priceElement = element.closest('.product_card').querySelector('.price');

        // Cập nhật giá và đơn vị tính vào phần tử .price
        if (priceElement) {
            priceElement.innerHTML = parseInt(price).toLocaleString('de-DE') + " VNĐ" + " / " + unit;
        }
    }

    // Giữ đơn vị tính
    function toggleSelected(element) {
        // Lấy tất cả các nút có class 'button'
        var buttons = document.querySelectorAll('.button');

        // Xóa lớp 'selected' khỏi tất cả các nút
        buttons.forEach(function(button) {
            button.classList.remove('selected');
        });

        // Thêm lớp 'selected' vào nút đang được nhấn
        element.classList.add('selected');
    }
</script>
</body>
</html>