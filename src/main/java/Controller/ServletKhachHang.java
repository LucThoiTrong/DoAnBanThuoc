package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.DatabaseModels.IKhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletKhachHang")
public class ServletKhachHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<KhachHang> dsKhachHang = new IKhachHang().SelectAll();
        req.setAttribute("dsKhachHang", dsKhachHang);
        getServletContext().getRequestDispatcher("/admin.jsp?page=DSkhachhang").forward(req, resp);
    }
}
