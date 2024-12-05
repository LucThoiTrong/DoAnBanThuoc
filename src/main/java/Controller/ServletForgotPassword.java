package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.TKDoiTuongSuDung.TKKhachHang;
import Model.DatabaseModels.IKhachHang;
import Model.DatabaseModels.ITKKhachHang;
import Util.MaHoaMatKhau;
import Util.MailUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@WebServlet("/servletForgotPassword")
public class ServletForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String username = req.getParameter("username");
        TKKhachHang tkKhachHang = new ITKKhachHang().selectTKKhachHangByUsername(username);
        if (action.equals("forgotPassword")) {
            // get parameters from the request
            String email = req.getParameter("email");

            // store data in TKKhachHang object
            if (tkKhachHang != null) {
                if (tkKhachHang.getUsername().equals(username)) {
                    // Nội dung email
                    String from = "bigbossteam12c2@gmail.com";
                    String subject = "Đặt lại mật khẩu của bạn";

                    // Tạo nội dung email bằng HTML
                    StringBuilder body = new StringBuilder();
                    body.append("<!DOCTYPE html>")
                            .append("<html>")
                            .append("<head>")
                            .append("<style>")
                            .append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; margin: 0; padding: 20px; }")
                            .append(".email-container { max-width: 600px; margin: 0 auto; padding: 20px; background-color: #ffffff; border: 1px solid #ddd; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }")
                            .append(".header { background-color: #4CAF50; color: white; text-align: center; padding: 15px; border-radius: 5px 5px 0 0; }")
                            .append(".content { padding: 20px; }")
                            .append(".button { display: inline-block; background-color: #4CAF50; color: white !important; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-top: 10px; }")
                            .append(".footer { text-align: center; margin-top: 20px; font-size: 0.9em; color: #777; }")
                            .append("</style>")
                            .append("</head>")
                            .append("<body>")
                            .append("<div class='email-container'>")
                            .append("<div class='header'>")
                            .append("<h1>Reset Your Password</h1>")
                            .append("</div>")
                            .append("<div class='content'>")
                            .append("<p>Hi,</p>")
                            .append("<p>We received a request to reset your password. If you didn't request this, please ignore this email.</p>")
                            .append("<p>To reset your password, click the button below:</p>")
                            .append("<a href='http://localhost:8080/DoAnBanThuoc/nhapmkmoi.jsp?username=")
                            .append(username)
                            .append("' class='button'>RESET PASSWORD</a>")
                            .append("<p>This link will expire in 24 hours for security reasons.</p>")
                            .append("</div>")
                            .append("<div class='footer'>")
                            .append("<p>If you have any questions, please contact us at bigbossteam12c2@gmail.com.</p>")
                            .append("<p>&copy; 2024 Your Company. All rights reserved.</p>")
                            .append("</div>")
                            .append("</div>")
                            .append("</body>")
                            .append("</html>");

                    boolean isBodyHTML = true;
                    try {
                        // Gửi email
                        MailUtil.sendMail(email, from, subject, body.toString(), isBodyHTML);

                        // Gửi thông báo thành công
                        req.setAttribute("successMessage", "Liên kết đặt lại mật khẩu đã được gửi đến email của bạn.");
                    } catch (MessagingException e) {
                        // Gửi thông báo lỗi
                        req.setAttribute("errorMessage", "Gửi email thất bại. Vui lòng thử lại sau.");
                        this.log("Email gửi thất bại: " + e.getMessage());
                    }

                    // Điều hướng về trang thông báo
                    getServletContext().getRequestDispatcher("/NhapEmailThanhCong.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("Thatbai", "Username chưa tồn tại");
                getServletContext().getRequestDispatcher("/forgot_password.jsp").forward(req, resp);
            }
        }
        else{
            String newPassword = req.getParameter("new-password");
            // store data in TKKhachHang object
            String enPassword = new MaHoaMatKhau().toSHA1(newPassword);
            boolean tkKhachHangUpdate = new ITKKhachHang().updateTKKhachHang(username,enPassword);
            if (tkKhachHangUpdate) {
                req.setAttribute("message", "Cập nhật mật khẩu thành công!");
                getServletContext().getRequestDispatcher("/signin.html").forward(req, resp);
            } else {
                req.setAttribute("error", "Cập nhật mật khẩu thất bại. Vui lòng thử lại.");
                getServletContext().getRequestDispatcher("/nhapmkmoi.jsp").forward(req, resp);
            }
        }
    }
}
