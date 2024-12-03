<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container">
  <div class="row">
    <jsp:include page="header.html"/>
  </div>
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
                <img src="imageMedicine/32.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Viên nang Avodart 0.5mg điều trị tăng sản lành tính tuyến tiền liệt (3 vỉ x 10 viên)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">3 vỉ x 10 viên</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Anh</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">GlaxoSmithKline ETC</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">185.000</span>
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
                <h3>Thuốc Avodart 0.5mg là gì?
                </h3>
                <!-- Mô tả -->
                <section id="description" class="mt-5">
                  <h4>Mô tả</h4>
                  <p>
                    Thuốc Avodart là viên nén chứa hoạt chất dutasteride được chỉ định để điều trị và phòng ngừa sự tiến triển của bệnh tăng sản lành tính tuyến tiền liệt thông qua việc làm giảm triệu chứng, giảm kích thước (thể tích) của tuyến tiền liệt, cải thiện lưu thông nước tiểu và giảm nguy cơ bí tiểu cấp tính (AUR - Acute Urinary Retention) cũng như giảm nhu cầu phẫu thuật liên quan đến BPH.
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần của Thuốc Avodart 0.5mg
                </h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Dutasteride</td>
                        <td>0.5mg</td>
                      </tr>
                    </tbody>
                  </table>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng của Thuốc Avodart 0.5mg
                </h4>
                  <ul class="mt-2">
                    <li><strong>Chỉ định</strong></li>
                    <li>Điều trị và phòng ngừa sự tiến triển của bệnh tăng sản lành tính tuyến tiền liệt thông qua việc làm giảm triệu chứng, giảm kích thước (thể tích) của tuyến tiền liệt, cải thiện lưu thông nước tiểu và giảm nguy cơ bí tiểu cấp tính (AUR - Acute Urinary Retention) cũng như giảm nhu cầu phẫu thuật liên quan đến BPH.</li>
                    <li>Ngoài ra, Avodart cũng được kết hợp với tamsulosin là một thuốc chẹn alpha để điều trị và phòng ngừa sự tiến triển của bệnh tăng sản lành tính tuyến tiền liệt (BPH) thông qua việc làm giảm kích thước tuyến tiền liệt, giảm triệu chứng, cải thiện lưu thông nước tiểu và giảm nguy cơ bí tiểu cấp tính (AUR) cũng như nhu cầu phẫu thuật liên quan đến BPH.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách dùng Thuốc Avodart 0.5mg</h4>
                  <ul class="mt-2">
                    <li><strong>Liều dùng</strong></li>
                    <li>Nên nuốt nguyên viên nang, không nên nhai hoặc mở nang ra vì tiếp xúc với chất chứa trọng nang có thể gây niên kích ứng niêm mạc miệng - hầu họng. Avodart có thể uống trong hay ngoài bữa ăn, liều đề nghị của Avodart là một viên nang (0,5 mg) uống một lần mỗi ngày.</li>
                    <li>Đã có thể thấy đáp ứng sớm nhưng có thể cần điều trị ít nhất 6 tháng để có thể đánh giá một cách khách quan liệu có đạt được đáp ứng điều trị mạng muốn hay không.</li>
                    <li>Để điều trị bệnh tăng sản lành tính tuyến tiền liệt, Avodart có thể dùng đơn trị liệu hoặc kết hợp với thuốc chẹn alpha tamsulosin (0,4 mg).</li>
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <p>Khi sử dụng thuốc Avodart, bạn có thể gặp các tác dụng không mong muốn (ADR).
                    <br>Khi gặp tác dụng phụ của thuốc, cần ngưng sử dụng và thông báo cho bác sĩ hoặc đến cơ sở y tế gần nhất để được xử trí kịp thời.
                  </p>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Bảo quản trong bao bì kín, tránh ẩm, tránh ánh sáng, nhiệt độ dưới 30ºC.</p>
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
  <div class="container my-5">
    <div class="card shadow-lg">
      <div class="card-header " >
        <h3><strong>Đánh giá sản phẩm</strong></h3>
      </div>
      <div class="card-body">
        <!-- Form đánh giá -->
        <form action="" method="post">
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

  <%--&lt;%&ndash; Phần xử lý dữ liệu &ndash;%&gt;--%>
  <%--<%--%>
  <%--    if (request.getMethod().equalsIgnoreCase("POST")) {--%>
  <%--        // Lấy dữ liệu từ form--%>
  <%--        String fullName = request.getParameter("fullName");--%>
  <%--        String phoneNumber = request.getParameter("phoneNumber");--%>
  <%--        String email = request.getParameter("email");--%>
  <%--        String rating = request.getParameter("rating");--%>
  <%--        String comment = request.getParameter("comment");--%>

  <%--        // Kết nối cơ sở dữ liệu--%>
  <%--        String url = "jdbc:mysql://localhost:3306/your_database_name"; // Thay bằng thông tin của bạn--%>
  <%--        String username = "your_username"; // Thay bằng tài khoản MySQL--%>
  <%--        String password = "your_password"; // Thay bằng mật khẩu MySQL--%>

  <%--        try {--%>
  <%--            Class.forName("com.mysql.cj.jdbc.Driver");--%>
  <%--            Connection conn = DriverManager.getConnection(url, username, password);--%>

  <%--            String sql = "INSERT INTO reviews (fullName, phoneNumber, email, rating, comment) VALUES (?, ?, ?, ?, ?)";--%>
  <%--            PreparedStatement stmt = conn.prepareStatement(sql);--%>

  <%--            stmt.setString(1, fullName);--%>
  <%--            stmt.setString(2, phoneNumber);--%>
  <%--            stmt.setString(3, email);--%>
  <%--            stmt.setInt(4, Integer.parseInt(rating));--%>
  <%--            stmt.setString(5, comment);--%>

  <%--            stmt.executeUpdate();--%>
  <%--            out.println("<script>alert('Đánh giá của bạn đã được lưu thành công!');</script>");--%>
  <%--        } catch (Exception e) {--%>
  <%--            e.printStackTrace();--%>
  <%--            out.println("<script>alert('Có lỗi xảy ra khi lưu dữ liệu. Vui lòng thử lại.');</script>");--%>
  <%--        }--%>
  <%--    }--%>
  <%--%>--%>
<div class="container">
  <div class="row footer">
    <%@ include file="footer.html"%>
  </div>
</div>
</body>
</html>