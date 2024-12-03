package Controller;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.BusinessModels.SanPham.SanPham;
import Model.DatabaseModels.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/servletSanPham")
public class ServletSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Set<SanPham> dssp;
        if(action.equals("LaySanPhamTheoIDLoaiThuoc")){
            int idLoaiThuoc = Integer.parseInt(req.getParameter("idLoaiThuoc"));
            dssp = new ISanPham().SelectByID(idLoaiThuoc);
            req.setAttribute("dssp", dssp);
            getServletContext().getRequestDispatcher("/SanPhamThuocAdmin.jsp").forward(req, resp);
        }
        else if(action.equals("XemSanPham")){

            // Lấy các dữ liệu từ các biến trong bộ lọc
            String danhMucID = req.getParameter("danhMucID");
            String loaiThuocID = req.getParameter("loaiThuocID");
            String priceRange = req.getParameter("priceRange");
            String doTuoiID = req.getParameter("doTuoiID");
            String noiSanXuat = req.getParameter("noiSanXuat");
            String thuongHieu = req.getParameter("thuongHieu");

            // Lấy thông tin danh mục, loại thuốc, độ tuổi, NSX, thương hiệu sử dụng cho bộ lọc
            req.setAttribute("DanhMucThuoc", new IDanhMucThuoc().SelectAll());
            if(danhMucID!=null && !danhMucID.isEmpty()){
                Set<LoaiThuoc> loaiThuocList = new ILoaiThuoc().SelectByID(Integer.parseInt(danhMucID));
                req.setAttribute("LoaiThuoc", loaiThuocList);

                // Kiểm tra nếu loaiThuocID không nằm trong danh sách loại thuốc của danh mục
                if(loaiThuocID!=null && !loaiThuocID.isEmpty()){
                    String finalLoaiThuocID = loaiThuocID;
                    boolean isLoaiThuocValid = loaiThuocList.stream()
                            .anyMatch(loaiThuoc -> loaiThuoc.getId() == Integer.parseInt(finalLoaiThuocID));

                    if (!isLoaiThuocValid) {
                        loaiThuocID = null; // Đặt về trạng thái "chưa chọn"
                    }
                }
            }
            else{
                req.setAttribute("LoaiThuoc", new ILoaiThuoc().SelectAll());
            }

            req.setAttribute("DoTuoiSuDung", new IDoTuoiSuDung().SelectAll());
            req.setAttribute("NoiSanXuat", new ISanPham().dsNoiSanXuat());
            req.setAttribute("ThuongHieu", new ISanPham().dsThuongHieu());

            // Bắt đầu lọc theo yêu cầu
            dssp = new ISanPham().filterSanPham(danhMucID, loaiThuocID, priceRange, doTuoiID, noiSanXuat, thuongHieu);
            req.setAttribute("productList", dssp);

            //Chuyển đến trang SanPhamThuoc.jsp
            getServletContext().getRequestDispatcher("/SanPhamThuoc.jsp").forward(req, resp);
        }
        else if(action.equals("LayAllSanPham")){
            dssp = new ISanPham().SelectAll();
            req.setAttribute("DanhMucThuoc", new IDanhMucThuoc().SelectAll());
            req.setAttribute("LoaiThuoc", new ILoaiThuoc().SelectAll());
            req.setAttribute("DoTuoiSuDung", new IDoTuoiSuDung().SelectAll());
            req.setAttribute("NoiSanXuat", new ISanPham().dsNoiSanXuat());
            req.setAttribute("ThuongHieu", new ISanPham().dsThuongHieu());

            req.setAttribute("productList", dssp);
            getServletContext().getRequestDispatcher("/SanPhamThuoc.jsp").forward(req, resp);
        }
    }
}
