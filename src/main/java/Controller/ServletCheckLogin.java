package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/servletCheckLogin")
public class ServletCheckLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");

        // Nếu khách hàng đã đăng nhập, trả về "true", ngược lại "false"
        if (khachHang != null) {
            resp.getWriter().write("true");
        } else {
            resp.getWriter().write("false");
        }
    }
}
