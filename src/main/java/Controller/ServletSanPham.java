package Controller;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.SanPham;
import Model.DatabaseModels.IChiTietSanPham;
import Model.DatabaseModels.ISanPham;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/servletSanPham")
public class ServletSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy toàn bộ sản phẩm từ CSDL
        Set<SanPham> dssp = new ISanPham().SelectAll();
        req.setAttribute("dssp", dssp);

        // Chuyển Set thành List
        List<SanPham> productList = new ArrayList<>(dssp);

        // Đặt thuộc tính để gửi dữ liệu sang JSP
        req.setAttribute("productList", productList);

        req.getServletContext().getRequestDispatcher("/SanPhamThuoc.jsp").forward(req, resp);
    }
}
