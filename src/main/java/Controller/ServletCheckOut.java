package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.Enum.PhuongThucThanhToan;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.DatabaseModels.IDatHang;
import Util.MailUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/servletCheckOut")
public class ServletCheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        DatHang dh = (DatHang) session.getAttribute("dh");
        // Kiểm tra xem đơn hàng đó có sản phẩm thuốc thuộc danh mục thuốc cần kê đơn không
        String linkAnh = req.getParameter("Prescription");
        if(linkAnh!=null){
            dh.setTrangThaiDatHang(TrangThaiDatHang.CHO_XU_LY);
        }
        else {
            dh.setTrangThaiDatHang(TrangThaiDatHang.DA_GIAO);
        }

        // set ngày đặt hàng hiện tại
        dh.setNgayDatHang(new java.sql.Date(System.currentTimeMillis()));

        // set địa chỉ
        String address = req.getParameter("address");
        String dictrict = req.getParameter("district");
        String city = req.getParameter("city");

        String result_DiaChi = address + dictrict + city;
        // set phương thức thanh toán
        String paymentMethod = req.getParameter("paymentMethod");

        dh.setDiaChi(result_DiaChi);
        if(paymentMethod.equals("Momo")){
            dh.setPhuongThucThanhToan(PhuongThucThanhToan.MOMO);
        }
        else if(paymentMethod.equals("Tiền mặt")){
            dh.setPhuongThucThanhToan(PhuongThucThanhToan.CASH);
        }

        new IDatHang().update(dh);

        // Gửi mail đơn hàng
        // Nội dung email
        String from = "bigbossteam12c2@gmail.com";
        String subject = "Đơn hàng của bạn";

        // Tạo nội dung email bằng HTML
        StringBuilder body = new StringBuilder();
        body.append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<meta charset=\"UTF-8\">") // Đảm bảo mã hóa UTF-8
                .append("<style>")
                .append("body { font-family: 'Arial', 'Tahoma', 'Verdana', sans-serif; line-height: 1.6; color: #333; }") // Chọn font hỗ trợ tiếng Việt
                .append(".email-container { width: 100%; max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; background-color: #f9f9f9; }")
                .append(".header { background-color: #4CAF50; color: white; text-align: center; padding: 10px 0; }")
                .append(".footer { text-align: center; margin-top: 20px; font-size: 0.9em; color: #777; }")
                .append(".table { width: 100%; border-collapse: collapse; margin-top: 20px; }")
                .append(".table th, .table td { border: 1px solid #ddd; padding: 8px; text-align: left; }")
                .append(".table th { background-color: #4CAF50; color: white; }")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class='email-container'>")
                .append("<div class='header'>")
                .append("<h1>Thank You for Shopping with us!</h1>")
                .append("</div>")
                .append("<p>Dear Customer,</p>")
                .append("<p>Thank you for your order. Here is the summary of your purchase:</p>")
                .append("<table class='table'>")
                .append("<tr>")
                .append("<th>Tên sản phẩm</th>")
                .append("<th>Đơn vị tính</th>")
                .append("<th>Số lượng mua</th>")
                .append("<th>Tổng số tiền</th>")
                .append("</tr>");

        for (ChiTietDatHang item : dh.getDanhSachSanPham()) {
            body.append("<tr>")
                    .append("<td>").append(item.getSanPham().getSanPham().getTenSanPham()).append("</td>")
                    .append("<td>").append(item.getSanPham().getDonViTinh().getTenDonViTinh()).append("</td>")
                    .append("<td>").append(item.getSoLuongMua()).append("</td>")
                    .append("<td>").append(item.getTongGiaTien()).append("</td>")
                    .append("</tr>");
        }

        body.append("</table>")
                .append("<p>We hope to serve you again soon!</p>")
                .append("<p>Best regards,<br>Murach Shop Team</p>")
                .append("<div class='footer'>")
                .append("<p>&copy; 2024 Murach Shop. All rights reserved.</p>")
                .append("</div>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        boolean isBodyHTML = true;

        try {
            MailUtil.sendMail(kh.getEmail(), from, subject, body.toString(), isBodyHTML);
            req.setAttribute("message", "Checkout successful! A confirmation email has been sent.");
        } catch (MessagingException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Unable to send confirmation email.");
        }
        getServletContext().getRequestDispatcher("/thankyou.html").forward(req, resp);
    }
}
