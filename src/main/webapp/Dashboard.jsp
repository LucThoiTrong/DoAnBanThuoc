<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <h1>Dashboard</h1>
  <div class="ngay">
    <input type="date">
  </div>
  <!-- 3 cái khung ở trên  -->
  <div class="insights">
    <!-- Khung 1 -->
    <div class="sales">
      <span class="material-icons-sharp">analytics</span>
      <div class="middle">
        <div class="left">
          <h3>Danh mục</h3>
          <div data-purecounter-start="0" data-purecounter-end="2" data-purecounter-duration="2" class="purecounter"></div>
        </div>
        <div class="progress">
          <svg>
            <circle cx='38' cy='38' r='36'></circle>
          </svg>
          <div class="number">
            <p>81%</p>
          </div>
        </div>
      </div>
      <small class="text-muted">Last 24 Hours</small>
    </div>
    <!-- END OF SALES -->
    <!-- Khung 2 -->
    <div class="expenses">
      <span class="material-icons-sharp">bar_chart</span>
      <div class="middle">
        <div class="left">
          <h3>Loại thuốc</h3>
          <div data-purecounter-start="0" data-purecounter-end="10" data-purecounter-duration="2" class="purecounter"></div>
        </div>
        <div class="progress">
          <svg>
            <circle cx='38' cy='38' r='36'></circle>
          </svg>
          <div class="number">
            <p>62%</p>
          </div>
        </div>
      </div>
      <small class="text-muted">Last 24 Hours</small>
    </div>
    <!-- END OF EXPENSE -->
    <!-- Khung 3 -->
    <div class="income">
      <span class="material-icons-sharp">stacked_line_chart</span>
      <div class="middle">
        <div class="left">
          <h3>Sản phẩm</h3>
          <div data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="2" class="purecounter"></div>
        </div>
        <div class="progress">
          <svg>
            <circle cx='38' cy='38' r='36'></circle>
          </svg>
          <div class="number">
            <p>44%</p>
          </div>
        </div>
      </div>
      <small class="text-muted">Last 24 Hours</small>
    </div>
    <!-- END OF INCOME -->
  </div>
  <!-- END OF INSIGHTS -->
  <!-- Đơn hàng -->
  <div class="recent-orders">
    <h2>Recent Orders</h2>
    <table id="order-table">
      <thead>
      <tr>
        <th>Tên Khách Hàng</th>
        <th>Mã Đơn Hàng</th>
        <th>Thanh Toán</th>
        <th>Tình Trạng</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <!-- <tr>
          <td>Nguyên Văn A</td>
          <td>DH01</td>
          <td>Đã thanh toán</td>
          <td class="warning">Đã giao hàng</td>
          <td class="primary">Chi tiết</td>
      </tr> -->
      </tbody>
    </table>
  </div>
