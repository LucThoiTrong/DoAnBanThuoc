package Controller;

import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.DatabaseModels.ILoaiThuoc;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletLoaiThuoc")
public class ServletLoaiThuoc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // kiểm tra xem đang là thêm loại thuốc hay lấy toàn bộ loai thuốc lên

        // Nếu không phải => lấy toàn bộ dữ liệu loại thuốc lên
        Set<LoaiThuoc> dsLoaiThuoc = new ILoaiThuoc().SelectAll();
        req.setAttribute("danhSachLoaiThuoc", dsLoaiThuoc);

        getServletContext().getRequestDispatcher("/admin.jsp?page=DSthuoc").forward(req, resp);
    }
}
