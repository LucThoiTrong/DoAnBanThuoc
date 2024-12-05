<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Thuốc không kê đơn</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="footer-bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
</head>
<body>
<div class="row">
  <c:choose>
    <c:when test="${not empty sessionScope.khachHang}">
      <jsp:include page="headerSauDN.jsp"/>
    </c:when>
    <c:otherwise>
      <jsp:include page="header.html"/>
    </c:otherwise>
  </c:choose>
</div>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/chiTietSanPham.css">
  <!-- Phần giới thiệu chung -->
  <div class="site-wrap">
    <div class="site-section">
      <div class="container">
        <div class="container product-container">
          <div class="row p-4 border rounded shadow bg-white">
            
            <!-- Phần hình ảnh sản phẩm -->
            <div class="product-image-section col-lg-5 col-md-6 mb-4">
              <div class="product-main-image">
                <img src="imageMedicine/15.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Bột pha uống Smecta 3g Hương Dâu điều trị tiêu chảy, rối loạn tiêu hóa (hộp 12 gói)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">Hộp 12 gói</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Ipsen Pharma</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">Pháp</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">53.000</span>
                <span><span class="product-price"><u> đ</u></span>/</span>
                <div class="unit-selector">
                  <!-- active là nút sẽ hiện ban đầu khi nào, nút này khớp với giá bên trên -->
                  <button class="btn unit-btn active" data-unit="Hộp" data-id-don-vi-tinh="2" onclick="updatePrice('Hộp')">Hộp</button>
                  <button class="btn unit-btn" data-unit="Gói" data-id-don-vi-tinh="6" onclick="updatePrice('Gói')">Gói</button>
                </div>
              </div>
              <!-- JavaScript cập nhật giá -->
              <script>
                function updatePrice(unit) {
                  // Cập nhật giá của sản phẩm dựa trên đơn vị tính
                  const priceElement = document.getElementById("product-price");

                  // Đặt giá dựa vào đơn vị
                  if (unit === "Hộp") {
                    priceElement.textContent = "66.000";
                  } else if (unit === "Gói") {
                    priceElement.textContent = "4.500";
                  }

                  // Cập nhật lớp 'active' cho nút
                  const buttons = document.querySelectorAll('.unit-btn');
                  buttons.forEach(button => {
                    if (button.getAttribute('data-unit') === unit) {
                      button.classList.add('active');
                    } else {
                      button.classList.remove('active');
                    }
                  });
                }
              </script>
              <!-- javascript cập nhật giá -->
              <script>
                function updatePrice(unit) {
                  const priceElement = document.getElementById("product-price");
                  if (unit === "Hộp") {
                    priceElement.textContent = "66.000";
                  } else if (unit === "Gói") {
                    priceElement.textContent = "4.500";
                  }
                }
              </script>
              <!-- Chọn số lượng -->
              <div class="quantity-selector">
                <span class="detail-title">Chọn số lượng</span>
                <button class="btnSoLuong" id="decrease-quantity">-</button>
                <input type="number" id="quantity" value="1" class="form-control text-center" min="1" max="99">
                <button class="btnSoLuong" id="increase-quantity">+</button>
              </div>
              
              <div class="d-flex flex-column flex-sm-row gap-2 mt-3">
                <div class="container">
                  <button class="btnthemGioHang btnthemGioHang-white btnthemGioHang-animate" id="thuocKD" onclick="ThemSanPham()">THÊM VÀO GIỎ HÀNG</button>
                </div>
                <script>
                  function ThemSanPham() {
                    // Lấy số lượng sản phẩm từ input
                    const quantity = document.getElementById('quantity').value;

                    // Lấy giá trị đơn vị tính đang được chọn
                    const activeUnit = document.querySelector('.unit-btn.active').getAttribute('data-id-don-vi-tinh');

                    // Xuất ra kiểm tra
                    // console.log("Số lượng sản phẩm: " + quantity);
                    // console.log("ID đơn vị tính đang được chọn: " + activeUnit);

                    // Thêm biến action với giá trị addSanPham
                    const action = 'addSanPham'; // Đảm bảo rằng action được khai báo

                    // Xây dựng URL với các tham số
                    const urlParams = new URLSearchParams(window.location.search);
                    const productId = urlParams.get('idSanPham');  // Lấy giá trị của tham số idSanPham
                    // console.log("ID sản phẩm " + productId);

                    // Xây dựng URL mới với các giá trị đã lấy và cộng chuỗi
                    // const newUrl = 'servletDatHangKH?action=' + action + '&quantity=' + quantity + '&unit=' + activeUnit + '&productId=' + productId;
                    // console.log("Đường dẫn URL mới: " + newUrl);

                    // Kiểm tra xem khách hàng đã đăng nhập hay chưa
                    // Kiểm tra đăng nhập
                    fetch('servletCheckLogin')
                            .then(response => response.text())
                            .then(isLoggedIn => {
                              if (isLoggedIn === 'true') {
                                // Nếu đã đăng nhập, điều hướng tới servlet DatHangKH
                                const newUrl = 'servletDatHangKH?action=' + action + '&quantity=' + quantity + '&unit=' + activeUnit + '&productId=' + productId;
                                window.location.href = newUrl;
                              } else {
                                // Nếu chưa đăng nhập, yêu cầu đăng nhập lại
                                alert("Bạn cần đăng nhập trước khi thực hiện hành động này.");
                                window.location.href = 'signin.html'; // Điều hướng đến trang đăng nhập
                              }
                            })
                            .catch(error => {
                              console.error('Lỗi kiểm tra đăng nhập:', error);
                            });
                  }
                </script>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="site-wrap">
    <div class="site-section">
      <div class="container">
        <!-- Bắt đầu khung viền bao quanh cả sidebar và content area -->
        <div class="col-12 p-4 border rounded shadow">
          <div class="row">
            <!-- side-bar -->
            <div class="col-lg-3 d-none d-lg-block">
              <aside class="sidebar sticky-top">
                <ul>
                  <li><a href="#composition" class="d-block py-2">Thành phần</a></li>
                  <li><a href="#usage" class="d-block py-2">Công dụng</a></li>
                  <li><a href="#dosage" class="d-block py-2">Cách dùng</a></li>
                  <li><a href="#side-effects" class="d-block py-2">Tác dụng phụ</a></li>
                  <li><a href="#warnings" class="d-block py-2">Lưu ý</a></li>
                  <li><a href="#warnings" class="d-block py-2">Bảo quản</a></li>
                </ul>
              </aside>
            </div>
            <!-- Content Area -->
            <div class="col-lg-9">
              <div class="content p-4 bg-light rounded shadow-sm">
                <h3>Bột pha uống Smecta 3g Hương Dâu là gì?</h3>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần Bột pha uống Smecta 3g Hương Dâu</h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Diosmectit</td>
                        <td>3.00g</td>
                      </tr>
                    </tbody>
                  </table>
                  <p>Tá dược: Glucose monohydrat, natri saccharin, hương dâu*.</p>
                  <p>*Thành phần hương dâu: maltodextrin, propylen glycol, 
                    gôm arabic, chất tạo mùi tổng hợp và tự nhiên.</p>
                  <p>Thành phần tá dược có tác dụng dược lý: Glucose, propylene glycol.</p>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng Bột pha uống Smecta 3g Hương Dâu</h4>
                  <ul class="mt-2">
                    <strong>Chỉ định</strong>
                    <li>Điều trị tiêu chảy cấp ở trẻ em trên 2 tuổi và người lớn, 
                      kết hợp với việc bổ sung nước và các chất điện giải đường uống.</li>
                    <li>Điều trị triệu chứng các chứng đau liên quan tới rối loạn chức năng ruột</li>
                    <li>Trẻ em dưới 2 tuổi.</li>
                    <strong>Chống chỉ định</strong>
                    <li>Dị ứng với diosmectit hoặc bất cứ thành phần tá dược nào của thuốc.</li>
                    <li>Sử dụng thuốc cho phụ nữ có thai và cho con bú.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách sử dụng Bột pha uống Smecta 3g Hương Dâu</h4>
                  <ul class="mt-2">
                    <strong>Liều dùng:</strong>
                    <br>Điều trị tiêu chảy cấp:
                    <li>Trẻ trên 2 tuổi: 4 gói/ngày trong 3 ngày đầu. 
                      Sau đó 2 gói/ngày trong 4 ngày.</li>
                    <li>Người lớn: trung bình 3 gói/ngày trong 7 ngày. 
                      Trên thực tế liều hằng ngày có thể tăng gấp đôi trong 
                      những ngày đầu điều trị.</li>
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <p>Những phản ứng bất lợi của thuốc đã được báo cáo trong các 
                    nghiên cứu lâm sàng ở trẻ em và người lớn. Các phản ứng bất 
                    lợi này thường nhẹ và thoáng qua và chủ yếu liên quan đến hệ 
                    tiêu hóa.

                    <br>Thường gặp: Táo bón, thường được giải quyết bằng cách giảm 
                    liều, nhưng trong một số trường hợp hiếm gặp có thể cần ngưng 
                    điều trị.
                    
                    <br>Không thường gặp: Đầy hơi, nôn.

                    <br>Trong suốt quá trình thuốc lưu hành trên thị trường, một số 
                    trường hợp phản ứng quá mẫn (tần suất không rõ) được báo cáo, 
                    bao gồm mày đay, phát ban, ngứa và phù mạch.

                    <br>Có vài trường hợp táo bón tiến triển cũng được ghi nhận.</p>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dụng của sản phẩm.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Bảo quản trong bao bì kín, tránh ẩm, tránh ánh sáng, nhiệt độ dưới 30°C.</p>
                </section>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="script.js"></script>

