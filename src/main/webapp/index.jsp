<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="imagesTrangChu/plus.png">
    <title>Vitamin A+</title>
    <link rel="stylesheet" href="trangchu.css">
    <link rel="stylesheet" href="footer.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <!-- bootstrap -->
    <link rel="stylesheet" href="footer-bootstrap-icons.css">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
</head>
<body>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="container-fluid">
    <!-- header -->
    <div class="row">
        <c:choose>
            <c:when test="${not empty sessionScope.khachHang}">
                <jsp:include page="headerSauDN.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="headerTrangChuChuaDN.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
<%--    <%@include file="headerSauDN.jsp"%>--%>
<%--    <div class="row" id="header">--%>
<%--        <div class = "col-2">--%>
<%--            <div class="logo">--%>
<%--                <img src="imagesTrangChu/logonew.png" alt="logo" class="img-fluid">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class = "col-4">--%>
<%--            <div class="timKiem">--%>
<%--                <form action="" id="search-box" style="margin-top: 15px;">--%>
<%--                    <input type="text" id="search-text" placeholder="Search" required>--%>
<%--                    <button id="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class = "col-6" style="margin-top: 10px;">--%>
<%--            <nav class="nav">--%>
<%--                <a href="#trangChu">--%>
<%--                    <span>Trang chủ</span>--%>
<%--                    <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 43px;">home</span>--%>
<%--                    <svg viewBox="0 0 300 300" aria-hidden="true">--%>
<%--                        <g>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath">Trang chủ</textPath>--%>
<%--                            </text>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath" startOffset="50%">Trang chủ</textPath>--%>
<%--                            </text>--%>
<%--                        </g>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--                <a href="servletSanPham?action=LayAllSanPham">--%>
<%--                    <span>Thuốc</span>--%>
<%--                    <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 23px;">medication</span>--%>
<%--                    <svg viewBox="0 0 300 300" aria-hidden="true">--%>
<%--                        <g>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath">Thuốc</textPath>--%>
<%--                            </text>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath" startOffset="50%">Thuốc</textPath>--%>
<%--                            </text>--%>
<%--                        </g>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--                <a href="#veChungToi">--%>
<%--                    <span>Về chúng tôi</span>--%>
<%--                    <span class="material-symbols-outlined" aria-hidden="true" style="margin-left: 55px;">groups</span>--%>
<%--                    <svg viewBox="0 0 300 300" aria-hidden="true">--%>
<%--                        <g>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath">Về chúng tôi</textPath>--%>
<%--                            </text>--%>
<%--                            <text fill="currentColor">--%>
<%--                                <textPath xlink:href="#circlePath" startOffset="50%">Về chúng tôi</textPath>--%>
<%--                            </text>--%>
<%--                        </g>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--                <a href="signin.html" class="btnDangNhap"><b>ĐĂNG NHẬP</b></a>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- trang chủ -->
    <div class="row" id="home">
        <div class = "container">
            <div class="row">
                <div class ="col-4">
                    <div class = "box-slogan" style="display: flex; align-items: center; text-align: center; flex-direction: column; transform: translate(20%,90%);">
                        <h2 id ="slogan"><b>Trao ánh sáng <br>Tặng nụ cười<br>Gửi trọn niềm tin.</b></h2>
                        <h4 style="">Chúng tôi ở đây vì bạn !</h4>
                    </div>
                </div>
                <div class ="col-6">
                    <div class="anhTrangChu">
                        <img src="imagesTrangChu/hand-with-bottle-desktop._CB605453227_.png" alt="anhtrangchu" id = "anhTrangChu" style="transform: translateY(0%)">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row" id="danhMucThuoc" style="margin-top: 20px;">
        <div class="banner" style="transform: translateX(50%);">
            <img src="imagesTrangChu/application.png" style="height: 30px;width: 30px; transform: translate(-40px,30px);">
            <h3 style="color: #059d23;"><i><b>Danh mục</b></i></h3>
        </div>
        <div class="container">
            <div class="row">
                <div class=" col-6">
                    <img src ="imagesTrangChu/hormone.gif" style="height: 100px;width: 100px; transform: translateY(-40px);">
                </div>
            </div>
            <div class="row">
                <div class="col-6" style="text-align: right;">
                    <button class="box" style="background-color: #dbf9e1; height: 150px; width: 400px; border-radius: 20px;  border: none; cursor: pointer;">
                        <img src="imagesTrangChu/prescription (1).png" style="height: 70px; width: 70px; transform: translateY(-50px); z-index: -1;">
                        <h3 class="TenDanhMucThuoc" style="transform: translateY(-30px);"><b>Thuốc kê đơn</b></h3>
                    </button>
                </div>
                <div class=" col-6">
                    <button class="box" style="background-color: #dbf9e1; height: 150px; width: 400px; border-radius: 20px;   border: none; cursor: pointer;">
                        <img src="imagesTrangChu/medicine (5).png" style="height: 50px; width: 50px; transform: translateY(-40px);">
                        <h3 class="TenDanhMucThuoc" style="transform: translateY(-20px);"><b>Thuốc không kê đơn</b></h3>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="display: flex; align-items: center; margin-top: 50px;">
        <img src="imagesTrangChu/suggestion.png" style="height: 50px; width: 75px; margin-right: 10px;">
        <h3 style="transform: translate(60px,-37px); color: #059d23;"><b><i>Gợi ý hôm nay</i></b></h3>
    </div>
    <div class="row" id="goiY" >
        <div class="container-card swiper">
            <div class="slider-wrapper">
                <div class="card-list swiper-wrapper">
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 1
                                        <div class="name">Songouk Abc 2024</div>
                                        <div class="info">New product 2024</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color1" id="green1" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color1" id="black1">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green1">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black1">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/cardiology.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$30.25</div>
                            </div>
                        </div>
                    </div>

                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 2
                                        <div class="name">Songouk Abc 2025</div>
                                        <div class="info">New product 2025</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color2" id="green2" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color2" id="black2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green2">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black2">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/branch.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$35.50</div>
                            </div>
                        </div>
                    </div>

                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 3
                                        <div class="name">Songouk Abc 2026</div>
                                        <div class="info">New product 2026</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color3" id="green3" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color3" id="black3">
                                                    <!-- <img src="images/atom (1).png" alt=""> -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green3">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black3">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$40.75</div>
                            </div>
                        </div>
                    </div>

                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 4
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color4" id="green4" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color4" id="black4">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green4">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black4">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>

                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 5
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color5" id="green5" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color5" id="black5">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green5">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black5">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 6
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color6" id="green6" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color6" id="black6">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green6">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black6">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 7
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color7" id="green7" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color7" id="black7">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green7">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black7">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 8
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color8" id="green8" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color8" id="black8">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green8">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black8">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 9
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color9" id="green9" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color9" id="black9">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green9">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black9">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="card-item swiper-slide">
                        <div class="card_1">
                            <div class="basicInfo">
                                <div class="title">
                                    <div class="category">Nike 10
                                        <div class="name">Songouk Abc 2027</div>
                                        <div class="info">New product 2027</div>
                                        <div class="images">
                                            <div class="img">
                                                <div class="item">
                                                    <input type="radio" name="color10" id="green10" checked>
                                                    <img src="imagesTrangChu/atom (1).png" alt="">
                                                </div>
                                                <div class="item">
                                                    <input type="radio" name="color10" id="black10">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors">
                                            <label for="green10">
                                                <div class="green">
                                                    <div class="name">Green</div>
                                                    <div class="ellipse" style="background: #cadb6e;"></div>
                                                </div>
                                            </label>
                                            <label for="black10">
                                                <div class="black">
                                                    <div class="name">Black</div>
                                                    <div class="ellipse" style="background: #2b2b2b;"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="addCard">
                                            <i><img src="imagesTrangChu/atom.png" style="width: 25px; height: 25px;" alt=""></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mores">
                                <div class="stars">
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star text-warning"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="price">$45.00</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-slide-button swiper-button-prev"></div>
                <div class="swiper-slide-button swiper-button-next"></div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script>
            new Swiper('.slider-wrapper', {
                slidesPerView: 5,   // Hiển thị 5 slide cùng một lúc
                slidesPerGroup: 5,  // Mỗi lần chuyển động sẽ là 5 slide
                loop: true,         // Lặp lại các slide khi hết
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                    dynamicBullets: true,  // Chuyển động động, thay đổi số dấu chấm
                    type: 'bullets',       // Dấu chấm (bullets)
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });

        </script>

    </div>
    <div class="row" id="thuongHieu">
        <div>
            <img src="imagesTrangChu/brand-image.png"style="height:60px; width: 60px; ">
            <h3 style="transform: translate(60px,-40px);color: #059d23; font-size: 30px;"><b><i>Thương hiệu bán chạy</i></b></h3>
        </div>
        <div class="col-6" style="text-align: right;">
            <img src="imagesTrangChu/thuonghieu1.avif" style="height: 500px;">
        </div>
        <div class="col-3" style="text-align: right;">
            <img src="imagesTrangChu/thuonghieu2.webp" style="height: 250px ;">
            <img src="imagesTrangChu/thuonghieu3.webp" style="height: 250px ;">
        </div>
        <div class="col-3" style="text-align: left;">
            <img src="imagesTrangChu/thuonghieu4.webp" style="height: 250px ;">
            <img src="imagesTrangChu/thuonghieu1.webp" style="height: 250px ;">
        </div>
    </div>
    <div class="row"  style="margin-top: 50px; text-align: center;">
        <h3 style="color: #059d23; font-size: 30px;"><b><i>Khách hàng của chúng tôi</i></b></h3>
    </div>
    <div class="row" id="danhGia">
        <div class="col-3">
            <div class="review-card">
                <div class="review-rating" style="display: flex; justify-content: center;">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9734;</span> <!-- Một ngôi sao chưa được đánh giá -->
                </div>
                <div class="review-content">
                    <p class="review-text">Sản phẩm tuyệt vời, chất lượng rất tốt. Tôi rất hài lòng với sự lựa chọn này!</p>
                    <div class="review-header">
                        <div class="review-info">
                            <h3 class="reviewer-name">Nguyễn Văn A</h3>
                            <p class="review-date">Ngày 10/11/2024</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="review-card">
                <div class="review-rating" style="display: flex; justify-content: center;">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9734;</span> <!-- Một ngôi sao chưa được đánh giá -->
                </div>
                <div class="review-content">
                    <p class="review-text">Sản phẩm tuyệt vời, chất lượng rất tốt. Tôi rất hài lòng với sự lựa chọn này!</p>
                    <div class="review-header">
                        <div class="review-info">
                            <h3 class="reviewer-name">Nguyễn Văn A</h3>
                            <p class="review-date">Ngày 10/11/2024</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="review-card">
                <div class="review-rating" style="display: flex; justify-content: center;">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9734;</span> <!-- Một ngôi sao chưa được đánh giá -->
                </div>
                <div class="review-content">
                    <p class="review-text">Sản phẩm tuyệt vời, chất lượng rất tốt. Tôi rất hài lòng với sự lựa chọn này!</p>
                    <div class="review-header">
                        <div class="review-info">
                            <h3 class="reviewer-name">Nguyễn Văn A</h3>
                            <p class="review-date">Ngày 10/11/2024</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="review-card">
                <div class="review-rating" style="display: flex; justify-content: center;">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9734;</span> <!-- Một ngôi sao chưa được đánh giá -->
                </div>
                <div class="review-content">
                    <p class="review-text">Sản phẩm tuyệt vời, chất lượng rất tốt. Tôi rất hài lòng với sự lựa chọn này!</p>
                    <div class="review-header">
                        <div class="review-info">
                            <h3 class="reviewer-name">Nguyễn Văn A</h3>
                            <p class="review-date">Ngày 10/11/2024</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" id="moTa" style="text-align: justify; margin-left: 10px; margin-right: 10px;">
        <img src="imagesTrangChu/prestige.png" style="height: 70px; width: 90px; margin-right: 10px;">
        <h3 style="font-size: 30px;color: #059d23; transform: translate(70px,-50px);"><b><i>Chuỗi nhà thuốc uy tín hàng đầu Việt Nam</i></b></h3>
        <b style="margin-left: -10px; margin-top:-30px ;"><i>Với hơn 12 năm hoạt động, chúng tôi tự hào là người bạn đồng hành tin cậy của hàng triệu người dân Việt Nam trên hành trình nâng cao chất lượng sức khỏe. Hệ thống gần 1000 nhà thuốc đạt chuẩn GPP trên toàn quốc trải dài 40 tỉnh thành, cùng đội ngũ gần 5000 Dược sĩ, Vitamin A+ mang đến dịch vụ chăm sóc sức khỏe tận tâm và trải nghiệm mua sắm tiện lợi cho mọi khách hàng.</i></b>
        <b style="margin-left: -10px;">Sản phẩm chính hãng, giá tốt</b>
        Chúng tôi cam kết cung cấp sản phẩm chính hãng, đa dạng từ thuốc cho các nhóm bệnh: Tiểu Đường, Huyết Áp, Mỡ Máu, Tiêu Hóa, Hô Hấp,… đến thực phẩm chức năng, sản phẩm chăm sóc sức khỏe, sắc đẹp, thiết bị y tế thuộc các thương hiệu hàng đầu thế giới như: Abbott, GSK, Sanofi, Astrazeneca, Pfizer, Mega Lifesciences, Goodlife, L’oreal,… và các thương hiệu uy tín tại Việt Nam như Dược Hậu Giang, Nam Hà,… Bên cạnh đó, chúng tôi luôn chú trọng bảo quản sản phẩm trong điều kiện tốt nhất, đảm bảo chất lượng đến tay người tiêu dùng.
        <b style="margin-left: -10px;">Mua sắm tiện lợi, giao hàng nhanh chóng</b>
        Thấu hiểu nhu cầu đa dạng của khách hàng, Vitamin A+ mang đến hệ thống mua sắm đa kênh vô cùng tiện lợi:
        Mua trực tiếp tại nhà thuốc: Hệ thống gần 1000 nhà thuốc Vitamin A+ trải dài 40 tỉnh thành.
        Mua hàng trực tuyến: Truy cập trang https://www.pharmacity.vn/ hoặc ứng dụng Pharmacity.
        Giao hàng siêu tốc: Giao hàng nhanh chóng trong vòng 2 giờ tại các thành phố lớn.
        Hợp tác với đối tác lớn, uy tín: Grab, Shopee, Lazada, Tiki…
        Chính sách ưu đãi dành cho khách hàng thân thiết
        Pharmacity triển khai chương trình P-Thành Viên hấp dẫn. Mỗi giao dịch mua sắm, khách hàng đều được tích điểm và có thể sử dụng điểm để trừ tiền cho các lần mua sau. Ngoài ra, Pharmacity luôn có các chương trình khuyến mãi, ưu đãi dành riêng cho khách hàng thân thiết.
        <b style="margin-left: -10px;">Lựa chọn Vitamin A+, lựa chọn an tâm cho sức khỏe bản thân và gia đình!</b></p>
    </div>
    <div class="row" id="camKet">
        <div class="col-3" style="display: flex;">
            <img src="imagesTrangChu/fast.png" style="height: 60px;width: 60px;">
            <div style="margin-top: 10px; margin-left: 15px;">
                <p style="margin-bottom: 1px;"><b>Giao hàng siêu tốc</b></p>
                <p style="color: gray;">Giao tận nhà/ nhận tại nhà thuốc</p>
            </div>
        </div>
        <div class="col-3" style="display: flex;">
            <img src="imagesTrangChu/herbal.png" style="height: 60px;width: 60px;">
            <div style="margin-top: 10px; margin-left: 15px;">
                <p style="margin-bottom: 1px;"><b>Thuốc đa dạng</b></p>
                <p style="color: gray;">Đa dạng, chuyên sâu</p>
            </div>
        </div>
        <div class="col-3" style="display: flex;">
            <img src="imagesTrangChu/free-shipping.png" style="height: 60px;width: 60px;">
            <div style="margin-top: 10px; margin-left: 15px;">
                <p style="margin-bottom: 1px;"><b>Miễn phí vận chuyển</b></p>
                <p style="color: gray;">Theo chính sách giao hàng.</p>
            </div>
        </div>
        <div class="col-3" style="display: flex;">
            <img src="imagesTrangChu/like.png" style="height: 60px;width: 60px;">
            <div style="margin-top: 10px; margin-left: 15px;">
                <p style="margin-bottom: 1px;"><b>Cam kết 100%</b></p>
                <p style="color: gray;">Chất lượng sản phẩm.</p>
            </div>
        </div>
    </div>
    <div class = "row" id="veChungToi" style="margin-top: 30px;">
        <div>
            <img src="imagesTrangChu/partners.png" style="height: 60px;width: 60px;">
            <p style="font-size: 30px; transform: translate(90px,-53px); color: #059d23;" ><i><b>Về Vitamin A</b><span class="superscript"><b>+</b></span></i></p>
        </div>
        <div class="container" id="veChungToiCon">
            <div class = "icon">
                <div class="imgBx active" style="--i:1;" data-id = "content1">
                    <img src="imagesTrangChu/penguin.png">
                </div>
                <div class="imgBx " style="--i:2;" data-id = "content2">
                    <img src="imagesTrangChu/panda.png">
                </div>
                <div class="imgBx" style="--i:3;" data-id = "content3">
                    <img src="imagesTrangChu/ghost.png">
                </div>
                <div class="imgBx" style="--i:4;" data-id = "content4">
                    <img src="imagesTrangChu/cat (2).png">
                </div>
                <div class="imgBx" style="--i:5;" data-id="content5">
                    <img src="imagesTrangChu/giraffe.png">
                </div>
                <div class="imgBx" style="--i:6;" data-id="content6">
                    <img src="imagesTrangChu/green-turtle.png">
                </div>
            </div>
            <div class="content">
                <div class="contentBx active" id="content1">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/penguin.png">
                        </div>
                        <div class="textBx">
                            <h2>Thới Trọng<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contentBx" id="content2">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/panda.png">
                        </div>
                        <div class="textBx">
                            <h2>Đức Lộc<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contentBx" id="content3">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/ghost.png">
                        </div>
                        <div class="textBx">
                            <h2>Phi Long<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contentBx" id="content4">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/cat (2).png">
                        </div>
                        <div class="textBx">
                            <h2>Linh An<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contentBx" id="content5">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/giraffe.png">
                        </div>
                        <div class="textBx">
                            <h2>Mỹ Hoàng<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contentBx" id="content6">
                    <div class="card_about">
                        <div class="imgBx">
                            <img src="imagesTrangChu/green-turtle.png">
                        </div>
                        <div class="textBx">
                            <h2>Trung Đoan<br><span></span></h2>
                            <ul class="sci">
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-github"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let imgBx = document.querySelectorAll('.imgBx');
            let contentBx=document.querySelectorAll('.contentBx');
            for(let i=0; i<imgBx.length; i++)
            {
                imgBx[i].addEventListener('mouseover',function(){
                    for(let i = 0;i<contentBx.length;i++){
                        contentBx[i].className= 'contentBx';
                    }
                    document.getElementById(this.dataset.id).className = 'contentBx active';
                    for(let i=0;i<imgBx.length;i++){
                        imgBx[i].className = 'imgBx';
                    }
                    this.className = 'imgBx active';
                })
            }
        </script>
    </div>
    <div class = "row">
        <%@include file="/footer.html"%>
    </div>
</div>
</body>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" width="0" height="0">
    <defs>
        <path id="circlePath" d="M 150, 150 m -50, 0 a 50,50 0 0,1 100,0 a 50,50 0 0,1 -100,0" />
    </defs>
</svg>
</html>