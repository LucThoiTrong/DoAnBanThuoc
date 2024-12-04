package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.SanPham;
import Model.DatabaseModels.IChiTietDatHang;
import Model.DatabaseModels.IChiTietSanPham;
import Model.DatabaseModels.IDatHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.*;
import java.io.IOException;

@WebServlet("/servletDatHangKH")
public class ServletDatHangKH extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("addSanPham")){
            AddSanPhamTrongGioHang(req, resp);
        }
        else if(action.equals("updateSanPham")){
            UpdateSanPhamTrongGioHang(req, resp);
        }
        else if(action.equals("removeSanPham")){
            RemoveSanPhamTrongGioHang(req, resp);
        }
    }

    private void RemoveSanPhamTrongGioHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giỏ hàng từ CSDL của khách hàng
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");

        // Lấy lần đặt hàng cuối cùng của khách hàng
        DatHang dh = kh.getLastOrder();

        // Lấy id chi tiết đặt hàng
        int idDonViTinh = Integer.parseInt(req.getParameter("id"));

        // Lấy đối tượng chi tiết đặt hàng thông qua id
        ChiTietDatHang ctdh = new IChiTietDatHang().SelectById(idDonViTinh);

        // Thực hiện xóa chi tiết đặt hàng ra khỏi giỏ
        dh.removeSanPham(ctdh);

        // Cập nhật lại số lượng từng chi tiết sản phẩm
        ChiTietSanPham ctsp = ctdh.getSanPham();
        ctsp.setSoLuongSanPhamTrongKho(ctsp.getSoLuongSanPhamTrongKho() + ctdh.getSoLuongMua());

        new IChiTietSanPham().update(ctsp);

        // Thực hiện xóa chi tiết đặt hàng dưới CSDL
        new IChiTietDatHang().delete(ctdh);

        // Sau khi hoàn tất thì điều hướng lại qua servlet giỏ hàng
        getServletContext().getRequestDispatcher("/servletGioHang").forward(req, resp);
    }

    private void UpdateSanPhamTrongGioHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giỏ hàng từ CSDL của khách hàng
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("KhachHang");

        // Lấy lần đặt hàng cuối cùng của khách hàng
        DatHang dh = kh.getLastOrder();

        // Kiểm tra nếu lần đặt hàng cuối cùng không tồn tại hoặc đã kết thúc
        if (dh == null || dh.getTrangThaiDatHang() == TrangThaiDatHang.DA_GIAO) {
            dh = new DatHang();
            dh.setKhachHang(kh);
            new IDatHang().insert(dh);
        }

        // Lấy id sản phẩm và id đơn vị tính từ request
        int idDonViTinh = Integer.parseInt(req.getParameter("idDonViTinh"));
        int idSanPham = Integer.parseInt(req.getParameter("idSanPham"));

        // Lấy chi tiết sản phẩm từ id sản phẩm và id đơn vị tính
        ChiTietSanPham ctsp = new IChiTietSanPham().SelectBySanPhamDonViTinh(idSanPham, idDonViTinh);

        // Kiểm tra nếu sản phẩm tồn tại trong giỏ hàng
        boolean kq = dh.kiemTraSanPhamTrongGio(ctsp);

        // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
        if (kq) {
            int soLuongMoi = Integer.parseInt(req.getParameter("soLuong"));
            dh.updateSanPham(ctsp, soLuongMoi);
            // Cập nhật lại sản phẩm trong CSDL
            new IDatHang().update(dh);
        }

        // Lưu giỏ hàng cập nhật vào session
        session.setAttribute("Cart", dh);

        // Chuyển hướng hoặc trả về phản hồi phù hợp
        resp.sendRedirect("gioHang.jsp");
    }

    private void AddSanPhamTrongGioHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giỏ hàng từ CSDL của khách hàng
        HttpSession session = req.getSession();
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");

        // Lấy lần đặt hàng cuối cùng của khách hàng
        DatHang dh = kh.getLastOrder();

        // Kiểm tra nếu lần đặt hàng cuối cùng không tồn tại hoặc đã kết thúc
        if (dh == null || dh.getTrangThaiDatHang() == TrangThaiDatHang.DA_GIAO) {
            dh = new DatHang(kh);
            kh.addDatHang(dh);
            new IDatHang().insert(dh);
        }
        // Lấy chi tiết sản phẩm từ id sản phẩm và id đơn vị tính
        int idDonViTinh = Integer.parseInt(req.getParameter("unit"));
        int idSanPham = Integer.parseInt(req.getParameter("productId"));
        int soLuongMua = Integer.parseInt(req.getParameter("quantity"));

        ChiTietSanPham ctsp = new IChiTietSanPham().SelectBySanPhamDonViTinh(idSanPham, idDonViTinh);

        // Kiểm tra ctsp đã có trong chi tiết đặt hàng hay chưa
        boolean kq = dh.kiemTraSanPhamTrongGio(ctsp);

        // Nếu chưa có, thêm vào giỏ hàng
        if(kq == false){
            ChiTietDatHang ctdh = new ChiTietDatHang(ctsp, soLuongMua);
            ctdh.setTongGiaTien(ctdh.tongGiaTien(ctdh.getSoLuongMua(), ctdh.getSanPham()));
            dh.addSanPham(ctdh);
            ctdh.setDatHang(dh);

            // Giảm số lượng trong kho của sản phẩm
            int SoLuongTrongKho = ctsp.getSoLuongSanPhamTrongKho() - soLuongMua;
            ctsp.setSoLuongSanPhamTrongKho(SoLuongTrongKho);
            // Cập nhật lại sản phẩm lưu trên CSDL
            new IChiTietSanPham().update(ctsp);
            new IDatHang().update(dh);
        }
        else {
            // Tìm chi tiết đặt hàng
            ChiTietDatHang ctdh = dh.findChiTietDatHang(ctsp);
            // Set lại giá tiền của sản phẩm đó sau khi cập nhật số lượng mua
            ctdh.setTongGiaTien(ctdh.tongGiaTien(soLuongMua + ctdh.getSoLuongMua(), ctdh.getSanPham()));
            dh.updateSanPham(ctsp, soLuongMua);

            // Giảm số lượng sản phẩm trong kho
            int SoLuongTrongKho = ctsp.getSoLuongSanPhamTrongKho() - soLuongMua;
            ctsp.setSoLuongSanPhamTrongKho(SoLuongTrongKho);
            new IChiTietSanPham().update(ctsp);
            // Cập nhật lại sản phẩm trong csdl
            new IDatHang().update(dh);
        }
        getServletContext().getRequestDispatcher("/servletGioHang").forward(req, resp);
    }
}
