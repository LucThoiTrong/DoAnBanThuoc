<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" id="header">
    <div class = "col-2">
        <div class="logo">
            <img src="imagesTrangChu/logonew.png" alt="logo" class="img-fluid">
        </div>
    </div>
    <div class = "col-4">
        <div class="timKiem">
            <form action="" id="search-box" style="margin-top: 15px;">
                <input type="text" id="search-text" placeholder="Search" required>
                <button id="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>
    <div class = "col-6" style="margin-top: 10px;">
        <nav class="nav">
            <a href="#trangChu">
                <span>Trang chủ</span>
                <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 43px;">home</span>
                <svg viewBox="0 0 300 300" aria-hidden="true">
                    <g>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath">Trang chủ</textPath>
                        </text>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath" startOffset="50%">Trang chủ</textPath>
                        </text>
                    </g>
                </svg>
            </a>
            <a href="servletSanPham?action=LayAllSanPham">
                <span>Thuốc</span>
                <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 23px;">medication</span>
                <svg viewBox="0 0 300 300" aria-hidden="true">
                    <g>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath">Thuốc</textPath>
                        </text>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath" startOffset="50%">Thuốc</textPath>
                        </text>
                    </g>
                </svg>
            </a>
            <a href="#veChungToi">
                <span>Về chúng tôi</span>
                <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 55px;">groups</span>
                <svg viewBox="0 0 300 300" aria-hidden="true">
                    <g>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath">Về chúng tôi</textPath>
                        </text>
                        <text fill="currentColor">
                            <textPath xlink:href="#circlePath" startOffset="50%">Về chúng tôi</textPath>
                        </text>
                    </g>
                </svg>
            </a>
            <a href="signin.html" class="btnDangNhap"><b>ĐĂNG NHẬP</b></a>
        </nav>
    </div>
</div>
