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
                <img src="imageMedicine/5.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Viên bao tan ở ruột BROMANASE 50 UI điều trị viêm sưng, chống phù nề (10 vỉ x 10 viên)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">10 vỉ x 10 viên</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Davipharm</span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">Việt Nam</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">390.000</span>
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
                    priceElement.textContent = "390.000";
                  } else if (unit === "Vỉ") {
                    priceElement.textContent = "39.000";
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
                <h3>Viên bao tan ở ruột BROMANASE 50 UI là gì?</h3>
                <!-- Mô tả -->
                <section id="description" class="mt-5">
                  <h4>Mô tả</h4>
                  <p>
                    Viên bao tan ở ruột BROMANASE 50 UI có thành phần chính là Bromelain, được sử 
                    dụng phổ biến để điều trị các tình trạng viêm sưng, giảm phù nề, đặc biệt sau 
                    khi phẫu thuật hoặc chấn thương, và điều trị các bệnh liên quan đến đường hô hấp.
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần viên bao tan ở ruột BROMANASE 50 UI</h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Bromelain</td>
                        <td>50 F.I.P units</td>
                      </tr>
                    </tbody>
                  </table>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng viên bao tan ở ruột BROMANASE 50 UI</h4>
                  <ul class="mt-2">
                    <strong>Chỉ định</strong>
                    <li>Thuốc Bromanase được chỉ định dùng để điều trị các trường hợp viêm sưng, 
                      phù nề sau phẫu thuật và chấn thương, đặc biệt là ở mũi và xoang.</li>

                    <strong>Chống chỉ định</strong>
                    <li>Bệnh nhân mẫn cảm với bromelain hoặc với bất kỳ thành phần nào của thuốc.</li>
                    <li>Người bị rối loạn chức năng đông máu, người có nguy cơ chảy máu cao không 
                      nên dùng (chảy máu cam, sốt xuất huyết, phụ nữ băng huyết).</li>
                    <li>Sử dụng đồng thời với thuốc chống đông máu hoặc thuốc chống kết tập tiểu cầu.</li>
                    <li>Người suy gan, suy thận.</li>
                    <li>Phụ nữ có thai và cho con bú.</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách dùng viên bao tan ở ruột BROMANASE 50 UI</h4>
                  <ul class="mt-2">
                    <strong>Liều dùng:</strong>
                    <br><i>Người lớn và trẻ em trên 12 tuổi</i>
                    <li>Uống 4 viên/lần, ngày 2 - 3 lần. Không dùng quá 12 viên/ngày.</li>
                    <li>Thời gian điều trị phụ thuộc vào tốc độ giảm phù nề, thông thường 
                      trong 8 - 10 ngày hoặc dùng theo chỉ dẫn của bác sĩ.</li>

                    <i>Trẻ em dưới 12 tuổi</i>  
                    <li>Không khuyến cáo sử dụng cho trẻ em dưới 12 tuổi.</li>
                  </ul>
                  Lưu ý: Liều dùng trên chỉ mang tính chất tham khảo. Liều dùng cụ thể tùy thuộc 
                    vào thể trạng và mức độ diễn tiến của bệnh. Để có liều dùng phù hợp, bạn cần tham 
                    khảo ý kiến bác sĩ hoặc chuyên viên y tế.
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <ul class="mt-2">
                    <li>Thận trọng khi sử dụng thuốc chống đông máu hoặc thuốc làm loãng máu như 
                      aspirin hay Coumadin. Những thảo dược bổ sung ảnh hưởng đến máu như ginkgo 
                      biloba cũng phải được sử dụng một cách thận trọng. Những người có tiền sử bệnh 
                      rối loạn chảy máu, loát dạ dày, viêm tá tràng, huyết áp cao hoặc có tiền sử bệnh 
                      gan cần tham khảo ý kiến của bác sĩ trước khi sử dụng.</li>

                    <li>Một số nghiên cứu cho thấy, Bromelain có thể nâng cao tác dụng của thuốc an 
                      thần, thuốc giãn cơ như Valium và Xanax, thuốc chống co giật như Dilantin, thuốc 
                      ngủ như Ambien, thuốc chống trầm cảm nhất định và rượu, giúp tăng hấp thụ của 
                      các amoxicillin, vì vậy cần tránh khi sử dụng cùng thuốc kháng sinh.</li>
                  </ul>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Trước khi sử dụng thuốc bạn cần đọc kỹ hướng dẫn sử dụng và tham khảo thông tin 
                    bên dưới.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Nơi khô ráo, nhiệt độ không quá 30°C, tránh ánh sáng.</p>
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