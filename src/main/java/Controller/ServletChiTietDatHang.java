package Controller;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.DatabaseModels.IChiTietDatHang;
import Model.DatabaseModels.IDatHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/servletChiTietDatHang")
public class ServletChiTietDatHang extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Set<ChiTietDatHang> dsCTDatHang = null;
        if(action.equals("LayChiTietDatHangTheoIDDatHang")){
            int idDatHang = Integer.parseInt(request.getParameter("idDatHang"));
            dsCTDatHang = new IChiTietDatHang().SelectByID(idDatHang);
            request.setAttribute("dsCTDatHang", dsCTDatHang);
            getServletContext().getRequestDispatcher("/ChiTietDonHang.jsp").forward(request, response);
        }
        else {
            // Lấy toàn bộ sản phẩm từ CSDL

        }
    }
}