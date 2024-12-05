<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="headerSauDN.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <!-- bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
</head>
    <body>
        <div class="row" id="header">
            <div class = "col-2">
                <div class="logo">
                    <a href="index.jsp"><img src="imagesHeader/logoxanh.png" alt="logo" class="img-fluid"></a>
                </div>
            </div>
            <div class = "col-4" style="margin-top: 10px">
                <div class="timKiem">
                    <form action="" id="search-box" style="margin-top: 5px;">
                        <input type="text" id="search-text" placeholder="Search" required>
                        <button id="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
            </div>
            <div class = "col-6" style="display: flex; justify-content: flex-end; align-items: center;">
                <!--  -->
                <button id="btnListThuoc" style=" margin-right: 15px; background-color: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 20px; cursor: pointer; font-size: 16px;"
                        onclick="window.location.href='servletSanPham?action=LayAllSanPham';">
                    Mua thuốc ngay
                </button>
<%--                <script>--%>
<%--                    try {--%>
<%--                        window.location.href = "/servletSanPhamThuoc?action=LayAllSanPham";--%>
<%--                    } catch (error) {--%>
<%--                        console.error("Có lỗi xảy ra:", error);--%>
<%--                        alert("Không thể chuyển hướng đến trang sản phẩm. Vui lòng thử lại sau.");--%>
<%--                    }--%>
<%--                </script>--%>
                <ul style="list-style: none; padding: 0; margin: 0;">
                    <li class="dropdown no-arrow mx-2">
                        <a class="dropdown-toggle" href="#" id="alertsDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                            <div class="cart-icon" style="position: relative;">
                                <img src="imagesHeader/trolley-cart.png" style="height: 30px; width: 30px; cursor: pointer;">
<%--                                Viết động chỗ này để lấy tổng số lượng các sản phẩm đã chọn?--%>
                                <span class="badge bg-danger badge-counter" style="position: absolute; top: -5px; right: -5px;">
                                    <c:choose>
                                        <c:when test="${sessionScope.dh != null}">
                                            ${fn:length(sessionScope.dh.danhSachSanPham)}
                                        </c:when>
                                        <c:otherwise>
                                            0
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </a>
                        <!-- Dropdown - sản phẩm trong giỏ -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">Sản phẩm trong giỏ hàng</h6>
<%--                            Viết vòng foreach lụm các sản phẩm từ trong CSDL lên--%>
                            <c:forEach var="p" items="${sessionScope.dh.danhSachSanPham}">
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3 ml-4">
                                        <div>
                                            <img src="${p.sanPham.sanPham.anhSanPham}" class="anhSanPham">
                                        </div>
                                    </div>
                                    <div>
                                        <span class="font-weight-bold">${p.sanPham.sanPham.tenSanPham}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <a class="dropdown-item text-center small text-gray-500" href="servletGioHang">Xem giỏ hàng</a>
                        </div>
                    </li>
                </ul>

                <%--  THÔNG TIN CA NHAN    --%>
                <div class="border-start border-2" style="height: 35px; margin-right: 20px;"></div>
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center dropdown-toggle" style="text-decoration: none; color: rgb(28, 171, 52);" id="userDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <c:if test="${not empty sessionScope.khachHang}">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="color: #0D9845">${sessionScope.khachHang.ten}</span>
                        </c:if>
                        <img src="imagesHeader/3d flower1.jpg" class="rounded-circle"
                            style="height: 35px; width: 35px; margin-left: 20px;">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="ThongTinCaNhan.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-100"></i> Profile</a></li>
<%--                        <li><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-100"></i> Settings</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-100"></i> Activity Log</a></li>--%>
                        <li><hr class="dropdown-divider"></li>
                        <li>
<%--                            <a class="dropdown-item" href="servletLogout" data-bs-toggle="modal" data-bs-target="#logoutModal">--%>
<%--                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-100"></i> Logout--%>
<%--                            </a>--%>
                            <a class="dropdown-item" href="servletLogout">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-100"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>