<%--Danh Gia--%>
<%-- Kiểm tra nếu khách hàng không phải null mới hiển thị phần đánh giá --%>
<% KhachHang kh = (KhachHang) session.getAttribute("khachHang");  %>
<% if (kh != null) { %>

<div class="container my-5">
  <div class="card shadow-lg">
    <div class="card-header" >
      <h3><strong>Đánh giá sản phẩm</strong></h3>
    </div>
    <div class="card-body">
      <!-- Form đánh giá -->
      <form action="<%= request.getRequestURI() %>" method="post">
        <!-- Đánh giá sao -->
        <div class="mb-3">
          <label for="rating" class="form-label font-weight-bold">Xếp hạng:</label>
          <div id="rating" class="d-flex">
            <i class="rating-star fa fa-star" data-value="1"></i>
            <i class="rating-star fa fa-star" data-value="2"></i>
            <i class="rating-star fa fa-star" data-value="3"></i>
            <i class="rating-star fa fa-star" data-value="4"></i>
            <i class="rating-star fa fa-star" data-value="5"></i>
          </div>
          <div class="rating-feedback font-weight-bold " id="ratingFeedback">
            <!-- Nội dung đánh giá sẽ được cập nhật ở đây -->
          </div>
          <input type="hidden" id="ratingValue" name="rating" required>
        </div>
        <!-- Nhận xét -->
        <div class="mb-3">
          <label for="comment" class="form-label font-weight-bold">Nhận xét</label>
          <textarea class="form-control" id="comment" name="comment" rows="4" required placeholder="Nhập nhận xét của bạn"></textarea>
        </div>
        <!-- Nút gửi -->
        <button type="submit" class="btnGuiDanhGia w-50 mx-auto d-block font-weight-bold">GỬI ĐÁNH GIÁ</button>
      </form>
    </div>
  </div>
</div>
<% } else { %>
<div class="container my-5">
  <div class="alert alert-warning text-center" role="alert">
    Bạn cần đăng nhập để gửi đánh giá!
  </div>
</div>
<% } %>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<!-- Custom JavaScript -->
<script>
  const feedbackTexts = {
    1: "1 sao - Không hài lòng",
    2: "2 sao - Cũng tạm",
    3: "3 sao - Bình thường",
    4: "4 sao - Hài lòng",
    5: "5 sao - Rất hài lòng"
  };

  document.querySelectorAll('.rating-star').forEach(star => {
    star.addEventListener('click', () => {
      const ratingValue = star.getAttribute('data-value');
      document.getElementById('ratingValue').value = ratingValue;

      // Highlight stars
      document.querySelectorAll('.rating-star').forEach(s => s.classList.remove('checked'));
      for (let i = 0; i < ratingValue; i++) {
        document.querySelectorAll('.rating-star')[i].classList.add('checked');
      }

      // Cập nhật nội dung phản hồi và thay đổi màu cho phản hồi
      const feedbackElement = document.getElementById('ratingFeedback');
      feedbackElement.textContent = feedbackTexts[ratingValue];
      feedbackElement.classList.add('checked'); // Thêm lớp để làm màu vàng cho văn bản
    });
  });
