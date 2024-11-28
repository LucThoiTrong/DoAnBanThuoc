package Controller;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.SanPham;
import Model.DatabaseModels.IChiTietSanPham;
import Model.DatabaseModels.ILoaiThuoc;
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
        String action = req.getParameter("action");
        Set<SanPham> dssp = null;
        if(action.equals("LaySanPhamTheoIDLoaiThuoc")){
            int idLoaiThuoc = Integer.parseInt(req.getParameter("idLoaiThuoc"));
            dssp = new ISanPham().SelectByID(idLoaiThuoc);
            req.setAttribute("dssp", dssp);
            getServletContext().getRequestDispatcher("/SanPhamThuocAdmin.jsp").forward(req, resp);
        }
        else {
            // Lấy toàn bộ sản phẩm từ CSDL
            dssp = new ISanPham().SelectAll();
            req.setAttribute("dssp", dssp);

            // Đặt thuộc tính để gửi dữ liệu sang JSP
            req.setAttribute("productList", dssp);

            getServletContext().getRequestDispatcher("/SanPhamThuoc.jsp").forward(req, resp);
        }
    }
}
