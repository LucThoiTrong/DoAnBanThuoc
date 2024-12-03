package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.DatabaseModels.IDatHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/servletDoanhThu")
public class ServletDoanhThu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Gọi phương thức doPost khi nhận yêu cầu GET
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tất cả đơn hàng và tính doanh thu theo tháng
        LayToanBoDanhSachDatHang(req, resp);
        // Chuyển tiếp đến trang DSDoanhThu để hiển thị kết quả
        getServletContext().getRequestDispatcher("/admin.jsp?page=DSDoanhThu").forward(req, resp);
    }

    // Phương thức lấy tất cả đơn hàng và tính doanh thu cho từng tháng
    protected void LayToanBoDanhSachDatHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<DatHang> dsDatHang = new IDatHang().SelectAll();

        // Khởi tạo map cho doanh thu theo tháng
        Map<Integer, Double> monthMap = createMonthDictionary();

        // Duyệt qua các đơn hàng để tính doanh thu cho từng tháng
        for (DatHang datHang : dsDatHang) {
            int month = datHang.getThangFromNgayDatHang();
            monthMap.put(month, monthMap.get(month) + datHang.tinhTongGiaTien());
        }
        Double[] monthArray = monthMap.values().toArray(new Double[0]);
        // Gửi map doanh thu theo tháng đến JSP
        req.setAttribute("monthArray", monthArray);
    }

    // Phương thức tạo map cho các tháng với giá trị mặc định là 0
    public Map<Integer, Double> createMonthDictionary() {
        Map<Integer, Double> monthMap = new HashMap<>();
        for (int i = 1; i <= 12; i++) {
            monthMap.put(i, 0.0);
        }
        return monthMap;
    }
}