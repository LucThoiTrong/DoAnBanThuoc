<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<h1>Danh mục thuốc</h1>
<div class="recent-orders">
    <div class="text-box">
        <a href="#" class="btn btn-white btn-animate" id="thuocKD">Thuốc kê đơn</a>
        <a href="#" class="btn btn-white btn-animate" id="thuockhongKD">Thuốc không kê đơn</a>
    </div>
    <div id="loaithuocKD" style="display: none; margin-top: 20px;">
        <div class="header" style="margin-top: 1cm;">
            <h2 style="margin-right: -1.5cm;">Danh sách loại thuốc kê đơn</h2>
            <div class="button" style="margin-left: -0.5cm;">
                <div class="buttons">
                    <button class="blob-btn">
                        Thêm loại thuốc
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
            </div>
        </div>
        <table border="1" id="loaithuocKDon-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên loại thuốc kê đơn</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="loaiThuoc" items="${danhSachLoaiThuoc}">
                    <c:if test="${loaiThuoc.danhMucThuoc != null and loaiThuoc.danhMucThuoc.id == 2}">
                        <tr>
                            <td>${loaiThuoc.id}</td>
                            <td>${loaiThuoc.tenLoaiThuoc}</td>
                            <td>
                                <a href="servletSanPham?idLoaiThuoc=${loaiThuoc.id}&action=LaySanPhamTheoIDLoaiThuoc" class="primary">Chi tiết</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="loaithuockhongKD" style="display: none; margin-top: 20px;">
        <div class="header" style="margin-top: 1cm;">
            <h2 style="margin-right: -1.5cm;">Danh sách loại thuốc không kê đơn</h2>
            <a href="#" class="button" style="margin-left: -2cm;">
                <!-- button them nhan vien -->
                <div class="buttons">
                    <button class="blob-btn">
                        Thêm loại thuốc
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
        <table border="1" id="loaithuocKKD-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên loại thuốc không kê đơn</th>
                <th></th>
            </tr>
            </thead>
            <tr>
                    <c:forEach var="loaiThuoc" items="${danhSachLoaiThuoc}">
                        <c:if test="${loaiThuoc.danhMucThuoc != null and loaiThuoc.danhMucThuoc.id == 1}">
                            <tr>
                                <td>${loaiThuoc.id}</td>
                                <td>${loaiThuoc.tenLoaiThuoc}</td>
                                <td>
                                    <a href="servletSanPham?idLoaiThuoc=${loaiThuoc.id}&action=LaySanPhamTheoIDLoaiThuoc" class="primary">Chi tiết</a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
            </tr>
        </table>
    </div>
    <script>
        // Dành cho DSthuoc.jsp -> thuoc khong ke don
        document.getElementById('thuockhongKD').addEventListener('click', function () {
            const nonPrescriptionList = document.getElementById('loaithuockhongKD');
            const prescriptionList = document.getElementById('loaithuocKD');

            // Hiển thị danh sách thuốc không kê đơn và đóng danh sách thuốc kê đơn
            if (nonPrescriptionList.style.display === 'none') {
                nonPrescriptionList.style.display = 'block';
                prescriptionList.style.display = 'none';
                document.getElementById('thuockhongKD').classList.remove('btn-white');
                document.getElementById('thuockhongKD').classList.add('active-btn');
                document.getElementById('thuocKD').classList.remove('active-btn');
                document.getElementById('thuocKD').classList.add('btn-white');
            } else {
                nonPrescriptionList.style.display = 'none';
                document.getElementById('thuockhongKD').classList.remove('active-btn');
                document.getElementById('thuockhongKD').classList.add('btn-white');
            }

            // prescriptionBtn.classList.remove('btn-white');
        });

        // Dành cho DSthuoc.jsp -> thuoc ke don
        document.getElementById('thuocKD').addEventListener('click', function () {
            const nonPrescriptionList = document.getElementById('loaithuockhongKD');
            const prescriptionList = document.getElementById('loaithuocKD');

            // Hiển thị danh sách thuốc kê đơn và đóng danh sách thuốc không kê đơn
            if (prescriptionList.style.display === 'none') {
                prescriptionList.style.display = 'block';
                nonPrescriptionList.style.display = 'none';
                document.getElementById('thuocKD').classList.remove('btn-white');
                document.getElementById('thuocKD').classList.add('active-btn');
                document.getElementById('thuockhongKD').classList.remove('active-btn');
                document.getElementById('thuockhongKD').classList.add('btn-white');
            } else {
                prescriptionList.style.display = 'none';
                document.getElementById('thuocKD').classList.remove('active-btn');
                document.getElementById('thuocKD').classList.add('btn-white');
            }
        });
        // Mặc định hiển thị danh sách thuốc kê đơn khi trang được tải
        window.addEventListener('load', function () {
            document.getElementById('loaithuocKD').style.display = 'block';
            document.getElementById('loaithuockhongKD').style.display = 'none';
            document.getElementById('thuocKD').classList.remove('btn-white');
            document.getElementById('thuocKD').classList.add('active-btn');
        });
        const userRole = '${sessionScope.nhanVien.chucVu.tenChucVu}';
        if (userRole === 'Quản lý') {
            document.querySelector('.blob-btn').disabled = true;
        }
        else {
            document.querySelector('.blob-btn').disabled = false;
        }
    </script>
</div>
