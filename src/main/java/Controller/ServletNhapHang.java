package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhapHang;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.DatabaseModels.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet("/servletNhapHang")
public class ServletNhapHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    private void AddSanPhamVoDonHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    private void RemoveSanPhamTrongDonHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    private void UpdateSanPhamTrongDonHang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
