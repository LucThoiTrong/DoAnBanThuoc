<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN</title>
    <link rel="stylesheet" href="admin.css">
    <!-- Material CDN -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <!-- boostrap -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->

</head>
<body>
<div class="container">
    <aside>
        <div class="top"> <!--Phần trên -->
            <div class="logo">
                <img src="imagesAdmin/image-removebg-preview.png">
            </div>
            <div class="close" id="close-btn">
                <span class="material-icons-sharp">close</span>
            </div>
        </div>
        <div class="sidebar"> <!--cái siderbar bên trái-->
            <a href="admin.jsp" >
                <span class="material-icons-sharp">grid_view</span>
                <h3>Dashboard</h3>
            </a>
            <a href="servletLoaiThuoc" class="active">
                <span class="material-icons-sharp">medical_services</span>
                <h3>Thuốc</h3>
            </a>
            <a href="servletNhanVien">
                <span class="material-icons-sharp">diversity_2</span>
                <h3>Nhân viên</h3>
            </a>
            <a href="servletKhachHang">
                <span class="material-icons-sharp">emoji_people</span>
                <h3>Khách hàng</h3>
            </a>
            <a href="#">
                <span class="material-icons-sharp">logout</span>
                <h3>Đăng xuất</h3>
            </a>
        </div>
    </aside>
    <!-- ---------------hết phần sidebar------------- -->
    <main>
        <h1>Chi Tiết Đơn Hàng</h1>
        <!-- END OF INSIGHTS -->
        <!-- Đơn hàng -->
        <div class="recent-orders">
            <div class="thongtinDH">
                <div class="order-header">
                    <span id="idDH" data-value="${dh.id}"><strong>Mã Đơn Hàng:   </strong>${dh.id}</span>
                    <span><strong>Ngày Đặt Hàng:  </strong>${dh.ngayDatHang}</span>
                    <span class="order-status"><strong style="color: white;"> ${dh.trangThaiDatHang.displayName}</strong></span>
                </div>
                <div class="customer-info">
                    <div class="customer">
                        <h3>KHÁCH HÀNG</h3>
                        <p>${khachHang.ten}</p>
                        <p>${khachHang.soDienThoai}</p>
                    </div>
                    <div class="receiver">
                        <h3>PHƯƠNG THỨC THANH TOÁN</h3>
                        <p>${dh.phuongThucThanhToan.displayName}</p>
                        <h4 style="font-size: 0.5cm; color: #f65353">Tổng tiền: ${dh.tinhTongGiaTien()}</h4>
                    </div>
                </div>
            </div>
            <div class="header" style="margin-top:1cm">
                <h2>Danh sách sản phẩm</h2>
            </div>
            <table style="margin-top:4cm">
                <thead>
                <tr>
                    <th>Mã thuốc</th>
                    <th>Hình ảnh thuốc</th>
                    <th>Tên thuốc</th>
                    <th>Số lượng mua</th>
                    <th>Giá bán</th>
                    <th>Tổng tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dsCTDH" items="${dsCTDatHang}">
                    <tr>
                        <td>${dsCTDH.sanPham.sanPham.id}</td>
                        <td><img src="${dsCTDH.sanPham.sanPham.anhSanPham}" height="120"></td>
                        <td>${dsCTDH.sanPham.sanPham.tenSanPham}</td>
                        <td>${dsCTDH.soLuongMua}</td>
                        <td>${dsCTDH.sanPham.giaBan}</td>
                        <td>${dsCTDH.tongGiaTien}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table><br>
            <div class="duyetDonHang" style="margin-left: 6cm; margin-top:1cm;">
                <a href="#" class="button" style="margin-left: 10cm; ">
                    <!-- button them nhan vien -->
                    <div class="buttons">
                        <button type="submit" class="blob-btn" onclick="DuyetDonHang()">
                            Duyệt đơn hàng
                            <span class="blob-btn__inner">
                                    <span class="blob-btn__blobs">
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                    </span>
                                  </span>
                        </button>
                        <br/>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
                        <defs>
                            <filter id="goo">
                                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
                                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo"></feColorMatrix>
                                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
                            </filter>
                        </defs>
                    </svg>
                </a>
            </div>
            <%--                <button type="submit" class="blob-btn" onclick="DuyetDonHang()">Duyệt đơn hàng</button>--%>
        </div>
    </main>
    <!-- END OF MAIN -->

    <div class="right">
        <div class="top">
            <button id="menu-btn">
                <span class="material-icons-sharp">menu</span>
            </button>
            <div class="theme-toggler">
                <span class="material-icons-sharp active">light_mode</span>
                <span class="material-icons-sharp">dark_mode</span>
            </div>
            <div class="profile">
                <div class="info">
                    <p>Xin chào, <b>Hoang</b></p>
                    <small class="text-muted">Admin</small>
                </div>
                <div class="profile-photo">
                    <img src="imagesAdmin/broccoli.png">
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    function DuyetDonHang() {
        const idDH =  document.getElementById("idDH").getAttribute("data-value");
        const action = 'CapNhatDonHang';
        const newUrl = 'servletDashboard?action=' + action + '&idDatHang=' + idDH;
        window.location.href = newUrl;
    }
    const themeToggler = document.querySelector(".theme-toggler");
    const body = document.body;
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme) {
        body.classList.toggle('dark-theme-variables', savedTheme === 'dark');
        themeToggler.querySelector('span:nth-child(1)').classList.toggle('active', savedTheme === 'light');
        themeToggler.querySelector('span:nth-child(2)').classList.toggle('active', savedTheme === 'dark');
    }
    // Change theme (sáng/tối)
    themeToggler.addEventListener('click', () => {
        const isDark = body.classList.toggle('dark-theme-variables');
        localStorage.setItem("theme", isDark ? "dark" : "light");
        themeToggler.querySelector('span:nth-child(1)').classList.toggle('active', !isDark);
        themeToggler.querySelector('span:nth-child(2)').classList.toggle('active', isDark);
    });
</script>
<script src="script.js"></script>

</body>
</html>