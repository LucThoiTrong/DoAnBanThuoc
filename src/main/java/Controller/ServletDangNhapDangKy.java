package Controller;

import Model.BusinessModels.DoiTuongSuDung.Admin;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import Model.BusinessModels.TKDoiTuongSuDung.TKAdmin;
import Model.BusinessModels.TKDoiTuongSuDung.TKKhachHang;
import Model.BusinessModels.TKDoiTuongSuDung.TKNhanVien;
import Model.DatabaseModels.IKhachHang;
import Model.DatabaseModels.ITKAdmin;
import Model.DatabaseModels.ITKKhachHang;
import Model.DatabaseModels.ITKNhanVien;
import Util.MaHoaMatKhau;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/servletDangNhapDangKy")
public class ServletDangNhapDangKy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Kiểm tra đang ở chế độ đăng nhập hay đăng ký tài khoản
        String action = req.getParameter("action");
        if (action.equals("DangKy")) {
            // Nếu là trang đăng ký thì lấy dữ liệu và viết hàm đăng ký tài khoản
            DangKyTaiKhoan(req, resp);
        }
        else if (action.equals("DangNhap")) {
            DangNhapTaiKhoan(req, resp);
        }
    }

    // Đăng nhập
    private void DangNhapTaiKhoan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Nếu là khách hàng thì chuyển vô trang người dùng đang ở hiện tại
        // Ngược lại - là nhân viên, quản lý hoặc admin => vô trang admin
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String enPassword = new MaHoaMatKhau().toSHA1(password);

        TKKhachHang tkKhachHang = new ITKKhachHang().selectTKKhachHang(username, enPassword);
        TKNhanVien tkNhanVien = new ITKNhanVien().selectTKNhanVien(username, enPassword);
        TKAdmin tkAdmin = new ITKAdmin().selectTKAdmin(username, enPassword);

        if(tkKhachHang != null) {
            KhachHang khachHang = tkKhachHang.getKhachHang();
            if (khachHang != null) {
                HttpSession session = req.getSession();
                session.setAttribute("khachHang", khachHang);
                getServletContext().getRequestDispatcher("/servletSanPham").forward(req, resp);
            } else {
                resp.getWriter().println("Không tìm thấy thông tin khách hàng.");
            }
        }
        else if(tkNhanVien != null) {
            NhanVien nhanVien = tkNhanVien.getNhanVien();
            HttpSession session = req.getSession();
            session.setAttribute("nhanVien", nhanVien);
            getServletContext().getRequestDispatcher("/servletDashboard").forward(req, resp);
        }
        else if(tkAdmin != null) {
            Admin admin = tkAdmin.getAdmin();
            HttpSession session = req.getSession();
            session.setAttribute("admin", admin);
            getServletContext().getRequestDispatcher("/admin.jsp").forward(req, resp);
        }
        else {
            req.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu!");
            getServletContext().getRequestDispatcher("/signin.html").forward(req, resp);
        }
    }

    // Đăng ký
    private void DangKyTaiKhoan(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        // Lấy hết 6 field về khách hàng
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        TKKhachHang existingAccount = new ITKKhachHang().selectTKKhachHang(username, password);
        if (existingAccount != null) {
            req.setAttribute("errorMessage", "Tên tài khoản đã tồn tại!");
            getServletContext().getRequestDispatcher("/signin.html").forward(req, resp);
        } else {
            KhachHang khachHang = new KhachHang(fullname, phone, email);
            TKKhachHang tkKhachHang = new TKKhachHang(username, new MaHoaMatKhau().toSHA1(password), khachHang);
            new ITKKhachHang().insert(tkKhachHang);
            getServletContext().getRequestDispatcher("/signin.html").forward(req, resp);
        }
    }
}
