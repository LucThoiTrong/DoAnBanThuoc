package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.DatabaseModels.IChiTietDatHang;
import Model.DatabaseModels.IChiTietSanPham;
import Model.DatabaseModels.IDatHang;
import Model.DatabaseModels.IKhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletThongTinCaNhan")
public class ServletThongTinCaNhan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LayToanBoDanhSachCTDatHangTheoID(req,resp);
        CapNhatKhachHang(req,resp);
        getServletContext().getRequestDispatcher("/ThongTinCaNhan.jsp").forward(req, resp);
    }

    protected void CapNhatKhachHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String ten = req.getParameter("ten");
        String email = req.getParameter("email");
        String soDienThoai = req.getParameter("soDienThoai");
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        kh.setTen(ten);
        kh.setEmail(email);
        kh.setSoDienThoai(soDienThoai);
        new IKhachHang().update(kh);
    }
    protected void LayToanBoDanhSachCTDatHangTheoID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        Set<DatHang> dh = kh.getLichSuDatHang();
        req.setAttribute("dh", dh);
    }

}