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
            <a href="servletLogout">
                <span class="material-icons-sharp">logout</span>
                <h3>Đăng xuất</h3>
            </a>
        </div>
    </aside>
    <!-- ---------------hết phần sidebar------------- -->
    <main>
        <h1>Sản phẩm thuốc</h1>
        <!-- END OF INSIGHTS -->
        <!-- Đơn hàng -->
        <div class="recent-orders">
            <div class="header">
                <h2 style="margin-right: -1cm;">Danh sách thuốc</h2>
                <div>
                    <div class="buttons" >
                        <button class="blob-btn">
                            Thêm thuốc
                            <span class="blob-btn__inner">
                                    <span class="blob-btn__blobs">
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                      <span class="blob-btn__blob"></span>
                                    </span>
                             </span>
                        </button>
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
                </div>
            </div>
            <table id="khachhang-table">
                <thead>
                <tr>
                    <th>Mã thuốc</th>
                    <th>Tên thuốc</th>
                    <th>Thương hiệu</th>
                    <th>Nước sản xuất</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="sp" items="${dssp}">
                        <tr>
                            <td>${sp.id}</td>
                            <td>${sp.tenSanPham}</td>
                            <td>${sp.thuongHieu}</td>
                            <td>${sp.noiSanXuat}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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

<script src=""></script>
<script src="script.js"></script>

<script>
    if (userRole === 'Quản lý') {
        document.querySelector('.blob-btn').disabled = true;
    }
</script>
</body>
</html>
