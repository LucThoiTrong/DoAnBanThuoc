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
<div class="row">
    <c:choose>
        <c:when test="${not empty sessionScope.khachHang}">
            <jsp:include page="headerSauDN.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="header.html"/>
        </c:otherwise>
    </c:choose>
</div>
<div class="container my-4" >
    <div class="row" style="margin-top: 30px">
        <!-- Bộ lọc bên trái -->
        <div class="col-md-3" style="margin-bottom: 15px" >
            <div class="card" style="margin-right: 10px; position: sticky; top: 0;">
                <div class="card-header custom-card-header">
                    Bộ lọc nâng cao
                </div>
                <div class="card-body" style="height: 60vh; overflow-y: auto; margin-bottom: 15px; padding-bottom: 0;">
                    <form id="filterForm" action="servletSanPham" method="get">
                        <input type="hidden" name="action" value="XemSanPham">
                        <div class="mb-3">
                            <label for="DanhMucThuoc" class="form-label">Danh mục thuốc</label>
                            <select class="form-select" id="DanhMucThuoc" name="danhMucID" onchange="document.getElementById('filterForm').submit();">
                                <option value="">~Chọn danh mục~</option>
                                <c:forEach var="DMT" items="${DanhMucThuoc}">
                                    <option value="${DMT.id}" ${param.danhMucID == DMT.id ? 'selected' : ''}>${DMT.tenDanhMucThuoc}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="LoaiThuoc" class="form-label">Loại thuốc</label>
                            <select class="form-select" id="LoaiThuoc" name="loaiThuocID" onchange="document.getElementById('filterForm').submit();">
                                <option value="">~Chọn loại thuốc~</option>
                                <c:forEach var="Lt" items="${LoaiThuoc}">
                                    <option type="submit" value="${Lt.id}" ${param.loaiThuocID == Lt.id ? 'selected' : ''}>${Lt.tenLoaiThuoc}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="form-label">Giá bán</div>
                            <div class="btn-group-vertical filter-button-group" role="group" aria-label="Price Filter">
                                <button type="submit" name="priceRange"
                                        value="${param.priceRange == '0-100000' ? '' : '0-100000'}"
                                        class="btn btn-outline-success ${param.priceRange == '0-100000' ? 'active' : ''}"> Dưới 100.000đ
                                </button>
                                <button type="submit" name="priceRange"
                                        value="${param.priceRange == '100000-300000' ? '' : '100000-300000'}"
                                        class="btn btn-outline-success ${param.priceRange == '100000-300000' ? 'active' : ''}"> 100.000đ đến 300.000đ
                                </button>
                                <button type="submit" name="priceRange"
                                        value="${param.priceRange == '300000-500000' ? '' : '300000-500000'}"
                                        class="btn btn-outline-success ${param.priceRange == '300000-500000' ? 'active' : ''}"> 300.000đ đến 500.000đ
                                </button>
                                <button type="submit" name="priceRange"
                                        value="${param.priceRange == '500000+' ? '' : '500000+'}"
                                        class="btn btn-outline-success ${param.priceRange == '500000+' ? 'active' : ''}"> Trên 500.000đ
                                </button>
                            </div>
                        </div>
                        <!-- Trường ẩn để giữ giá trị của giá bán -->
                        <input type="hidden" id="priceRange" name="priceRange" value="${param.priceRange}">

                        <div class="mb-3">
                            <label for="DoTuoiSuDung" class="form-label">Độ tuổi sử dụng</label>
                            <select class="form-select" id="DoTuoiSuDung" name="doTuoiID" onchange="document.getElementById('filterForm').submit();">
                                <option value="">Tất cả</option>
                                <c:forEach var="dtsd" items="${DoTuoiSuDung}">
                                    <option value="${dtsd.id}" ${param.doTuoiID == dtsd.id ? 'selected' : ''}>${dtsd.doiTuongSuDung}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="NoiSanXuat" class="form-label">Nơi sản xuất</label>
                            <select class="form-select" id="NoiSanXuat" name="noiSanXuat" onchange="document.getElementById('filterForm').submit();">
                                <option value="">Tất cả</option>
                                <c:forEach var="nsx" items="${NoiSanXuat}">
                                    <option value="${nsx}" ${param.noiSanXuat == nsx ? 'selected' : ''}>${nsx}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="ThuongHieu" class="form-label">Thương hiệu</label>
                            <select class="form-select" id="ThuongHieu" name="thuongHieu" onchange="document.getElementById('filterForm').submit();">
                                <option value="">Tất cả</option>
                                <c:forEach var="TH" items="${ThuongHieu}">
                                    <option value="${TH}" ${param.thuongHieu == TH ? 'selected' : ''}>${TH}</option>
                                </c:forEach>
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
            </div>
            <ul class="product-list">
                <!-- Thẻ sản phẩm -->
                <c:forEach var="product" items="${productList}">
                    <li>
                        <div class="product_card">
                            <div class="basicInfo">
                                <a href="${product.linkChiTietSanPham}?idSanPham=${product.id}" style="text-decoration: none;color: black">
                                    <div class="name">${product.tenSanPham}</div>
                                    <div class="img">
                                        <img src="${product.anhSanPham}" alt="ảnh sản phẩm">
                                    </div>
                                </a>
                                <div>
                                    <div class="button_thuoc">
                                        <c:forEach var="p" items="${product.cacChiTietSanPham}">
                                            <a class="button" onclick="showPrice(${p.giaBan}, '${p.donViTinh.tenDonViTinh}', this, toggleSelected(this))">
                                                    ${p.donViTinh.tenDonViTinh}
                                            </a>
                                        </c:forEach>
                                    </div>
                                    <a href="${product.linkChiTietSanPham}?idSanPham=${product.id}" style="text-decoration: transparent">
                                        <div class="mores">
                                            <div class="price"></div> <!-- Giá sẽ được hiển thị ở đây -->
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script>
    // Hàm để thiết lập giá của đơn vị tính đầu tiên cho tất cả sản phẩm
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tất cả các sản phẩm
        var productCards = document.querySelectorAll('.product_card');

        // Duyệt qua từng sản phẩm
        productCards.forEach(function (card) {
            // Tìm tất cả các nút "button" trong sản phẩm
            var buttons = card.querySelectorAll('.button');

            // Nếu tồn tại ít nhất một nút, lấy giá trị của nút đầu tiên
            if (buttons.length > 0) {
                var firstButton = buttons[0];
                var price = firstButton.getAttribute('onclick').match(/showPrice\(([^,]+)/)[1]; // Lấy giá từ onclick
                var unit = firstButton.getAttribute('onclick').match(/'([^']+)'/)[1]; // Lấy đơn vị từ onclick

                // Hiển thị giá đầu tiên
                showPrice(price, unit, firstButton);
                firstButton.classList.add('selected'); // Đặt nút đầu tiên là "selected"
            }
        });
    });

    function showPrice(price, unit, element) {
        // Tìm phần tử .price trong cùng thẻ sản phẩm chứa nút nhấn
        var priceElement = element.closest('.product_card').querySelector('.price');

        // Cập nhật giá và đơn vị tính vào phần tử .price
        if (priceElement) {
            priceElement.innerHTML = parseInt(price).toLocaleString('de-DE') + "đ" + " / " + unit;
        }
    }

    // Giữ đơn vị tính
    function toggleSelected(element) {
        // Lấy tất cả các nút có class 'button'
        var buttons = element.closest('.button_thuoc').querySelectorAll('.button');

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