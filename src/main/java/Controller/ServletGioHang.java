package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletGioHang")
public class ServletGioHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giỏ hàng từ CSDL của khách hàng
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");

        // Lấy lần đặt hàng cuối cùng của khách hàng
        DatHang dh = kh.getLastOrder();

        Set<ChiTietDatHang> danhSachOrder = dh.getDanhSachSanPham();
        req.setAttribute("danhSachOrder", danhSachOrder);

        // Tính tổng số tiền
        double tongSoTien = dh.tinhTongGiaTien();
        req.setAttribute("tongSoTien", tongSoTien);

        getServletContext().getRequestDispatcher("/Cart.jsp").forward(req, resp);
    }
}
