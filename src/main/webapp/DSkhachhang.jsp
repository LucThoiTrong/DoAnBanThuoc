<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<h1>Khách hàng</h1>
<!-- END OF INSIGHTS -->
<!-- Đơn hàng -->
<div class="recent-orders">
    <div class="header">
        <h2 style="margin-right: -1cm;">Danh sách khách hàng</h2>
        <a href="#" class="button">
            <!-- button them nhan vien -->
            <div class="buttons">
                <button class="blob-btn">
                    Thêm khách hàng
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
        </a>
    </div>
    <table id="khachhang-table">
        <thead>
        <tr>
            <th>Mã Khách Hàng</th>
            <th>Tên Khách Hàng</th>
            <th>Số điện thoại</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="kh" items="${dsKhachHang}">
                <tr>
                    <td>${kh.id}</td>
                    <td>${kh.ten}</td>
                    <td>${kh.soDienThoai}</td>
                    <td>${kh.email}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
