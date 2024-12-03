<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        <!--cái sidebar bên trái-->
        <div class="sidebar">
            <a href="servletDashboard" class="${param.page == 'Dashboard' ? 'active' : ''}">
                <span class="material-icons-sharp">grid_view</span>
                <h3>Dashboard</h3>
            </a>
            <a href="servletLoaiThuoc" id="thuoc-link" class="${param.page == 'DSthuoc' ? 'active' : ''}">
                <span class="material-icons-sharp">medical_services</span>
                <h3>Thuốc</h3>
            </a>
            <a href="servletNhanVien" id="nv-link" class="${param.page == 'DSnhanvien' ? 'active' : ''}">
                <span class="material-icons-sharp">diversity_2</span>
                <h3>Nhân viên</h3>
            </a>
            <a href="servletKhachHang" id="kh-link" class="${param.page == 'DSkhachhang' ? 'active' : ''}">
                <span class="material-icons-sharp">emoji_people</span>
                <h3>Khách hàng</h3>
            </a>
            <a href="servletDoanhThu" id="doanhthu-link" class="${param.page == 'DSDoanhThu' ? 'active' : ''}">
                <span class="material-icons-sharp">bar_chart</span>
                <h3>Doanh thu</h3>
            </a>
            <a href="servletLogout">
                <span class="material-icons-sharp">logout</span>
                <h3>Đăng xuất</h3>
            </a>
        </div>
    </aside>
    <!-- ---------------hết phần sidebar------------- -->
    <!-- Main Content -->
    <main>
        <%
            // Lấy tham số 'getpage' từ URL trong sidebar
            String getpage = request.getParameter("page");
            if (getpage == null) {
                getpage = "Dashboard"; // Trang mặc định ban đầu
            }
            // Đường dẫn tới file JSP cần nạp
            String mainContent = getpage + ".jsp";
        %>
        <jsp:include page="<%= mainContent %>" />
    </main>
    <!-- End of main -->
    <!-- Right Section -->
    <div class="right" style="height: 2cm">
        <div class="top">
            <button id="menu-btn">
                <span class="material-icons-sharp">menu</span>
            </button>
            <div class="theme-toggler">
                <span class="material-icons-sharp ${theme == 'light' ? 'active' : ''}">light_mode</span>
                <span class="material-icons-sharp ${theme == 'dark' ? 'active' : ''}">dark_mode</span>
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
    const sideMenu = document.querySelector("aside");
    const menuBtn = document.querySelector("#menu-btn");
    const closeBtn = document.querySelector("#close-btn");
    const themeToggler = document.querySelector(".theme-toggler");
    const body = document.body;
    // show sidebar
    menuBtn.addEventListener('click', () => {
        sideMenu.style.display = 'block';
    })
    // close sidebar
    closeBtn.addEventListener('click', () => {
        sideMenu.style.display = 'none';
    })

    // Load saved theme (sáng/tối)
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

    if (document.body.contains(document.querySelector("#order-table"))) {
        addOrdersToTable();
    }
    if (document.body.contains(document.querySelector("#nhanvien-table"))) {
        addNviensToTable();
    }
    if (document.body.contains(document.querySelector("#khachhang-table"))) {
        addKHangsToTable();
    }
    if (document.body.contains(document.querySelector("#loaithuocKKD-table"))) {
        addLThuocKKDsToTable();
    }
    if (document.body.contains(document.querySelector("#loaithuocKDon-table"))) {
        addLThuocKDonsToTable();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@srexi/purecounterjs/dist/purecounter_vanilla.js"></script>
<script>
    // Khởi động PureCounter theo cách thủ công để đảm bảo hoạt động
    new PureCounter();
    const userRole = '${sessionScope.nhanVien.chucVu.tenChucVu}';
    const admin_test = ${sessionScope.admin == null}
    if (userRole === 'Nhân viên' && admin_test) {
        const thuocLink = document.getElementById('thuoc-link');
        // Thêm lớp CSS để làm liên kết không nhấn được
        thuocLink.classList.add('disabled');
        const nvLink = document.getElementById('nv-link');
        nvLink.classList.add('disabled');
        const khLink = document.getElementById('kh-link');
        khLink.classList.add('disabled');
        const doanhthuLink = document.getElementById('doanhthu-link');
        doanhthuLink.classList.add('disabled');
    }
</script>
</body>
</html>
