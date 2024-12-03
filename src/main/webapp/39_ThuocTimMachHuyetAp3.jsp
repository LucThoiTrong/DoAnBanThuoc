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
                <img src="imageMedicine/39.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>ViimageMedicineở ruột Aspilets EC phòng ngừa nhồi máu cơ tim, đau thắt ngực (10 vỉ x 10 viên)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">10 vỉ x 10 viên</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Việt Nam</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">UNITED PHARMA INC</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">100.000</span>
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
                <h3>Thuốc Aspilets EC là gì?
                </h3>
                <!-- Mô tả -->
                <section id="description" class="mt-5">
                  <h4>Mô tả</h4>
                  <p>
                    Thuốc Aspilets EC của UNITED Việt Nam dạng viên uống 80mg có thành phần chính là Acid Acetylsalicylic. Aspilets EC chỉ định để phòng ngừa tái phát cho những bệnh nhân có tiền sử nhồi máu cơ tim, tiền sử đột quỵ, điều trị dự phòng chứng huyết khối cho những bệnh nhân nguy cơ cao xơ vữa động mạch.
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần của Thuốc Aspilets EC
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
                        <td>Acetylsalicylic acid

                        </td>
                        <td>80mg</td>
                      </tr>
                    </tbody>
                  </table>
                  <p>Tá dược: Propyl paraben, methyl paraben, natri dihydrophosphat 
                    monohydrat, dinatri hydrophosphat, natri hydroxid, sorbitol, 
                    glycerin, sucralose, gôm xanhthan, hương cam, nước tinh khiết.</p>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng Dung dịch uống Cynamus CPC1</h4>
                  <ul class="mt-2">
                    <li><strong>Chỉ định</strong></li>
                    <li>Thuốc Aspilets EC chỉ định để phòng ngừa tái phát cho những bệnh nhân có tiền sử nhồi máu cơ tim, tiền sử đột quỵ, điều trị dự phòng chứng huyết khối cho những bệnh nhân nguy cơ cao xơ vữa động mạch.</li>
                    <li>Phòng ngừa tái phát cho những bệnh nhân có tiền sử nhồi máu cơ tim, tiền sử đột quỵ, cơn đau thắt ngực ổn định và không ổn định, cơn thiếu máu thoáng qua, bệnh lý mạch máu ngoại vi, các thủ thuật mạch máu như phẫu thuật nong mạch vành và phẫu thuật bắc cầu mạch vành.</li>
                    <li>Điều trị dự phòng chứng huyết khối cho những bệnh nhân nguy cơ cao xơ vữa động mạch như cholesterol LDL/máu cao, nam trên 40 hoặc phụ nữ sau mãn kinh, tăng huyết áp (sau khi kiểm soát được huyết áp), hút thuốc, đái tháo đường, tiền sử gia đình có bệnh mạch vành.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách sử dụng Dung dịch uống Cynamus CPC1</h4>
                  <ul class="mt-2">
                    <li><strong>Liều dùng</strong></li>
                    <li>Liều dùng thông thường thuốc Aspilets Ec là 1 - 2 viên, một lần mỗi ngày hoặc theo sự hướng dẫn của thầy thuốc.
                    </li>
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <p>Khi sử dụng thuốc Aspilets Ec bạn có thể gặp các tác dụng không mong muốn (ADR).

                    <br>Phản ứng phụ của Acid Acetylsalicylic thường liên quan đến hệ tiêu hóa như: Buồn nôn, nôn, khó tiêu, khó chịu thượng vị, ợ nóng, đau dạ dày, loét tiêu hóa, nặng hơn có thể xuất huyết tiêu hóa.
                    
                    <br>Hệ thần kinh trung ương: Mệt mỏi, (Ít gặp) mất ngủ, bồn chồn, cáu gắt.
                    
                    <br>Da: Ban, mày đay.
                    
                    <br>Huyết học: Thiếu máu tan máu, (Ít gặp) thời gian chảy máu kéo dài, giảm bạch cầu, giảm tiểu cầu.
                    
                    <br>Thần kinh - cơ và xương: Yếu cơ.
                    
                    <br>Hô hấp: Khó thở, (Ít gặp) co thắt phế quản.
                    
                    <br>Gan, thận (Ít gặp) độc hại gan và suy giảm chức năng thận.
                    
                    <br>Khác: Sốc phản vệ.
                    
                    Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.</p>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Thận trọng khi sử dụng

                    <br>Khi điều trị cho người bị suy tim nhẹ, bệnh thận hoặc bệnh gan, đặc biệt khi dùng đồng thời với thuốc lợi tiểu, cần quan tâm xem xét cẩn thận nguy cơ giữ nước và nguy cơ giảm chức năng thận.
                    
                    <br>Trẻ em: Tránh sử dụng Acid Acetylsalicylic cho trẻ sốt do virus (bệnh cúm hoặc bệnh thủy đậu) vì nguy cơ bị hội chứng Reye, một bệnh lý hiếm gặp nhưng nghiêm trọng trên gan và hệ thần kinh có thể dẫn đến hôn mê và tử vong.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Bảo quản nơi khô, nhiệt độ không quá 30°C, tránh ánh sáng.

                    <br>Hạn dùng: 24 tháng kể từ ngày sản xuất.
                    
                    </p>
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