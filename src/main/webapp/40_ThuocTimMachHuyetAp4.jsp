<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Thuốc kê đơn</title>
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
                <img src="imageMedicine/40.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Viên giải phóng có kiểm soát Trimetazidin Stella 35mg MR trị đau thắt ngực ổn định (3 vỉ x 10 viên)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">3 vỉ x 10 viên</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Việt Nam</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">Công ty TNHH LD Stellapharm</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">150.000</span>
                <span><span class="product-price"><u> đ</u></span>/</span>
                <div class="unit-selector">
                  <!-- active là nút sẽ hiện ban đầu khi nào, nút này khớp với giá bên trên -->
                  <button class="btn unit-btn active" data-unit="Hộp" data-id-don-vi-tinh="2" onclick="updatePrice('Hộp')">Hộp</button>
                </div>
              </div>
              <!-- Chọn số lượng -->
              <div class="quantity-selector">
                <span class="detail-title">Chọn số lượng</span>
                <button class="btnSoLuong" id="decrease-quantity">-</button>
                <input type="number" id="quantity" value="1" class="form-control text-center" min="1" max="99">
                <button class="btnSoLuong" id="increase-quantity">+</button>
              </div>
              <p style="color: #dc1212; font-weight: bold;">Sản phẩm cần tư vấn từ dược sỹ.</p>
              <div class="d-flex flex-column flex-sm-row gap-2 mt-3">
                <div class="container">
                  <button class="btnTuVanNgay btnTuVanNgay-animated"  id="tvnButton">TƯ VẤN NGAY</button>
                  <button class="btnThemVaoGioHang_kedon btnThemVaoGioHang_kedon-animated" id="gdtButton" onclick="ThemSanPham()">THÊM VÀO GIỎ HÀNG</button>
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
                  <li><a href="#description" class="d-block py-2">Mô tả</a></li>
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
                <h3>Thuốc Trimetazidine 35mg là gì?
                </h3>
                <!-- Mô tả -->
                <section id="description" class="mt-5">
                  <h4>Mô tả</h4>
                  <p>
                    Trimetazidine Stella là sản phẩm của công ty TNHH LD Stellapharm, thành phần Trimetazidine hydroclorid. Thuốc được chỉ định cho người lớn như liệu pháp hỗ trợ điều trị triệu chứng ở những bệnh nhân đau thắt ngực ổn định không được kiểm soát đầy đủ hoặc không dung nạp với các liệu pháp điều trị đau thắt ngực khác.
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần Dung dịch uống Cynamus CPC1</h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Trimetazidine

                        </td>
                        <td>35mg

                        </td>
                      </tr>
                    </tbody>
                  </table>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng của Thuốc Trimetazidine 35mg
                </h4>
                  <ul class="mt-2">
                    <li><strong>Chỉ định</strong></li>
                    <li>Thuốc Trimetazidine Stella được chỉ định cho người lớn như liệu pháp hỗ trợ điều trị triệu chứng ở những bệnh nhân đau thắt ngực ổn định không được kiểm soát đầy đủ hoặc không dung nạp với các liệu pháp điều trị đau thắt ngực khác.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách dùng Thuốc Trimetazidine 35mg
                </h4>
                  <ul class="mt-2">
                    <li><strong>Liều dùng</strong></li>
                    <li>Liều thông thường: Mỗi lần uống 1 viên x 2 lần/ngày.</li>
                    <li>Bệnh nhân suy thận mức độ trung bình (độ thanh thải creatinin [30 - 60] ml/ phút):

                        Liều dùng khuyến cáo là 1 viên vào buổi sáng.</li>
                    <li>Bệnh nhân cao tuổi:

                        Bệnh nhân cao tuổi có thể có mức độ nhạy cảm Trimetazidine cao hơn bình thường do sự suy giảm chức năng thận theo tuổi tác. Đối với bệnh nhân suy thận mức độ trung bình (độ thanh thải creatinin [30 - 60] ml/phút) liều dùng khuyến cáo là 1 viên vào buổi sáng.</li>
                    <li>Trẻ em:

                        Mức độ an toàn và hiệu quả của Trimetazidine đối với bệnh nhân dưới 18 tuổi chưa được đánh giá. Hiện không có dữ liệu trên đối tượng bệnh nhân này.</li>
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <p>Khi sử dụng thuốc Trimetazidine Stella, bạn có thể gặp các tác dụng không mong muốn (ADR).

                    <br>Thường gặp (1/ 100 < ADR < 1/10), hiếm gặp (1/10.000 < ADR < 1/1000), chưa rõ tần suất (không thể ước tính từ các dữ liệu có sẵn).</p>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Trimetazidine có thể gây ra hoặc làm trầm trọng thêm triệu chứng Parkinson (run, vận động chậm và khó khăn, tăng trương lực cơ). Do đó bệnh nhân, nhất là bệnh nhân cao tuổi cần được kiểm tra và theo dõi thường xuyên. Trong các trường hợp nghi ngờ, bệnh nhân cần được đưa tới các bác sĩ chuyên khoa thần kinh để được kiểm tra thích hợp.

                    <br>Khi gặp các rối loạn vận động như các triệu chứng Parkinson, hội chứng chân không nghỉ, run, dáng đi không vững cần ngay lập tức ngừng sử dụng Trimetazidine.
                    
                    <br>Các trường hợp này ít xảy ra và thường hồi phục sau khi ngừng thuốc. Phần lớn bệnh nhân hồi phục sau khi ngừng thuốc khoảng 4 tháng. Nếu các triệu chứng Parkinson tiếp tục xảy ra quá 4 tháng sau khi ngừng thuốc, cần tham vấn các bác sĩ chuyên khoa thần kinh.
                    
                    <br>Có thể bị ngã do dáng đi không vững hoặc hạ huyết áp, đặc biệt ở các bệnh nhân đang dùng các thuốc điều trị tăng huyết áp.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>
                    Bảo quản trong bao bì kín, nơi khô, tránh ánh sáng. Nhiệt độ không quá 30°C.</p>
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

    if (dg.getSanPham() != null && dg.getSanPham().getId() == 21){
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
    int SanPhamID = 21;
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