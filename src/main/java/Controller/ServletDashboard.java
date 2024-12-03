package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.BusinessModels.SanPham.SanPham;
import Model.DatabaseModels.IChiTietDatHang;
import Model.DatabaseModels.IDatHang;
import Model.DatabaseModels.ISanPham;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletDashboard")
public class ServletDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            if (action.equals("LayDatHangTheoIDDatHang")) {
                LayToanBoDanhSachCTDatHangTheoID(req, resp);
            } else if(action.equals("CapNhatDonHang")){
                // Lấy id đặt hàng
                int idDatHang = Integer.parseInt(req.getParameter("idDatHang"));
                DatHang dh = new IDatHang().SelectById(idDatHang);
                dh.setTrangThaiDatHang(TrangThaiDatHang.DA_GIAO);
                new IDatHang().update(dh);
                LayToanBoDanhSachDatHang(req, resp);
            } else {
                // Nếu action không khớp với bất kỳ giá trị nào, gọi lại hàm này
                LayToanBoDanhSachDatHang(req, resp);
            }
        } else {
            // Nếu action là null, gọi lại hàm mặc định
            LayToanBoDanhSachDatHang(req, resp);
        }
    }
    protected void LayToanBoDanhSachCTDatHangTheoID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Set<ChiTietDatHang> dsCTDatHang = null;
        int idDatHang = Integer.parseInt(req.getParameter("idDatHang"));
        DatHang dh = new IDatHang().SelectById(idDatHang);
        KhachHang kh = dh.getKhachHang();
        dsCTDatHang = new IChiTietDatHang().SelectByID(idDatHang);
        req.setAttribute("dsCTDatHang", dsCTDatHang);
        req.setAttribute("khachHang", kh);
        req.setAttribute("dh", dh);
        getServletContext().getRequestDispatcher("/ChiTietDonHang.jsp").forward(req, resp);
    }
    protected void LayToanBoDanhSachDatHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Set<DatHang> dsDatHang = new IDatHang().SelectAll();
        req.setAttribute("danhSachDatHang", dsDatHang);
        getServletContext().getRequestDispatcher("/admin.jsp?page=Dashboard").forward(req, resp);
    }
}