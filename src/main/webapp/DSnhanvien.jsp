<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<h1>Nhân viên</h1>
<!-- END OF INSIGHTS -->
<!-- Đơn hàng -->
<div class="recent-orders">
    <div class="header">
        <h2>Danh sách nhân viên</h2>
        <a href="#" class="button">
            <!-- button them nhan vien -->
            <div class="buttons">
                <button class="blob-btn">
                    Thêm nhân viên
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
    <table id="nhanvien-table">
        <thead>
        <tr>
            <th>Mã Nhân Viên</th>
            <th>Tên Nhân Viên</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Vị trí</th>
        </tr>
        </thead>
<%--        Viết code động hiển thị lên giao diện--%>
        <tbody>
            <c:forEach var="nv" items="${danhSachNhanVien}">
                <tr>
                    <td>${nv.id}</td>
                    <td>${nv.ten}</td>
                    <td>${nv.soDienThoai}</td>
                    <td>${nv.email}</td>
                    <td>${nv.chucVu.tenChucVu}</td>
                </tr>
            </c:forEach>
<%--            <tr>--%>
<%--                <td>Nguyên Văn A</td>--%>
<%--                <td>DH01</td>--%>
<%--                <td>Đã thanh toán</td>--%>
<%--                <td class="warning">Đã giao hàng</td>--%>
<%--                <td class="primary">Chi tiết</td>--%>
<%--            </tr>--%>
        </tbody>
    </table>
</div>
