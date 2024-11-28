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
          <div class=" row p-4 border rounded shadow bg-white">
            
            <!-- Phần hình ảnh sản phẩm -->
            <div class="product-image-section col-lg-5 col-md-6 mb-4">
              <div class="product-main-image">
                <img src="imageMedicine/24.png" alt="Img" class="img-fluid rounded">
              </div>
            </div>

            <!-- Phần thông tin sản phẩm -->
            <div class="product-info-section col-lg-7 col-md-6">
              <h1>Bột pha uống Claminat 250mg/62.5mg Imexpharm điều trị nhiễm khuẩn (hộp 12 gói)</h1>
              <ul class="product-details list-unstyled">
                <li><span class="detail-title">Quy cách:</span> 
                  <span class="detail-info">Hộp 12 gói</span></li>
                <li><span class="detail-title">Nơi sản xuất:</span> 
                  <span class="detail-info">Việt Nam </span></li>
                <li><span class="detail-title">Xuất xứ thương hiệu:</span>
                  <span class="detail-info">Imexpharm</span></li>
              </ul>
              <!-- Giá cả -->
              <div class="d-flex align-items-center gap-2">
                <!-- Giá này sẽ được cập nhật theo javascript bên dưới -->
                <span id="product-price" class="product-price">210.000</span>
                <span><span class="product-price"><u> đ</u></span>/</span>
                <div class="unit-selector">
                  <!-- active là nút sẽ hiện ban đầu khi nào, nút này khớp với giá bên trên -->
                  <button class="btn unit-btn active" data-unit="Hộp" onclick="updatePrice('Hộp')">Hộp</button>
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
                  <button class="btnThemVaoGioHang_kedon btnThemVaoGioHang_kedon-animated"  id="gdtButton">THÊM VÀO GIỎ HÀNG</button>
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
                <h3>Thuốc Claminat IMP 250/31.25 là gì?</h3>
                <!-- Mô tả -->
                <section id="description" class="mt-5">
                  <h4>Mô tả</h4>
                  <p>
                    Claminat 250mg của Công ty Cổ phần Dược phẩm Imexpharm, có thành phần chính Amoxicilin, đây là thuốc dùng để điều trị nhiễm 
                    khuẩn do các vi khuẩn nhạy cảm, bao gồm: Nhiễm khuẩn tai - mũi - họng, nhiễm khuẩn đường hô hấp dưới,
                    nhiễm khuẩn đường tiết niệu, nhiễm khuẩn xương khớp...
                  </p>
                </section>
                <!-- Thành phần -->
                <section id="composition" class="mt-4">
                  <h4>Thành phần của Thuốc Claminat IMP 250/31.25</h4>
                  <table class="table table-bordered mt-2">
                    <thead class="thead-light">
                      <tr>
                        <th>Thông tin thành phần</th>
                        <th>Hàm lượng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Amoxicillin</td>
                        <td>250mg</td>
                      </tr>
                      <tr>
                        <td>Clavulanic aci</td>
                        <td>31.25mg</td>
                      </tr>
                    </tbody>
                  </table>
                </section>
                <!-- Công dụng -->
                <section id="usage" class="mt-5">
                  <h4>Công dụng của Thuốc Claminat IMP 250/31.25</h4>
                  <ul class="mt-2">
                    <li><strong>Chỉ định</strong></li>
                    <li>Nhiễm khuẩn tai - mũi - họng: Viêm amidan, viêm xoang, viêm tai giữa;</li>
                    <li>Nhiễm khuẩn đường hô hấp dưới: Viêm phế quản cấp và mãn tính, viêm phổi phế quản;</li>
                    <li>Nhiễm khuẩn đường tiết niệu - sinh dục: Viêm bàng quang, viêm niệu đạo, viêm bể thận (nhiễm khuẩn đường sinh dục nữ);</li>
                    <li>Nhiễm khuẩn da và mô mềm: Mụn nhọt, áp xe, nhiễm khuẩn vết thương, viêm mô tế bào;</li>
                    <li>Nhiễm khuẩn xương và khớp: Viêm tủy xương;</li>
                    <li>Nhiễm khuẩn nha khoa: Áp xe ổ răng;</li>
                    <li>Nhiễm khuẩn khác: Nhiễm khuẩn do nạo thai, nhiễm khuẩn máu sản khoa, nhiễm khuẩn trong ổ bụng;</li>
                  </ul>
                </section>
                <!-- Cách dùng -->
                <section id="dosage" class="mt-5">
                  <h4>Cách dùng Thuốc Claminat IMP 250/31.25</h4>
                  <ul class="mt-2">
                    <li><strong>Liều dùng</strong></li>
                    <li>Người lớn và trẻ em trên 40kg (cho tất cả chỉ định):

                        Liều Claminat 250 thông thường: 1000mg Amoxicillin/125mg Acid clavulanic x 3 lần/ngày.
                        
                        Liều thấp hơn có thể được sử dụng (đặc biệt trong nhiễm khuẩn da mô mềm viêm xoang nhẹ): 1000mg Amoxicillin/125mg Acid clavulanic x 2 lần/ngày.</li>
                    <li>Trẻ em dưới 40kg:

                        Liều khuyến cáo: Từ 40mg Amoxicillin/5mg Acid clavulanic/kg cân nặng/ngày đến 80mg Amoxicillin/10mg Acid clavulanic/kg cân nặng/ngày (không quá 3000mg Amoxicillin/375mg Acid clavulanic/ngày) tùy thuộc vào mức độ nhiễm khuẩn, chia thành 3 lần/ngày.
                        
                        Điều trị viêm tai giữa, viêm xoang, nhiễm khuẩn đường hô hấp dưới và nhiễm khuẩn nặng, liều thông thường: 40mg Amoxicillin/kg cân nặng/ngày, chia làm nhiều lần cách nhau 08 giờ, trong 05 ngày.</li>
                    <li>Bệnh nhân cao tuổi: Không cần thiết phải điều chỉnh liều.</li>
                    <li>Đối với bệnh nhân suy thận và suy gan:

                        Người bệnh có các vấn đề về thận cần thông báo với bác sĩ để được xem xét hoặc tiếp tục dùng thuốc hoặc đổi sang một thuốc khác.
                        
                        Người bệnh có các vấn đề về gan cần thận trọng khi dùng và nên kiểm tra chức năng gan định kỳ.</li>
                  </ul>
                </section>
                <!-- Tác dụng phụ -->
                <section id="side-effects" class="mt-5">
                  <h4>Tác dụng phụ</h4>
                  <p>Khi sử dụng thuốc Claminat 250mg, bạn có thể gặp các tác dụng không mong muốn (ADR).</p>
                  <li>Thường gặp: Tiêu chảy, ngứa, buồn nôn, nôn.
                </li>
                  <li>Ít gặp: Tăng bạch cầu ái toan, phát ban, viêm gan và vàng da ứ mật, tăng Transaminase.
                </li>
                  <li>Hiếm gặp: Phản ứng phản vệ, giảm bạch cầu, thiếu máu tan huyết, viêm đại tràng giả mạc, hội chứng Stevens-Johnson, viêm thận kẽ.
                </li>
                </section>
                <!-- Lưu ý -->
                <section id="warnings" class="mt-5">
                  <h4>Lưu ý</h4>
                  <p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.</p>
                </section>
                <!-- Bảo quản -->
                <section id="storage" class="mt-5">
                  <h4>Cách bảo quản</h4>
                  <p>Bạn nên bảo quản ở nhiệt độ phòng, tránh ẩm và tránh ánh sáng. Không bảo quản trong phòng tắm hoặc trong ngăn đá. Bạn nên nhớ rằng mỗi loại thuốc có thể có các phương pháp bảo quản khác nhau. Vì vậy, bạn nên đọc kỹ hướng dẫn bảo quản Claminat 250 trên bao bì hoặc hỏi dược sĩ.

                    <br>Giữ thuốc tránh xa tầm tay trẻ em và thú nuôi.
                    
                    <br>Hạn sử dụng: 24 tháng kể từ ngày sản xuất.
                    
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