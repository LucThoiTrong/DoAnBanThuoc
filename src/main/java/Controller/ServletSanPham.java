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
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

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
            req.setAttribute("idLoaiThuoc", idLoaiThuoc);
            getServletContext().getRequestDispatcher("/SanPhamThuocAdmin.jsp").forward(req, resp);
        }
        else if(action.equals("LayAllSanPham")){
            // Lấy các dữ liệu từ các select trong bộ lọc
            String danhMucID = req.getParameter("danhMucID");
            String loaiThuocID = req.getParameter("loaiThuocID");
            String priceRange = req.getParameter("priceRange");
            String doTuoiID = req.getParameter("doTuoiID");
            String noiSanXuat = req.getParameter("noiSanXuat");
            String thuongHieu = req.getParameter("thuongHieu");
            String sort = req.getParameter("sort");
            if (sort == null || sort.equals("")) {
                sort = "price-asc";  // Giá trị mặc định là "Giá tăng dần"
            }

            // Lưu các tham số vào session để duy trì qua các yêu cầu sau
            HttpSession session = req.getSession();
            session.setAttribute("sort", sort);
            session.setAttribute("danhMucID", danhMucID);
            session.setAttribute("loaiThuocID", loaiThuocID);
            session.setAttribute("priceRange", priceRange);
            session.setAttribute("doTuoiID", doTuoiID);
            session.setAttribute("noiSanXuat", noiSanXuat);
            session.setAttribute("thuongHieu", thuongHieu);

            // Lấy set thông tin loại thuốc
            req.setAttribute("DanhMucThuoc", new IDanhMucThuoc().SelectAll());
            // Nếu chưa chọn danh mục thì lấy all loại thuốc và ngược lại
            if(danhMucID!=null && !danhMucID.isEmpty()){
                Set<LoaiThuoc> loaiThuocList = new ILoaiThuoc().SelectByID(Integer.parseInt(danhMucID));
                req.setAttribute("LoaiThuoc", loaiThuocList);

                // TH đặc biệt khi chọn loại thuốc trước khi chọn danh mục mà ko chứa nó --> null (sai logic)
                // Kiểm tra nếu loaiThuocID không nằm trong danh sách loại thuốc của danh mục
                if(loaiThuocID!=null && !loaiThuocID.isEmpty()){
                    String finalLoaiThuocID = loaiThuocID;
                    boolean isLoaiThuocValid = loaiThuocList.stream()
                            .anyMatch(loaiThuoc -> loaiThuoc.getId() == Integer.parseInt(finalLoaiThuocID));
                    // LoaiThuocID không nằm trong danh mục thuốc được chọn
                    if (!isLoaiThuocValid) {
                        loaiThuocID = null; // Đặt về trạng thái "chưa chọn"
                    }
                }
            }
            else{
                // Lấy all loại thuốc khi chưa chọn danh mục
                req.setAttribute("LoaiThuoc", new ILoaiThuoc().SelectAll());
            }

            req.setAttribute("DoTuoiSuDung", new IDoTuoiSuDung().SelectAll());
            req.setAttribute("NoiSanXuat", new ISanPham().dsNoiSanXuat());
            req.setAttribute("ThuongHieu", new ISanPham().dsThuongHieu());

            // Bắt đầu lọc theo yêu cầu
            dssp = new ISanPham().filterSanPham(danhMucID, loaiThuocID, priceRange, doTuoiID, noiSanXuat, thuongHieu);

            // Thực hiện sắp xếp mặc định ASC
            List<SanPham> SortList = new ArrayList<>(dssp);
            if (sort != null && !sort.isEmpty()) {
                switch (sort) {
                    case "price-asc":
                        // Sắp xếp theo giá tăng dần theo giá min
                        SortList = SortList.stream()
                                .sorted(Comparator.comparing(sanPham -> sanPham.getCacChiTietSanPham().stream()
                                        .min(Comparator.comparing(ChiTietSanPham::getGiaBan))
                                        .get().getGiaBan()))
                                .collect(Collectors.toList());
                        break;
                    case "price-desc":
                        // Sắp xếp theo giá giảm dần theo giá max
                        SortList = SortList.stream()
                                .sorted((sp1, sp2) -> Double.compare(
                                        sp2.getCacChiTietSanPham().stream()
                                                .max(Comparator.comparing(ChiTietSanPham::getGiaBan))
                                                .get().getGiaBan(),
                                        sp1.getCacChiTietSanPham().stream()
                                                .max(Comparator.comparing(ChiTietSanPham::getGiaBan))
                                                .get().getGiaBan()))
                                .collect(Collectors.toList());
                        break;
                }
            }
            req.setAttribute("productList", SortList);

            //Chuyển đến trang SanPhamThuoc.jsp
            getServletContext().getRequestDispatcher("/SanPhamThuoc.jsp").forward(req, resp);
        }
    }
}