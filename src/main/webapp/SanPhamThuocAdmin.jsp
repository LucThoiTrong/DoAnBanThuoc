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
</head>
<body>
<div class="container">
    <%--    <aside>--%>

    <%--    </aside>--%>
    <!-- ---------------hết phần sidebar------------- -->
    <main>
        <%-- HIỆN DANH SÁCH CÁC SẢN PHẨM THEO LOẠI THUỐC--%>
<%--        <h1>Sản phẩm thuốc</h1>--%>
        <div class="recent-orders">
            <div class="header">
                <h2 style="margin-right: -1cm;">Danh sách thuốc</h2>
                <a href="servletLoaiThuoc?action=themSP&idLoaiThuoc=${idLoaiThuoc}" class="button"style="margin-left: 3cm;">
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
                        <td>
                            <a href="servletLoaiThuoc?action=hienDSLoaiThuocTrangSuaSP&id=${sp.id}" style="color: #33c633; text-decoration: none; cursor: pointer">
                                Chi tiết
                            </a>
                        </td>
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

</body>
</html>
