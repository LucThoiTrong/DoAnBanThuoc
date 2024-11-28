<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <!-- Phần giới thiệu chung -->
  <div class="container">
    <div class="row">
      <jsp:include page="header.html"/>
    </div>
  </div>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/chiTietSanPham.css">
  <div class="site-wrap">
    <div class="site-section">
      <div class="container">
        <div class="container product-container">
          <div class="row p-4 border rounded shadow bg-white">
            
            <!-- Phần hình ảnh sản phẩm -->
            <div class="product-image-section col-lg-5 col-md-6 mb-4">
              <div class="product-main-image">
                <img src="imageMedicine/18.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Thuốc Hoạt Huyết Dưỡng Não bao phim Traphaco điều trị suy giảm trí nhớ (5 vỉ x 20 viên)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">5 vỉ x 20 viên</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Công ty CP Công nghệ cao Traphaco</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">Việt Nam</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">95.000</span>
                <span><span class="product-price"><u> đ</u></span>/</span>
                <div class="unit-selector">
                  <!-- active là nút sẽ hiện ban đầu khi nào, nút này khớp với giá bên trên -->
                  <button class="btn unit-btn active" data-unit="Hộp" onclick="updatePrice('Hộp')">Hộp</button>
                  <button class="btn unit-btn" data-unit="Vỉ" onclick="updatePrice('Vỉ')">Vỉ</button>
                </div>
              </div>
              <!-- javascript cập nhật giá -->
              <script>
                function updatePrice(unit) {
                  const priceElement = document.getElementById("product-price");
                  if (unit === "Hộp") {
                    priceElement.textContent = "95.000";
                  } else if (unit === "Vỉ") {
                    priceElement.textContent = "19.000";
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
                  <button class="btnthemGioHang btnthemGioHang-white btnthemGioHang-animate" id="thuocKD">THÊM VÀO GIỎ HÀNG</button>
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
                <h3>Thuốc hoạt duyết dưỡng não bao phim Traphaco là gì? </h3>
                <!-- Mô tả -->
                <section id="description" class="mt-4">
                  <h4>Mô tả</h4>
                  <p>
                    Thuốc Hoạt Huyết Dưỡng Não bao phim Traphaco là một sản phẩm 
                    dược phẩm được sản xuất bởi công ty Traphaco, thường được sử 
                    dụng để điều trị các vấn đề liên quan đến suy giảm trí nhớ và 
                    các rối loạn liên quan đến tuần hoàn não.
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần thuốc hoạt duyết dưỡng não bao phim Traphaco</h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Cao đặc rễ Đinh lăng 5:1 (Extractum Radix Polysciasis spissum)</td>
                        <td>150mg</td>
                      </tr>
                    </tbody>
                    <tbody>
                      <tr>
                        <td>Cao khô lá Bạch quả (Extractum Folii Ginkgo siccus)</td>
                        <td>5mg</td>
                      </tr>
                    </tbody>
                  </table>
                  <p>Tá dược: Avicel, Tinh bột, Lactose, Aerosil, Talc, Magnesi Stearat, 
                    Titan dioxyd, HPMC, PEG 6000, PVP, Đường trắng, Calci Carbonat, Than hoạt, 
                    Màu Erythrosine, Nipagin, Nipasol, Carnauba wax vừa đủ 1 viên.</p>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng Bột pha uống Fortrans</h4>
                  <ul class="mt-2">
                    <li><strong>Chỉ định</strong></li>
                    <li>Suy giảm trí nhớ, căng thẳng thần kinh, kém tập trung.</li>
                    <li>Thiểu năng tuần hoàn não, hội chứng tiền đình với các biểu hiện: 
                      đau đầu, hoa mắt, chóng mặt, mất ngủ, mất thăng bằng.</li>
                    <li>Điều trị rối loạn chức năng hữu cơ của não có kèm thco sự sa sút 
                      trí tuệ như giảm trí nhớ, giảm khả năng tập trung, trầm cảm và đau đầu.</li>
                    <li>Giảm chức năng não bộ: giảm trí nhớ, suy nhược thần kinh, di chứng não.</li>
                    <li>Chứng run giật của bệnh nhân Parkinson.</li>

                    <strong>Chống chỉ định</strong>
                    <li>Người mẫn cảm với bất cứ thành phần nào của thuốc.</li>
                    <li>Không dùng cho phụ nữ có thai.</li>
                    <li>Người có rối loạn về máu, rong kinh, người đang xuất huyết.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách dùng Bột pha uống Fortrans</h4>
                  <ul class="mt-2">
                    Cách dùng: Nuốt viên thuốc với một cốc nước đầy. Không nhai hoặc nghiền viên thuốc.
                    <strong>Liều dùng:</strong>
                    <li>Người lớn: Uống 2 - 3 viên/lần x 2 - 3 lần/ngày.</li>
                    <li>Trẻ em: Uống 1 viên/lần x 2 - 3 lần/ngày.</li>
                    <br>Thời gian sử dụng: 2 - 3 tháng hoặc lâu hơn tùy theo tình trạng bệnh.
                    <br>Lưu ý: Liều dùng trên chỉ mang tính chất tham khảo. Liều dùng cụ thể 
                    tùy thuộc vào thể trạng và mức độ diễn tiến của bệnh. Để có liều dùng phù hợp, 
                    bạn cần tham khảo ý kiến bác sĩ hoặc chuyên viên y tế.
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <ul class="mt-2">
                    <li>Thông Thường: Hầu hết người dùng không gặp tác dụng phụ nghiêm trọng. 
                      Tuy nhiên, một số người có thể trải qua cảm giác khó chịu tiêu hóa nhẹ như 
                      đầy hơi hoặc buồn nôn.</li>
                    <li>Hiếm Khi: Phản ứng dị ứng như phát ban, ngứa, hoặc khó thở. Nếu gặp phải 
                      các triệu chứng này, ngừng sử dụng thuốc và tìm kiếm sự chăm sóc y tế.</li>
                  </ul>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dụng của sản phẩm.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Nơi khô ráo, nhiệt độ không quá 30°C, tránh ánh sáng</p>
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