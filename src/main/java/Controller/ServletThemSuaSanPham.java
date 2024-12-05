package Controller;

import Model.BusinessModels.SanPham.*;
import Model.DatabaseModels.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/servletThemSuaSanPham")
public class ServletThemSuaSanPham extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action + "ervlet them sua san pham");
        //them san pham
        if (action.equals("themSP")) {
            getServletContext().getRequestDispatcher("/ThemSanPhamMoi.jsp").forward(request, response);
        }
        //thêm sp moi
        else if (action.equals("addSanPham")) {
            ILoaiThuoc iLoaiThuoc = new ILoaiThuoc();
            //Lay DanhMucThuoc
            String danhMucThuoc = request.getParameter("danhMucThuoc");
            int danhmucId = Integer.parseInt(danhMucThuoc);
            DanhMucThuoc dmt = new DanhMucThuoc(danhmucId);
            //Lay LoaiThuoc
            String loaiThuoc = request.getParameter("loaiThuoc");
            int loaiThuocID = Integer.parseInt(loaiThuoc);

            LoaiThuoc lt = iLoaiThuoc.SelectById(loaiThuocID);
            //tao doi tuong loai thuoc de cap nhat san pham them vao
            LoaiThuoc loaithuoc = new LoaiThuoc(loaiThuocID, lt.getTenLoaiThuoc(), dmt);
            //SANPHAM
            String tenSP = request.getParameter("tenSP");
            String thuongHieu = request.getParameter("thuongHieu");
            String noiSanXuat = request.getParameter("noiSanXuat");
            String anhSanPham = request.getParameter("anhSP");
            String linkCTSP = request.getParameter("linkChiTietSanPham");
            SanPham sp = new SanPham(tenSP, thuongHieu, noiSanXuat, anhSanPham, linkCTSP, loaithuoc);
            //lay chi tiet san pham ve
            String soLuongTrongKho = request.getParameter("soLuongTrongKho");
            int soLuongTrongKhoINT = Integer.parseInt(soLuongTrongKho);
            String gBan = request.getParameter("giaBan");
            double giaBan = Double.parseDouble(gBan);
            String gNhap = request.getParameter("giaNhap");
            double giaNhap = Double.parseDouble(gNhap);
            //DonViTinh
            //            String dvt=req.getParameter("donvitinh");
            //            DonViTinh donViTinh = new DonViTinh(dvt);
            String[] donViTinhIds = request.getParameterValues("donvitinh"); // Lấy danh sách ID đơn vị tính được chọn
            //lấy về là lấy 1 danh sách --> thêm từng dòng xuống ctsp
            if (donViTinhIds != null) { // Kiểm tra nếu có checkbox được chọn
                for (String dvt : donViTinhIds) {
                    // Tạo đối tượng DonViTinh
                    int dvtID = Integer.parseInt(dvt);
                    DonViTinh donViTinh = new DonViTinh(dvtID);

                    // Tạo đối tượng ChiTietSanPham với thông tin cần thiết
                    ChiTietSanPham chiTietSanPham = new ChiTietSanPham(
                            soLuongTrongKhoINT,  // số lượng trong kho
                            giaBan,              // giá bán
                            giaNhap,             // giá nhập
                            donViTinh,           // đơn vị tính
                            sp                   // sản phẩm
                    );
                    sp.addChiTietSanPham(chiTietSanPham);
                }
            }
            loaithuoc.addSanPham(sp);
            iLoaiThuoc.ThemSanPham(loaithuoc);
            getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
        }
        //hiện thông tin sản phẩm để chỉnh sửa
        else if (action.equals("hienThongTinSanPhamTrangSua"))
        {
            System.out.println("lấy dữ liệu để hiện lên trang sửa chinh sua san pham servlet themspmoi");
            //lấy id sản phẩm từ bảng để hiện dữ liệu trang để sửa/xóa
            String idsp = request.getParameter("id");
            int id = Integer.parseInt(idsp);

            //lay san pham
            ISanPham iSanPham = new ISanPham();
            SanPham sanph = iSanPham.SelectById(id);
            request.setAttribute("sanPham", sanph); // Đưa sản phẩm vào request chuyen qua trang khac

            //lay chi tiet san pham de hien len thong tin san pham
            IChiTietSanPham iChiTietSanPham = new IChiTietSanPham();
            System.out.println(id);
            ChiTietSanPham cTSP = iChiTietSanPham.SelectById(id);
            //de lay don vi tinh
            Set<ChiTietSanPham> chiTietSanPhamSet = iChiTietSanPham.SelectByID(id);
            //lay ctsp
            request.setAttribute("ctsp", cTSP);
            System.out.println(cTSP.getSanPham().getTenSanPham());
            System.out.println(cTSP.getGiaBan());
            System.out.println(cTSP.getGiaNhap());
            //lay danh sach id donvitinh de lam checked box
            List<Integer> dsDonViTinhID = new ArrayList<>();
            //
            Set<LoaiThuoc> dsLoaiThuoc = new ILoaiThuoc().SelectAll();
            request.setAttribute("danhSachLoaiThuoc", dsLoaiThuoc);
            //
            LoaiThuoc LoaiThuocLayDM = new ILoaiThuoc().SelectById(sanph.getLoaiThuoc().getId());
            int iddanhmuc = LoaiThuocLayDM.getDanhMucThuoc().getId();
            System.out.println(iddanhmuc);
            //
            request.setAttribute("iddanhmuc", iddanhmuc);
            // Duyệt qua các ChiTietSanPham để lấy id của DonViTinh
            for (ChiTietSanPham ct : chiTietSanPhamSet) {
                dsDonViTinhID.add(ct.getDonViTinh().getId());  // Lưu id của DonViTinh
            }
            request.setAttribute("dsDonViTinhID", dsDonViTinhID);
            //lấy tất cả thông tin theo id
            getServletContext()
                    .getRequestDispatcher("/SuaSanPham.jsp")
                    .forward(request, response);
        }
        //cập nhật sản phẩm
        else if (action.equals("capNhatSanPham")) {
            //lấy id sản phẩm
            String idsp = request.getParameter("id");
            int id = Integer.parseInt(idsp);
            //lấy id danh mục
            String danhMucThuoc = request.getParameter("danhMucThuoc");
            int danhmucId = Integer.parseInt(danhMucThuoc);
            //khởi tạo danh mục
            DanhMucThuoc dmt = new DanhMucThuoc(danhmucId);
            //Lay LoaiThuoc
            String loaiThuoc = request.getParameter("loaiThuoc");
            int loaiThuocID = Integer.parseInt(loaiThuoc);
            String tenLoaiThuoc = new ILoaiThuoc().SelectById(loaiThuocID).getTenLoaiThuoc();
            LoaiThuoc loaithuoc = new LoaiThuoc(loaiThuocID, tenLoaiThuoc, dmt);
            //SANPHAM
            String tenSP = request.getParameter("tenSP");
            String thuongHieu = request.getParameter("thuongHieu");
            String noiSanXuat = request.getParameter("noiSanXuat");
            String anhSanPham = request.getParameter("anhSP");
            String linkCTSP = request.getParameter("linkChiTietSanPham");
            SanPham sp = new SanPham(id, tenSP, thuongHieu, noiSanXuat, anhSanPham, linkCTSP, loaithuoc);

            //chitietsanpham
            String soLuongTrongKho = request.getParameter("soLuongTrongKho");
            int soLuongTrongKhoINT = Integer.parseInt(soLuongTrongKho);
            String gBan = request.getParameter("giaBan");
            double giaBan = Double.parseDouble(gBan);
            String gNhap = request.getParameter("giaNhap");
            double giaNhap = Double.parseDouble(gNhap);
            //DonViTinh
            for (ChiTietSanPham ctsp : sp.getCacChiTietSanPham()) {
                ctsp.getDonViTinh().removeChiTietSanPham(ctsp); // Xóa tất cả các đơn vị tính trong chi tiết sản phẩm
                new IChiTietSanPham().update(ctsp); // Cập nhật lại chi tiết sản phẩm sau khi xóa
            }
            String[] donViTinhIds = request.getParameterValues("donvitinh"); // Lấy danh sách ID đơn vị tính được chọn
            //lấy về là lấy 1 danh sách --> thêm từng dòng xuống ctsp
            IChiTietSanPham iChiTietSanPham = new IChiTietSanPham();
            if (donViTinhIds != null) { // Kiểm tra nếu có checkbox được chọn
                for (String dvt : donViTinhIds) {
                    // Tạo đối tượng DonViTinh
                    int dvtID = Integer.parseInt(dvt);
                    DonViTinh donViTinh = new DonViTinh(dvtID);

                    // Tạo đối tượng ChiTietSanPham với thông tin cần thiết
                    ChiTietSanPham chiTietSanPham = new ChiTietSanPham(
                            soLuongTrongKhoINT,  // số lượng trong kho
                            giaBan,              // giá bán
                            giaNhap,             // giá nhập
                            donViTinh,           // đơn vị tính
                            sp                   // sản phẩm
                    );
                    sp.addChiTietSanPham(chiTietSanPham);
                    iChiTietSanPham.insert(chiTietSanPham);
                }
                ISanPham iSanPham = new ISanPham();
                iSanPham.update(sp);
                ILoaiThuoc iLoaiThuoc = new ILoaiThuoc();
                iLoaiThuoc.update(loaithuoc);
                IDanhMucThuoc iDanhMucThuoc = new IDanhMucThuoc();
                iDanhMucThuoc.update(dmt);
                getServletContext().getRequestDispatcher("/admin.jsp").forward(request,response);
            }
        }
    }
}