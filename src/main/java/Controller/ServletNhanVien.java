package Controller;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import Model.DatabaseModels.INhanVien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletNhanVien")
public class ServletNhanVien extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Kiểm tra xem có phai là hành động thêm nhân viên hay không?

        // Nếu không thì là hành động lấy toàn bộ danh sách nhân viên ln
        // Lấy danh sách nhân viên từ CSDL lên
        Set<NhanVien> dsnv = new INhanVien().SelectAll();
        req.setAttribute("danhSachNhanVien", dsnv);

        // Điều hướng tới trang admin - page DSNhanVien
        getServletContext().getRequestDispatcher("/admin.jsp?page=DSnhanvien").forward(req, resp);
    }
}
