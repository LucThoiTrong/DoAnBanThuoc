package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/servletLogout")
public class ServletLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hủy session hiện tại
        if (request.getSession(false) != null) {
            request.getSession().invalidate();
        }
        // Chuyển hướng về trang đăng nhập hoặc trang chủ
        response.sendRedirect("signin.html");
    }
}