package Controller;

import Model.BusinessModels.SanPham.DanhMucThuoc;
import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.DatabaseModels.IDanhMucThuoc;
import Model.DatabaseModels.ILoaiThuoc;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletLoaiThuoc")
public class ServletLoaiThuoc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // kiểm tra xem đang là thêm loại thuốc hay lấy toàn bộ loai thuốc lên

        String url ="/admin.jsp?page=DSthuoc";
        String action = req.getParameter("action");
        System.out.println(action);
        //thêm loại thuốc mới
        if (action.equals("add"))
        {
            String iddanhmucthuoc = req.getParameter("iddanhmucthuoc");
            int danhmucId = Integer.parseInt(iddanhmucthuoc);
            String tenloaithuoc=null;
            if (danhmucId == 1) {
                tenloaithuoc = req.getParameter("loaithuocKoKD");
            }
            else if (danhmucId==2)
            {
                tenloaithuoc = req.getParameter("tenloaithuoc");
            }
            DanhMucThuoc dmt = new DanhMucThuoc(danhmucId);
            LoaiThuoc lt = new LoaiThuoc(tenloaithuoc,dmt);
            ILoaiThuoc iLoaiThuoc = new ILoaiThuoc();
            new ILoaiThuoc().insert(lt);
            getServletContext().getRequestDispatcher("/admin.jsp?page=DSthuoc").forward(req, resp);
        }
//        //chuyển danh sách loại thuốc để thêm sản phẩm(thuốc) mới
        else if(action.equals("themSP"))
        {
            Set<LoaiThuoc> dsLoaiThuoc = new ILoaiThuoc().SelectAll();
            req.setAttribute("danhSachLoaiThuoc", dsLoaiThuoc);
            //LAY ID Loai thuoc de them sp vao loai thuoc do
            String idLoaiThuoc=req.getParameter("idLoaiThuoc");
            LoaiThuoc lt = new ILoaiThuoc().SelectById(Integer.parseInt(idLoaiThuoc));
            req.setAttribute("loaiThuoc",lt);

            //lay danh muc cua sp do
            DanhMucThuoc dmt=lt.getDanhMucThuoc();
            req.setAttribute("danhMucThuoc",dmt);
            getServletContext().getRequestDispatcher("/ThemSanPhamMoi.jsp").forward(req, resp);

        }
        //CẬP NHẬT LOẠI THUỐC (TÊN - DANH MỤC LOẠI THUỐC)
        else if (action.equals("capNhatLoaiThuoc"))
        {
            String id = req.getParameter("idLoaiThuocSua");
            int idLoaiThuoc = Integer.parseInt(id);
            //lay doi tuong loai thuoc tu csdl len
            LoaiThuoc lt = new ILoaiThuoc().SelectById(idLoaiThuoc);

            //lay danh muc thuoc mới
            String idDanhMucThuoc = req.getParameter("danhmucthuocSua");

            int idDanhMuc = Integer.parseInt(idDanhMucThuoc);
            //kiem tra co thay doi danh muc thuoc ko
            if(idDanhMuc!=lt.getDanhMucThuoc().getId())
            {
                //lay doi tuong danh muc thuoc cũ
                DanhMucThuoc dmt = lt.getDanhMucThuoc();
//                dmt.removeLoaiThuoc(lt);
                new IDanhMucThuoc().update(dmt);

                //cap nhat lai danh mục thuốc mới
                DanhMucThuoc dmtmoi= new IDanhMucThuoc().SelectById(idDanhMuc);

                dmtmoi.addLoaiThuoc(lt);
                lt.setDanhMucThuoc(dmtmoi);
                new IDanhMucThuoc().update(dmtmoi);
            }
            //lay ten moi
            String tenLoaiThuocMoi = req.getParameter("tenLoaiThuocSua");
            lt.setTenLoaiThuoc(tenLoaiThuocMoi);
            new ILoaiThuoc().update(lt);
            getServletContext().getRequestDispatcher("/DSthuoc.jsp").forward(req, resp);
        }
//        //chỉnh sửa và xóa sản phẩm
//        //lay ds loai thuoc de hien len trang chỉnh sửa sản phẩm
        else if(action.equals("hienDSLoaiThuocTrangSuaSP"))
        {
            //LẤY ID SP TRUYỀN TỪ TRANG SPTHUOCADMIN
            String idsp=req.getParameter("id");
            //gửi id san pham qua servlet kia
            req.setAttribute("id", idsp);
            getServletContext()
                    .getRequestDispatcher("/servletThemSuaSanPham?action=hienThongTinSanPhamTrangSua")
                    .forward(req, resp);
//            getServletContext()
//                    .getRequestDispatcher("/SuaSanPham.jsp?action=hienThongTinSanPhamTrangSua")
//                    .forward(req, resp);
        }
        else {
            LayAllLoaiThuoc(req, resp);
        }
    }
    protected void LayAllLoaiThuoc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Nếu không phải => lấy toàn bộ dữ liệu loại thuốc lên
        Set<LoaiThuoc> dsLoaiThuoc = new ILoaiThuoc().SelectAll();
        req.setAttribute("danhSachLoaiThuoc", dsLoaiThuoc);

        getServletContext().getRequestDispatcher("/admin.jsp?page=DSthuoc").forward(req, resp);
    }
}