</script>



<%@ page import="java.sql.*, Model.BusinessModels.SanPham.DanhGia, Model.DatabaseModels.IDanhGia, Model.BusinessModels.SanPham.SanPham, Model.DatabaseModels.ISanPham, Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang" %>
<%@ page import="Model.DatabaseModels.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.Set" %>

<%-- Hiển thị đánh giá --%>
<%@ page import="java.util.Set, java.util.Date" %>
<%@ page import="Model.DatabaseModels.IDanhGia" %>
<%@ page import="Model.BusinessModels.SanPham.DanhGia" %>
<%@ page import="Model.DatabaseModels.IKhachHang" %>

<%
  // Tạo đối tượng IDanhGia
  IDanhGia iDanhGia = new IDanhGia();

  // Lấy danh sách đánh giá từ phương thức SelectAll
  Set<DanhGia> danhGiaSet = iDanhGia.SelectAll();

  // Kiểm tra nếu có dữ liệu
  if (danhGiaSet != null && !danhGiaSet.isEmpty()) {
%>
<!-- Bắt đầu hiển thị đánh giá -->
<div class="reviews-container">
  <% for (DanhGia dg : danhGiaSet) {
    // Lấy thông tin khách hàng từ đánh giá
    int khachHangId = dg.getKhachHang().getId();
    KhachHang khComment = new IKhachHang().SelectById(khachHangId);
    String tenKH = khComment.getTen();

    String noiDung = dg.getNoiDungDanhGia();
    int rating = dg.getDiemDanhGia();
    Date ngay = dg.getNgayDanhGia();

    if (dg.getSanPham() != null && dg.getSanPham().getId() == 8){
  %>
  <div class="container">
    <!-- Căn giữa bằng cách sử dụng d-flex và các lớp Bootstrap -->
    <div class="row justify-content-center align-items-center">
      <div class="col-12"> <!-- Điều chỉnh kích thước của ô review -->
        <div class="review">
          <p><strong><%= tenKH %></strong></p>
          <p class="date"><%= ngay %></p>
          <p class="rating">
            <% var out1 = ""; %> <!-- Khai báo biến out ở đây -->
            <% for (var i = 0; i < 5; i++) { %> <!-- Sử dụng var thay vì let -->
            <% if (i < rating) { %>
            <% out1 += '★'; %> <!-- Sao đầy -->
            <% } else { %>
            <% out1 += '☆'; %> <!-- Sao rỗng -->
            <% } %>
            <% } %>
            <%= out1 %> <!-- Hiển thị kết quả -->
          </p>
          <p class="comment"><%= noiDung %></p>
        </div>
      </div>
    </div>
  </div>

      <% } %>

<!-- CSS -->
<style>
  /* Mỗi phần tử review */
  .review {
    border: 1px solid #e1e1e1;
    padding: 20px;
    margin: 20px 0;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
  }

  .review:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
  }

  /* Rating - Tạo sao đánh giá hiển thị rõ ràng và dễ nhìn */
  .rating {
    font-size: 18px;
    color: #f39c12;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
  }

  /* Sao đánh giá */
  .rating .star {
    font-size: 20px;
    color: #f39c12;
    margin-right: 5px;
  }

  /* Nhận xét */
  .comment {
    font-size: 15px;
    margin-top: 10px;
    color: #333;
    font-style: italic;
  }

  /* Ngày tháng */
  .date {
    font-size: 13px;
    color: #888;
    margin-top: 10px;
  }

  /* Tạo một kiểu ngắn cho phần tiêu đề khách hàng */
  .review p strong {
    font-size: 16px;
    color: #333;
    font-weight: bold;
  }

  /* Thêm hiệu ứng cho hover trong phần đánh giá */
  .review:hover .rating {
    color: #f27c1f; /* Màu vàng cam sáng hơn khi hover */
  }

  /* Cải thiện kiểu chữ và padding cho nội dung */
  .review p {
    margin: 5px 0;
  }

  /* Tạo một thiết kế đồng bộ với background */
  body {
    background-color: #f7f8fa;
  }

  /* Phần gửi đánh giá (Form Đánh Giá) */
  .review-form {
    margin-top: 30px;
    padding: 20px;
    border: 1px solid #e1e1e1;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  /* Hiển thị sao đánh giá cho form */
  .review-form .rating {
    display: flex;
    justify-content: flex-start;
    margin-bottom: 10px;
  }

  .review-form .rating .star {
    font-size: 30px;
    color: #e1e1e1;
    cursor: pointer;
    transition: color 0.3s ease;
  }

  .review-form .rating .star.active {
    color: #f39c12; /* Màu vàng cho sao đã chọn */
  }

  /* Khi hover vào sao */
  .review-form .rating .star:hover,
  .review-form .rating .star:hover ~ .star {
    color: #f39c12; /* Khi hover, tất cả các sao trước sao được hover sẽ chuyển sang màu vàng */
  }

  /* Phần nhận xét trong form */
  .review-form .comment-input {
    width: 100%;
    height: 100px;
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
    border: 1px solid #e1e1e1;
    font-size: 14px;
    color: #333;
    resize: none;
  }

  /* Nút gửi đánh giá */
  .review-form button {
    padding: 10px 20px;
    background-color: #f39c12;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
  }

  .review-form button:hover {
    background-color: #f27c1f; /* Màu cam khi hover */
  }
</style>

<%
  // Kiểm tra xem người dùng đã đăng nhập chưa
  if (kh != null && request.getMethod().equalsIgnoreCase("POST")) {
        if (session.getAttribute("submitted") != null && (Boolean) session.getAttribute("submitted")) {
        response.getWriter().println("Bạn đã gửi đánh giá.");
        return;
    }
    // Lấy thông tin đánh giá từ form
    String comment = request.getParameter("comment");
    String rating1 = request.getParameter("rating");
    int ratingValue = Integer.parseInt(rating1);

    // Lấy ngày và giờ hiện tại
    LocalDate currentDate = LocalDate.now();
    LocalTime currentTime = LocalTime.now();
    java.sql.Date ngayDanhGia = java.sql.Date.valueOf(currentDate);
    Time thoiGianDanhGia = Time.valueOf(currentTime);

    // Tạo đối tượng DanhGia và lưu vào cơ sở dữ liệu
    int SanPhamID = 8;
    SanPham sp = new ISanPham().SelectById(SanPhamID);
    DanhGia dg1 = new DanhGia(ratingValue, kh, ngayDanhGia, comment, sp, thoiGianDanhGia);

    IDanhGia danhGiaDAO = new IDanhGia();
    danhGiaDAO.insert(dg1);

    // Đánh dấu đã gửi và redirect
    session.setAttribute("submitted", true);
    response.sendRedirect(request.getRequestURI());
    }}}
  %>


<div class="container">
  <div class="row footer">
    <%@ include file="footer.html"%>
  </div>
</div>
</body>
</html>