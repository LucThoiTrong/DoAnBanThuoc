<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="TrangCaNhan.css" rel="stylesheet">
</head>
<body>
<!-- Header Section -->
<header class="profile-header text-center">
    <div class="container">
        <img src="imagesHeader/3d flower1.jpg" alt="Profile Picture" class="profile-picture mb-3">
        <h2 class="fw-bold">${sessionScope.khachHang.ten}</h2>
        <%--        <p class="mb-0">Thành viên từ: 2021</p>--%>
    </div>
</header>

<!-- Profile Section -->
<div class="container my-5">
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-4 mb-4">
            <div class="profile-card p-4">
                <h5 class="fw-bold">Thông tin cá nhân</h5>
                <p><strong>Tên:  </strong>${sessionScope.khachHang.ten}</p>
                <p><strong>Email:  </strong>${sessionScope.khachHang.email}</p>
                <p><strong>Số điện thoại:  </strong>${sessionScope.khachHang.soDienThoai}</p>
                <button class="btn w-100" data-bs-toggle="modal" data-bs-target="#editModal">Chỉnh sửa thông tin</button>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Chỉnh sửa thông tin</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form chỉnh sửa thông tin -->
                            <form action="servletThongTinCaNhan" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Tên</label>
                                    <input type="text" class="form-control" id="name" name="ten" value="${sessionScope.khachHang.ten}">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.khachHang.email}">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="soDienThoai" value="${sessionScope.khachHang.soDienThoai}">
                                </div>
                                <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                                <c:forEach var="dh" items="${dh}">
                                    <p>${dh.id}</p>
                                </c:forEach>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div class="col-md-8">
            <div class="profile-card p-4">
                <ul class="nav nav-tabs mb-3" id="profileTabs" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active" id="orders-tab" data-bs-toggle="tab" data-bs-target="#orders" type="button" role="tab">Đơn hàng</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab">Cài đặt</button>
                    </li>
                </ul>

                <div class="tab-content" id="profileTabsContent">
                    <!-- Orders Tab -->
                    <div class="tab-pane fade show active" id="orders" role="tabpanel">
                        <h5 class="fw-bold">Lịch sử đơn hàng</h5>
                        <c:forEach var="dh" items="${dh}">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                        ${dh.id}
                                    <span class="badge bg-success">Đã giao</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Đơn hàng #67890
                                    <span class="badge bg-warning">Đang xử lý</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Đơn hàng #11223
                                    <span class="badge bg-danger">Hủy bỏ</span>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>

                    <!-- Settings Tab -->
                    <div class="tab-pane fade" id="settings" role="tabpanel">
                        <h5 class="fw-bold">Cài đặt tài khoản</h5>
                        <p><a href="#">Thay đổi mật khẩu</a></p>
                        <button class="btn btn-danger">Đăng xuất</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
