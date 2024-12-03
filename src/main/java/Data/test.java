package Data;

import Model.BusinessModels.DoiTuongSuDung.Admin;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhapHang;
import Model.BusinessModels.Enum.ChucVu;
import Model.BusinessModels.SanPham.*;
import Model.BusinessModels.TKDoiTuongSuDung.TKAdmin;
import Model.BusinessModels.TKDoiTuongSuDung.TKNhanVien;
import Model.DatabaseModels.*;
import Util.MaHoaMatKhau;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.sql.Date;
import java.util.*;

public class test {
    public static void main(String[] args) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thêm Danh Mục Thuốc
            DanhMucThuoc dm1 = new DanhMucThuoc("Thuốc không kê đơn");
            DanhMucThuoc dm2 = new DanhMucThuoc("Thuốc kê đơn");

            // Thêm Loại Thuốc
            // Danh mục 1
            LoaiThuoc lt1 = new LoaiThuoc("Thuốc kháng dị ứng", dm1);
            LoaiThuoc lt2 = new LoaiThuoc("Thuốc kháng viêm", dm1);
            LoaiThuoc lt3 = new LoaiThuoc("Thuốc cảm lạnh", dm1);
            LoaiThuoc lt4 = new LoaiThuoc("Thuốc tiêu hóa", dm1);
            LoaiThuoc lt5 = new LoaiThuoc("Thuốc thần kinh", dm1);

            Set<LoaiThuoc> dm1_LoaiThuoc = new HashSet<>(Arrays.asList(lt1, lt2, lt3, lt4, lt5));
            dm1.setDanhSachLoaiThuoc(dm1_LoaiThuoc);

            // Danh mục 2
            LoaiThuoc lt6 = new LoaiThuoc("Thuốc kháng sinh", dm2);
            LoaiThuoc lt7 = new LoaiThuoc("Thuốc ung thư", dm2);
            LoaiThuoc lt8 = new LoaiThuoc("Thuốc tiết niệu", dm2);
            LoaiThuoc lt9 = new LoaiThuoc("Vitamin & khoáng chất", dm2);
            LoaiThuoc lt10 = new LoaiThuoc("Thuốc tim mạch, huyết áp", dm2);

            Set<LoaiThuoc> dm2_LoaiThuoc = new HashSet<>(Arrays.asList(lt6, lt7, lt8, lt9, lt10));
            dm2.setDanhSachLoaiThuoc(dm2_LoaiThuoc);

            // Thêm Đơn Vị Tính
            DonViTinh dvt1 = new DonViTinh("Vỉ");
            DonViTinh dvt2 = new DonViTinh("Hộp");
            DonViTinh dvt3 = new DonViTinh("Tuýp");
            DonViTinh dvt4 = new DonViTinh("Ống");
            DonViTinh dvt5 = new DonViTinh("Chai");
            DonViTinh dvt6 = new DonViTinh("Gói");

            new IDonViTinh().insert(dvt1);
            new IDonViTinh().insert(dvt2);
            new IDonViTinh().insert(dvt3);
            new IDonViTinh().insert(dvt4);
            new IDonViTinh().insert(dvt5);
            new IDonViTinh().insert(dvt6);

            // Thêm Độ Tuổi Sử Dụng
            DoTuoiSuDung dtsd1 = new DoTuoiSuDung("Trẻ sơ sinh");
            DoTuoiSuDung dtsd2 = new DoTuoiSuDung("Trẻ em");
            DoTuoiSuDung dtsd3 = new DoTuoiSuDung("Thiếu niên");
            DoTuoiSuDung dtsd4 = new DoTuoiSuDung("Người lớn");
            DoTuoiSuDung dtsd5 = new DoTuoiSuDung("Người cao tuổi");

            // Thêm Sản Phẩm
            SanPham sp1 = new SanPham("Acritel 10g (Hộp 6 vỉ x 10 viên)", "Davipharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1k1PCGbhhw-phQ90SmM4Lf9QTCONfw9KZ&sz=w1000", "1_ThuocKhangDiUng1.jsp",lt1);
            SanPham sp2 = new SanPham("Dung dịch uống A.T Desloratadin 2.5mg trị viêm mũi dị ứng, mày đay, ngứa (30 ống x 5ml)", "An Thiên", "Việt Nam", "https://drive.google.com/thumbnail?id=1q8PmJapcQMRo4yz83ck5vGpy6OG0xEZ5&sz=w1000", "2_ThuocKhangDiUng2.jsp", lt1);
            SanPham sp3 = new SanPham("Siro Lorastad SP STELLA điều trị dị ứng (chai 60ml)", "STELLA", "Việt Nam", "https://drive.google.com/thumbnail?id=1rMPj-1ybtYvBWcnKzlYUwmPiehqRNiN_&sz=w1000", "3_ThuocKhangDiUng3.jsp", lt1);
            SanPham sp4 = new SanPham("Viên nén Allerfar 4mg điều trị triệu chứng viêm mũi dị ứng, mày đay (10 vỉ x 20 viên)",  "Pharmedic", "Việt Nam","https://drive.google.com/thumbnail?id=1cEC6JMeiSCVpNMiaSzAgnUvgZEJ8oJT4&sz=w1000", "4_ThuocKhangDiUng4.jsp",lt1);
            SanPham sp5 = new SanPham("Viên bao tan ở ruột BROMANASE 50 UI điều trị viêm sưng, chống phù nề (10 vỉ x 10 viên)",  "Davipharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1x5QoUvPZ0_KqmUAVqMJ3zIoo_BzEtT2e&sz=w1000", "5_ThuocKhangViem1.jsp", lt2);
            SanPham sp6 = new SanPham("Viên nang Long Huyết P/H điều trị sưng đau, bầm tím, phù nề, chấn thương do va đập (2 vỉ x 12 viên)","Đông dược Phúc Hưng", "Việt Nam", "https://drive.google.com/thumbnail?id=1fRswBR3iRH7oeF6Yr2fP33HwD5rK0ucM&sz=w1000", "6_ThuocKhangViem2.jsp", lt2);
            SanPham sp7 = new SanPham("Dung dịch Dentanalgi điều trị đau răng, viêm nướu răng, nha chu (chai 7ml)", "OPC", "Việt Nam", "https://drive.google.com/thumbnail?id=1tw_E-Upl8oE_kKKgXEL_1N7iAG2sgE63&sz=w1000", "7_ThuocKhangViem3.jsp", lt2);
            SanPham sp8 = new SanPham("Viên nén Cetirizine EG Pymepharco 10mg trị triệu chứng viêm mũi dị ứng, mày đay (10 vỉ x 10 viên)", "Pymepharco", "Việt Nam", "https://drive.google.com/thumbnail?id=1xdREqLjCqhVd_99h18sDthTv0rvCsCze&sz=w1000", "8_ThuocKhangViem4.jsp", lt2);
            SanPham sp9 = new SanPham("Bột pha uống Acehasan 200mg tiêu chất nhầy trong bệnh nhầy nhớt (30 gói x 3g)", "Hasan- Demarpharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1k4zaNjfFDuKjP99w0M7xka0I5S_I1JFS&sz=w1000", "9_ThuocCamLanh1.jsp", lt3);
            SanPham sp10 = new SanPham("Bột pha uống Macetux 200mg Hasan tiêu chất nhầy trong bệnh nhầy nhớt (30 gói x 1g)", "Hasan- Demarpharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1gPDNcs9IPRR0YCM3fkB0b4e1oDduBcoy&sz=w1000", "10_ThuocCamLanh2.jsp", lt3);
            SanPham sp11 = new SanPham("Dung dịch uống Cynamus CPC1 tiêu nhầy, loãng đàm, giảm ho (4 vỉ x 5 ống)", "DP Trung ương CPC1", "Việt Nam", "https://drive.google.com/thumbnail?id=1gz9ygUHVIzHGNv6CQOEPZjw9Zyznkf-x&sz=w1000", "11_ThuocCamLanh3.jsp", lt3);
            SanPham sp12 = new SanPham("Siro Danospan 0.7g/100ml trị viêm đường hô hấp kèm ho, bệnh lý viêm phế quản mạn tính (chai 100ml)", "Danapha", "Việt Nam", "https://drive.google.com/thumbnail?id=1IJopCdjqzJZnHHO5U1EiXnoZkrcKnpHJ&sz=w1000", "12_ThuocCamLanh4.jsp", lt3);
            SanPham sp13 = new SanPham("Bột pha uống Bioflora 100mg trị tiêu chảy cấp ở trẻ em, người lớn (hộp 20 gói)", "Biocodex, France Kisska Int. Ltd., UK", "Pháp", "https://drive.google.com/thumbnail?id=1hTO1x0cU8a8aR07MsOj0l1kbDDTlIztk&sz=w1000", "13_ThuocTieuHoa1.jsp", lt4);
            SanPham sp14 = new SanPham("Bột pha uống Fortrans làm sạch đại tràng trước nội soi, phẫu thuật (gói 73,69g)", "Ipsen Pharma", "Pháp", "https://drive.google.com/thumbnail?id=13WXDBw2DGMZLj9v42tmutWsNnAJ2P3qc&sz=w1000", "14_ThuocTieuHoa2.jsp", lt4);
            SanPham sp15 = new SanPham("Bột pha uống Smecta 3g Hương Dâu điều trị tiêu chảy, rối loạn tiêu hóa (hộp 12 gói)", "Ipsen Pharma", "Pháp", "https://drive.google.com/thumbnail?id=1X_p7fVSKdt3-ESRzLdZjbDPg9ybvVO9y&sz=w1000", "15_ThuocTieuHoa3.jsp", lt4);
            SanPham sp16 = new SanPham("Dung dịch bơm trực tràng Rectiofar Người lớn trị táo bón (40 ống x 5ml)", "Pharmedic", "Việt Nam", "https://drive.google.com/thumbnail?id=1eG1AKKnziKRUFe3j5jBobqxDBHTq6WSt&sz=w1000", "16_ThuocTieuHoa4.jsp", lt4);
            SanPham sp17 = new SanPham("Dung dịch uống Vasoclean Sol 10ml điều trị sa sút trí tuệ ở người lớn (2 vỉ x 10 ống)", "Cho-a-pharm", "Hàn Quốc", "https://drive.google.com/thumbnail?id=1WJQO84ymCrIkqJ7p1_y6tjYLPwihRQ57&sz=w1000", "17_ThuocThanKinh1.jsp", lt5);
            SanPham sp18 = new SanPham("Thuốc Hoạt Huyết Dưỡng Não bao phim Traphaco điều trị suy giảm trí nhớ (5 vỉ x 20 viên)", "Hoat Huyet Duong Nao", "Việt Nam", "https://drive.google.com/thumbnail?id=1HVyZryxVnSaaHy1iNzdHWsPZk4zUKFfX&sz=w1000", "18_ThuocThanKinh2.jsp", lt5);
            SanPham sp19 = new SanPham("Viên nang Bổ Huyết Ích Não BDF Bidipha cải thiện trí nhớ, giảm chóng mặt ù tai (6 vỉ x 10 viên)", "BIDIPHAR", "Việt Nam", "https://drive.google.com/thumbnail?id=1QIBEu56S_w4vVloMoDYpKpflClaDhWwH&sz=w1000", "19_ThuocThanKinh3.jsp", lt5);
            SanPham sp20 = new SanPham("Viên nén Hoạt Huyết Nhất Nhất giúp hoạt huyết, trị thiểu năng tuần hoàn (3 vỉ x 10 viên)", "Công ty TNHH Dược phẩm Nhất Nhất", "Việt Nam", "https://drive.google.com/thumbnail?id=1DG6rJdGpnVUEuqnN7NOdUXwz4E0EzK4k&sz=w1000", "20_ThuocThanKinh4.jsp", lt5);
            SanPham sp21 = new SanPham("Bột pha uống Binozyt 200mg/5ml điều trị nhiễm khuẩn đường hô hấp (chai 15ml)", "Glenmark", "Romania", "https://drive.google.com/thumbnail?id=1cyoDlJTmhENO5diyfvqOmGZw9TCC7cgs&sz=w1000", "21_ThuocKhangSinh1.jsp", lt6);
            SanPham sp22 = new SanPham("Bilclamos bid 1000mg (Hộp 2 vỉ x 7 viên)", "Bilim Ilac Sanayi Ve Ticaret Anonim Sirketi", "Thổ Nhĩ Kỳ", "https://drive.google.com/thumbnail?id=1AxM_pIKeTmzlYgWFOtBljgLmEm5_uHas&sz=w1000", "22_ThuocKhangSinh2.jsp", lt6);
            SanPham sp23 = new SanPham("Bột pha uống Cefdinir 125mg S.Pharm kháng sinh điều trị nhiễm khuẩn (30 gói x 1,5g)", "Công ty cổ phần dược S.Pharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1n6Y9OBmjOY5o7iJl7_rlK6yEIxIdLNOF&sz=w1000", "23_ThuocKhangSinh3.jsp", lt6);
            SanPham sp24 = new SanPham("Bột pha uống Claminat 250mg/62.5mg Imexpharm điều trị nhiễm khuẩn (hộp 12 gói)", "Imexpharm", "Việt Nam", "https://drive.google.com/thumbnail?id=1A-nvoFBzqzN-IYbCQYvy-wlmzVZtodOa&sz=w1000", "24_ThuocKhangSinh4.jsp", lt6);
            SanPham sp25 = new SanPham("Viên nén Arimidex 1mg điều trị ung thư vú (2 vỉ x 14 viên)", "AstraZeneca", "Anh", "https://drive.google.com/thumbnail?id=19byScTkmUQ8WkuH6Ae7oLi27VEIbKBFL&sz=w1000", "25_ThuocUngThu1.jsp", lt7);
            SanPham sp26 = new SanPham("Viên nén Nolvadex-D 20mg điều trị ung thư vú (3 vỉ x 10 viên)", "AstraZeneca", "Anh", "https://drive.google.com/thumbnail?id=13IuAgsrMn5S05BJ9vY_EjOPu-1fGcfAS&sz=w1000", "26_ThuocUngThu2.jsp", lt7);
            SanPham sp27 = new SanPham("Viên nén bao phim Casodex điều trị ung thư tiền liệt tuyến (2 vỉ x 14 viên)", "AstraZeneca", "Anh", "https://drive.google.com/thumbnail?id=19H4mWgI15vVOpDP3Q8xlmS10gTe2Rod1&sz=w1000", "27_ThuocUngThu3.jsp", lt7);
            SanPham sp28 = new SanPham("Viên nén bao phim Femara kích trứng trưởng thành và điều trị ung thư vú (3 vỉ x 10 viên)", "Novartis", "Thụy Sĩ", "https://drive.google.com/thumbnail?id=1Xwcuz7eTg6CCI1nu0wNYOMSM5WBa_Rk6&sz=w1000", "28_ThuocUngThu4.jsp", lt7);
            SanPham sp29 = new SanPham("Viên bao đường Domitazol Domesco hỗ trợ điều trị nhiễm trùng đường tiết niệu dưới (5 vỉ x 10 viên)", "Domesco", "Việt Nam", "https://drive.google.com/thumbnail?id=1Q3eMLNPFPyh_db0VNcsP68eCW43tvw14&sz=w1000", "29_ThuocTietNieu1.jsp", lt8);
            SanPham sp30 = new SanPham("Viên giải phóng có kiểm soát Harnal Ocas 0.4mg trị triệu chứng của đường tiểu dưới (3 vỉ x 10 viên)", "Astellas Ireland Co.", "IreLand", "https://drive.google.com/thumbnail?id=1dGI18_ldNBB_N_toTB-S0GNAKrty5lGK&sz=w1000", "30_ThuocTietNieu2.jsp", lt8);
            SanPham sp31 = new SanPham("Viên giải phóng có kiểm soát Xalgetz 0.4mg trị hội chứng tăng sản tuyến tiền liệt (1 vỉ x 10 viên)", "Getz Pharma (Pvt)., Ltd", "Ấn Độ", "https://drive.google.com/thumbnail?id=1U50oLvosUblayhaRoPsMDFocOSLqtv5X&sz=w1000", "31_ThuocTietNieu3.jsp", lt8);
            SanPham sp32 = new SanPham("Viên nang Avodart 0.5mg điều trị tăng sản lành tính tuyến tiền liệt (3 vỉ x 10 viên)", "GlaxoSmithKline ETC", "Anh", "https://drive.google.com/thumbnail?id=1OTvwClU-u41PuqLBp59Ef6BLQuOo468o&sz=w1000", "32_ThuocTietNieu4.jsp", lt8);
            SanPham sp33 = new SanPham("Dung dịch uống A.T Ascorbic 100mg/5ml bổ sung vitamin C (30 ống x 10ml)", "An Thiên", "Việt Nam", "https://drive.google.com/thumbnail?id=1LhfGjzj6--aiDYzY6egrf7bKyO0TjZOG&sz=w1000", "33_VitaminVaKhoangChat1.jsp", lt9);
            SanPham sp34 = new SanPham("Dung dịch uống Aquadetrim D3 điều trị thiếu vitamin D (chai 10ml)", "Medana Pharma", "Ba Lan", "https://drive.google.com/thumbnail?id=1LUEl7Y0eljVdXJJ2CxBqiNGRrurlqCId&sz=w1000", "34_VitaminVaKhoangChat2.jsp", lt9);
            SanPham sp35 = new SanPham("Dung dịch uống Conipa Pure 70mg phòng ngừa và điều trị thiếu kẽm (4 vỉ x 5 ống)", "DP Trung ương CPC1", "Việt Nam", "https://drive.google.com/thumbnail?id=1XFiSq3QXxEdcg8Zd-IMuuMnMm-BjHuAC&sz=w1000", "35_VitaminVaKhoangChat3.jsp", lt9);
            SanPham sp36 = new SanPham("Dung dịch uống Ferlatum 800mg bổ sung sắt, bổ máu (10 chai x 15ml)", "Italfarmaco S.A", "Tây Ban Nha", "https://drive.google.com/thumbnail?id=11WYJ6k8qy29RWAjCeoTXe0LCe0l_PId6&sz=w1000", "36_VitaminVaKhoangChat4.jsp", lt9);
            SanPham sp37 = new SanPham("Cao lỏng Cortonyl trợ tim, ngất do suy tim, mất ngủ , lao lực, an thần (chai 25ml)", "OPC", "Việt Nam", "https://drive.google.com/thumbnail?id=1PHXfo7EC9FuFJcUeoqJ-TvwRpGLrXfC2&sz=w1000", "37_ThuocTimMachHuyetAp1.jsp", lt10);
            SanPham sp38 = new SanPham("Viên giải phóng có kiểm soát Betaloc ZOK 25mg điều trị tăng huyết áp, đau thắt ngực (1 vỉ x 14 viên)", "AstraZeneca", "Anh", "https://drive.google.com/thumbnail?id=1eVd3lbQReI5MJDf4Hg7sNWQuAvMpS4RA&sz=w1000", "38_ThuocTimMachHuyetAp2.jsp", lt10);
            SanPham sp39 = new SanPham("Viên bao tan ở ruột Aspilets EC phòng ngừa nhồi máu cơ tim, đau thắt ngực (10 vỉ x 10 viên)", "UNITED PHARMA INC.", "Việt Nam", "https://drive.google.com/thumbnail?id=1LSxyQmUXdihcllL6GFJXa2-NigFxxE7n&sz=w1000", "39_ThuocTimMachHuyetAp3.jsp", lt10);
            SanPham sp40 = new SanPham("Viên giải phóng có kiểm soát Trimetazidin Stella 35mg MR trị đau thắt ngực ổn định (3 vỉ x 10 viên)", "Công ty TNHH LD Stellapharm", "Việt Nam", "https://drive.google.com/thumbnail?id=12Gc26-7RYvWf_ZEUpWvCXzsNFHXeih0y&sz=w1000", "40_ThuocTimMachHuyetAp4.jsp", lt10);

            //Loại thuốc 1 - sản phẩm
            Set<SanPham> lt1_SanPham = new HashSet<>(Arrays.asList(sp1, sp2, sp3, sp4));
            lt1.setDanhSachSanPham(lt1_SanPham);

            // Loại thuốc 2 - sản phẩm
            Set<SanPham> lt2_SanPham = new HashSet<>(Arrays.asList(sp5, sp6, sp7, sp8));
            lt2.setDanhSachSanPham(lt2_SanPham);

            // Loại thuốc 3 - sản phẩm
            Set<SanPham> lt3_SanPham = new HashSet<>(Arrays.asList(sp9, sp10, sp11, sp12));
            lt3.setDanhSachSanPham(lt3_SanPham);

            // Loại thuốc 4 - sản phẩm
            Set<SanPham> lt4_SanPham = new HashSet<>(Arrays.asList(sp13, sp14, sp15, sp16));
            lt4.setDanhSachSanPham(lt4_SanPham);

            // Loại thuốc 5 - sản phẩm
            Set<SanPham> lt5_SanPham = new HashSet<>(Arrays.asList(sp17, sp18, sp19, sp20));
            lt5.setDanhSachSanPham(lt5_SanPham);

            // Loại thuốc 6 - sản phẩm
            Set<SanPham> lt6_SanPham = new HashSet<>(Arrays.asList(sp21, sp22, sp23, sp24));
            lt6.setDanhSachSanPham(lt6_SanPham);

            // Loại thuốc 7 - sản phẩm
            Set<SanPham> lt7_SanPham = new HashSet<>(Arrays.asList(sp25, sp26, sp27, sp28));
            lt7.setDanhSachSanPham(lt7_SanPham);

            // Loại thuốc 8 - sản phẩm
            Set<SanPham> lt8_SanPham = new HashSet<>(Arrays.asList(sp29, sp30, sp31, sp32));
            lt8.setDanhSachSanPham(lt8_SanPham);

            // Loại thuốc 9 - sản phẩm
            Set<SanPham> lt9_SanPham = new HashSet<>(Arrays.asList(sp33, sp34, sp35, sp36));
            lt9.setDanhSachSanPham(lt9_SanPham);

            // Loại thuốc 10 - sản phẩm
            Set<SanPham> lt10_SanPham = new HashSet<>(Arrays.asList(sp37, sp38, sp39, sp40));
            lt10.setDanhSachSanPham(lt10_SanPham);

            // Sản phẩm 1 - độ tuổi
            sp1.addDoTuoiSuDung(dtsd2);
            sp1.addDoTuoiSuDung(dtsd3);
            sp1.addDoTuoiSuDung(dtsd4);
            sp1.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp1);
            dtsd3.addSanPham(sp1);
            dtsd4.addSanPham(sp1);
            dtsd5.addSanPham(sp1);

            // Sản phẩm 2 - độ tuổi
            sp2.addDoTuoiSuDung(dtsd2);
            sp2.addDoTuoiSuDung(dtsd3);
            sp2.addDoTuoiSuDung(dtsd4);
            sp2.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp2);
            dtsd3.addSanPham(sp2);
            dtsd4.addSanPham(sp2);
            dtsd5.addSanPham(sp2);

            // Sản phẩm 3 - độ tuổi
            sp3.addDoTuoiSuDung(dtsd2);
            sp3.addDoTuoiSuDung(dtsd3);
            sp3.addDoTuoiSuDung(dtsd4);
            sp3.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp3);
            dtsd3.addSanPham(sp3);
            dtsd4.addSanPham(sp3);
            dtsd5.addSanPham(sp3);

            // Sản phẩm 4 - độ tuổi
            sp4.addDoTuoiSuDung(dtsd2);
            sp4.addDoTuoiSuDung(dtsd3);
            sp4.addDoTuoiSuDung(dtsd4);
            sp4.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp4);
            dtsd3.addSanPham(sp4);
            dtsd4.addSanPham(sp4);
            dtsd5.addSanPham(sp4);

            // Sản phẩm 5 - độ tuổi
            sp5.addDoTuoiSuDung(dtsd3);
            sp5.addDoTuoiSuDung(dtsd4);
            sp5.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp5);
            dtsd4.addSanPham(sp5);
            dtsd5.addSanPham(sp5);

            // Sản phẩm 6 - độ tuổi
            sp6.addDoTuoiSuDung(dtsd2);
            sp6.addDoTuoiSuDung(dtsd3);
            sp6.addDoTuoiSuDung(dtsd4);
            sp6.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp6);
            dtsd3.addSanPham(sp6);
            dtsd4.addSanPham(sp6);
            dtsd5.addSanPham(sp6);

            // Sản phẩm 7 - độ tuổi
            sp7.addDoTuoiSuDung(dtsd2);
            sp7.addDoTuoiSuDung(dtsd3);
            sp7.addDoTuoiSuDung(dtsd4);
            sp7.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp7);
            dtsd3.addSanPham(sp7);
            dtsd4.addSanPham(sp7);
            dtsd5.addSanPham(sp7);

            // Sản phẩm 8 - độ tuổi
            sp8.addDoTuoiSuDung(dtsd2);
            sp8.addDoTuoiSuDung(dtsd3);
            sp8.addDoTuoiSuDung(dtsd4);
            sp8.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp8);
            dtsd3.addSanPham(sp8);
            dtsd4.addSanPham(sp8);
            dtsd5.addSanPham(sp8);

            // Sản phẩm 9 - độ tuổi
            sp9.addDoTuoiSuDung(dtsd2);
            sp9.addDoTuoiSuDung(dtsd3);
            sp9.addDoTuoiSuDung(dtsd4);
            sp9.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp9);
            dtsd3.addSanPham(sp9);
            dtsd4.addSanPham(sp9);
            dtsd5.addSanPham(sp9);

            // Sản phẩm 10 - độ tuổi
            sp10.addDoTuoiSuDung(dtsd2);
            sp10.addDoTuoiSuDung(dtsd3);
            sp10.addDoTuoiSuDung(dtsd4);
            sp10.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp10);
            dtsd3.addSanPham(sp10);
            dtsd4.addSanPham(sp10);
            dtsd5.addSanPham(sp10);

            // Sản phẩm 11 - độ tuổi
            sp11.addDoTuoiSuDung(dtsd2);
            sp11.addDoTuoiSuDung(dtsd3);
            sp11.addDoTuoiSuDung(dtsd4);
            sp11.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp11);
            dtsd3.addSanPham(sp11);
            dtsd4.addSanPham(sp11);
            dtsd5.addSanPham(sp11);

            // Sản phẩm 12 - độ tuổi
            sp12.addDoTuoiSuDung(dtsd1);
            sp12.addDoTuoiSuDung(dtsd2);
            sp12.addDoTuoiSuDung(dtsd3);
            sp12.addDoTuoiSuDung(dtsd4);
            sp12.addDoTuoiSuDung(dtsd5);

            dtsd1.addSanPham(sp12);
            dtsd2.addSanPham(sp12);
            dtsd3.addSanPham(sp12);
            dtsd4.addSanPham(sp12);
            dtsd5.addSanPham(sp12);

            // Sản phẩm 13 - độ tuổi
            sp13.addDoTuoiSuDung(dtsd2);
            sp13.addDoTuoiSuDung(dtsd3);
            sp13.addDoTuoiSuDung(dtsd4);
            sp13.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp13);
            dtsd3.addSanPham(sp13);
            dtsd4.addSanPham(sp13);
            dtsd5.addSanPham(sp13);

            // Sản phẩm 14 - độ tuổi
            sp14.addDoTuoiSuDung(dtsd3);
            sp14.addDoTuoiSuDung(dtsd4);
            sp14.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp14);
            dtsd4.addSanPham(sp14);
            dtsd5.addSanPham(sp14);

            // Sản phẩm 15 - độ tuổi
            sp15.addDoTuoiSuDung(dtsd2);
            sp15.addDoTuoiSuDung(dtsd3);
            sp15.addDoTuoiSuDung(dtsd4);
            sp15.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp15);
            dtsd3.addSanPham(sp15);
            dtsd4.addSanPham(sp15);
            dtsd5.addSanPham(sp15);

            // Sản phẩm 16 - độ tuổi
            sp16.addDoTuoiSuDung(dtsd2);
            sp16.addDoTuoiSuDung(dtsd3);
            sp16.addDoTuoiSuDung(dtsd4);
            sp16.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp16);
            dtsd3.addSanPham(sp16);
            dtsd4.addSanPham(sp16);
            dtsd5.addSanPham(sp16);

            // Sản phẩm 17 - độ tuổi
            sp17.addDoTuoiSuDung(dtsd3);
            sp17.addDoTuoiSuDung(dtsd4);
            sp17.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp17);
            dtsd4.addSanPham(sp17);
            dtsd5.addSanPham(sp17);

            // Sản phẩm 18 - độ tuổi
            sp18.addDoTuoiSuDung(dtsd3);
            sp18.addDoTuoiSuDung(dtsd4);
            sp18.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp18);
            dtsd4.addSanPham(sp18);
            dtsd5.addSanPham(sp18);

            // Sản phẩm 19 - độ tuổi
            sp19.addDoTuoiSuDung(dtsd3);
            sp19.addDoTuoiSuDung(dtsd4);
            sp19.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp19);
            dtsd4.addSanPham(sp19);
            dtsd5.addSanPham(sp19);

            // Sản phẩm 20 - độ tuổi
            sp20.addDoTuoiSuDung(dtsd3);
            sp20.addDoTuoiSuDung(dtsd4);
            sp20.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp20);
            dtsd4.addSanPham(sp20);
            dtsd5.addSanPham(sp20);

            // Sản phẩm 21 - độ tuổi
            sp21.addDoTuoiSuDung(dtsd2);
            sp21.addDoTuoiSuDung(dtsd3);
            sp21.addDoTuoiSuDung(dtsd4);
            sp21.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp21);
            dtsd3.addSanPham(sp21);
            dtsd4.addSanPham(sp21);
            dtsd5.addSanPham(sp21);

            // Sản phẩm 22 - độ tuổi
            sp22.addDoTuoiSuDung(dtsd2);
            sp22.addDoTuoiSuDung(dtsd3);
            sp22.addDoTuoiSuDung(dtsd4);
            sp22.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp22);
            dtsd3.addSanPham(sp22);
            dtsd4.addSanPham(sp22);
            dtsd5.addSanPham(sp22);

            // Sản phẩm 23 - độ tuổi
            sp23.addDoTuoiSuDung(dtsd2);
            sp23.addDoTuoiSuDung(dtsd3);
            sp23.addDoTuoiSuDung(dtsd4);
            sp23.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp23);
            dtsd3.addSanPham(sp23);
            dtsd4.addSanPham(sp23);
            dtsd5.addSanPham(sp23);

            // Sản phẩm 24 - độ tuổi
            sp24.addDoTuoiSuDung(dtsd2);
            sp24.addDoTuoiSuDung(dtsd3);
            sp24.addDoTuoiSuDung(dtsd4);
            sp24.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp24);
            dtsd3.addSanPham(sp24);
            dtsd4.addSanPham(sp24);
            dtsd5.addSanPham(sp24);

            // Sản phẩm 25 - độ tuổi
            sp25.addDoTuoiSuDung(dtsd3);
            sp25.addDoTuoiSuDung(dtsd4);
            sp25.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp25);
            dtsd4.addSanPham(sp25);
            dtsd5.addSanPham(sp25);

            // Sản phẩm 26 - độ tuổi
            sp26.addDoTuoiSuDung(dtsd3);
            sp26.addDoTuoiSuDung(dtsd4);
            sp26.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp26);
            dtsd4.addSanPham(sp26);
            dtsd5.addSanPham(sp26);

            // Sản phẩm 27 - độ tuổi
            sp27.addDoTuoiSuDung(dtsd3);
            sp27.addDoTuoiSuDung(dtsd4);
            sp27.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp27);
            dtsd4.addSanPham(sp27);
            dtsd5.addSanPham(sp27);

            // Sản phẩm 28 - độ tuổi
            sp28.addDoTuoiSuDung(dtsd3);
            sp28.addDoTuoiSuDung(dtsd4);
            sp28.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp28);
            dtsd4.addSanPham(sp28);
            dtsd5.addSanPham(sp28);

            // Sản phẩm 29 - độ tuổi
            sp29.addDoTuoiSuDung(dtsd2);
            sp29.addDoTuoiSuDung(dtsd3);
            sp29.addDoTuoiSuDung(dtsd4);
            sp29.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp29);
            dtsd3.addSanPham(sp29);
            dtsd4.addSanPham(sp29);
            dtsd5.addSanPham(sp29);

            // Sản phẩm 30 - độ tuổi
            sp30.addDoTuoiSuDung(dtsd2);
            sp30.addDoTuoiSuDung(dtsd3);
            sp30.addDoTuoiSuDung(dtsd4);
            sp30.addDoTuoiSuDung(dtsd5);

            dtsd2.addSanPham(sp30);
            dtsd3.addSanPham(sp30);
            dtsd4.addSanPham(sp30);
            dtsd5.addSanPham(sp30);

            // Sản phẩm 31 - độ tuổi
            sp31.addDoTuoiSuDung(dtsd3);
            sp31.addDoTuoiSuDung(dtsd4);
            sp31.addDoTuoiSuDung(dtsd5);

            dtsd3.addSanPham(sp31);
            dtsd4.addSanPham(sp31);
            dtsd5.addSanPham(sp31);

            // Sản phẩm 32 - độ tuổi
            sp32.addDoTuoiSuDung(dtsd4);
            sp32.addDoTuoiSuDung(dtsd5);

            sp32.addDoTuoiSuDung(dtsd4);
            sp32.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 33 - độ tuổi
            sp33.addDoTuoiSuDung(dtsd2);
            sp33.addDoTuoiSuDung(dtsd3);
            sp33.addDoTuoiSuDung(dtsd4);
            sp33.addDoTuoiSuDung(dtsd5);

            sp33.addDoTuoiSuDung(dtsd2);
            sp33.addDoTuoiSuDung(dtsd3);
            sp33.addDoTuoiSuDung(dtsd4);
            sp33.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 34 - độ tuổi
            sp34.addDoTuoiSuDung(dtsd2);
            sp34.addDoTuoiSuDung(dtsd3);
            sp34.addDoTuoiSuDung(dtsd4);
            sp34.addDoTuoiSuDung(dtsd5);

            sp34.addDoTuoiSuDung(dtsd2);
            sp34.addDoTuoiSuDung(dtsd3);
            sp34.addDoTuoiSuDung(dtsd4);
            sp34.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 35 - độ tuổi
            sp35.addDoTuoiSuDung(dtsd2);
            sp35.addDoTuoiSuDung(dtsd3);
            sp35.addDoTuoiSuDung(dtsd4);
            sp35.addDoTuoiSuDung(dtsd5);

            sp35.addDoTuoiSuDung(dtsd2);
            sp35.addDoTuoiSuDung(dtsd3);
            sp35.addDoTuoiSuDung(dtsd4);
            sp35.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 36 - độ tuổi
            sp36.addDoTuoiSuDung(dtsd2);
            sp36.addDoTuoiSuDung(dtsd3);
            sp36.addDoTuoiSuDung(dtsd4);
            sp36.addDoTuoiSuDung(dtsd5);

            sp36.addDoTuoiSuDung(dtsd2);
            sp36.addDoTuoiSuDung(dtsd3);
            sp36.addDoTuoiSuDung(dtsd4);
            sp36.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 37 - độ tuổi
            sp37.addDoTuoiSuDung(dtsd2);
            sp37.addDoTuoiSuDung(dtsd3);
            sp37.addDoTuoiSuDung(dtsd4);
            sp37.addDoTuoiSuDung(dtsd5);

            sp37.addDoTuoiSuDung(dtsd2);
            sp37.addDoTuoiSuDung(dtsd3);
            sp37.addDoTuoiSuDung(dtsd4);
            sp37.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 38 - độ tuổi
            sp38.addDoTuoiSuDung(dtsd3);
            sp38.addDoTuoiSuDung(dtsd4);
            sp38.addDoTuoiSuDung(dtsd5);

            sp38.addDoTuoiSuDung(dtsd3);
            sp38.addDoTuoiSuDung(dtsd4);
            sp38.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 39 - độ tuổi
            sp39.addDoTuoiSuDung(dtsd2);
            sp39.addDoTuoiSuDung(dtsd3);
            sp39.addDoTuoiSuDung(dtsd4);
            sp39.addDoTuoiSuDung(dtsd5);

            sp39.addDoTuoiSuDung(dtsd2);
            sp39.addDoTuoiSuDung(dtsd3);
            sp39.addDoTuoiSuDung(dtsd4);
            sp39.addDoTuoiSuDung(dtsd5);

            // Sản phẩm 40 - độ tuổi
            sp40.addDoTuoiSuDung(dtsd4);
            sp40.addDoTuoiSuDung(dtsd5);

            dtsd4.addSanPham(sp40);
            dtsd5.addSanPham(sp40);

            //Thêm Chi Tiết Sản Phẩm
            ChiTietSanPham ctsp1 = new ChiTietSanPham(0, 31500, 30000, dvt1, sp1);
            ChiTietSanPham ctsp2 = new ChiTietSanPham(0, 189000, 160000, dvt2, sp1);
            ChiTietSanPham ctsp3 = new ChiTietSanPham(0, 112000, 100000, dvt3, sp2);
            ChiTietSanPham ctsp4 = new ChiTietSanPham(0, 3750, 3000, dvt4, sp2);
            ChiTietSanPham ctsp5 = new ChiTietSanPham(0, 15000, 13000, dvt5, sp3);
            ChiTietSanPham ctsp6 = new ChiTietSanPham(0, 1900, 1500, dvt1, sp4);
            ChiTietSanPham ctsp7 = new ChiTietSanPham(0, 19000, 17000, dvt2, sp4);
            ChiTietSanPham ctsp8 = new ChiTietSanPham(0, 39000, 37500, dvt1, sp5);
            ChiTietSanPham ctsp9 = new ChiTietSanPham(0, 390000, 380000, dvt2, sp5);
            ChiTietSanPham ctsp10 = new ChiTietSanPham(0, 24000, 22000, dvt1, sp6);
            ChiTietSanPham ctsp11 = new ChiTietSanPham(0, 48000, 46000, dvt2, sp6);
            ChiTietSanPham ctsp12 = new ChiTietSanPham(0, 19000, 18000, dvt5, sp7);
            ChiTietSanPham ctsp13 = new ChiTietSanPham(0, 45000, 42000, dvt2, sp8);
            ChiTietSanPham ctsp14 = new ChiTietSanPham(0, 31500, 30000, dvt2, sp9);
            ChiTietSanPham ctsp15 = new ChiTietSanPham(0, 1050, 1000, dvt6, sp9);
            ChiTietSanPham ctsp16 = new ChiTietSanPham(0, 2000,1500, dvt2, sp10);
            ChiTietSanPham ctsp17 = new ChiTietSanPham(0, 60000, 55000, dvt6, sp10);
            ChiTietSanPham ctsp18 = new ChiTietSanPham(0, 3300, 3000, dvt4, sp11);
            ChiTietSanPham ctsp19 = new ChiTietSanPham(0, 66000, 60000, dvt2, sp11);
            ChiTietSanPham ctsp20 = new ChiTietSanPham(0, 60000, 55000, dvt6, sp12);
            ChiTietSanPham ctsp21 = new ChiTietSanPham(0, 119990, 100000, dvt2, sp13);
            ChiTietSanPham ctsp22 = new ChiTietSanPham(0, 6000, 5500, dvt6, sp13);
            ChiTietSanPham ctsp23 = new ChiTietSanPham(0, 148000, 140000, dvt2, sp14);
            ChiTietSanPham ctsp24 = new ChiTietSanPham(0, 37000, 30000, dvt6, sp14);
            ChiTietSanPham ctsp25 = new ChiTietSanPham(0, 53000, 50000, dvt2, sp15);
            ChiTietSanPham ctsp26 = new ChiTietSanPham(0, 4500, 4000, dvt6, sp15);
            ChiTietSanPham ctsp27 = new ChiTietSanPham(0, 112000, 100000, dvt2, sp16);
            ChiTietSanPham ctsp28 = new ChiTietSanPham(0, 2400, 2000, dvt4, sp16);
            ChiTietSanPham ctsp29 = new ChiTietSanPham(0, 500000, 450000, dvt2, sp17);
            ChiTietSanPham ctsp30 = new ChiTietSanPham(0, 25000, 20000, dvt4, sp17);
            ChiTietSanPham ctsp31 = new ChiTietSanPham(0, 95000, 90000, dvt2, sp18);
            ChiTietSanPham ctsp32 = new ChiTietSanPham(0, 19000, 15000, dvt1, sp18);
            ChiTietSanPham ctsp33 = new ChiTietSanPham(0, 95000, 90000, dvt2, sp19);
            ChiTietSanPham ctsp34 = new ChiTietSanPham(0, 15834, 10000, dvt1, sp19);
            ChiTietSanPham ctsp35 = new ChiTietSanPham(0, 115000, 100000, dvt2, sp20);
            ChiTietSanPham ctsp36 = new ChiTietSanPham(0, 100000, 80000, dvt2, sp21);
            ChiTietSanPham ctsp37 = new ChiTietSanPham(0, 120000, 110000, dvt2, sp22);
            ChiTietSanPham ctsp38 = new ChiTietSanPham(0, 145000, 12000, dvt2, sp23);
            ChiTietSanPham ctsp39 = new ChiTietSanPham(0, 210000, 200000, dvt2, sp24);
            ChiTietSanPham ctsp40 = new ChiTietSanPham(0, 155000, 145000, dvt2, sp25);
            ChiTietSanPham ctsp41 = new ChiTietSanPham(0, 75000, 60000, dvt2, sp26);
            ChiTietSanPham ctsp42 = new ChiTietSanPham(0, 100000, 90000, dvt2, sp27);
            ChiTietSanPham ctsp43 = new ChiTietSanPham(0, 90000, 70000, dvt2, sp28);
            ChiTietSanPham ctsp44 = new ChiTietSanPham(0, 125000, 12000, dvt2, sp29);
            ChiTietSanPham ctsp45 = new ChiTietSanPham(0, 200000, 180000, dvt2, sp30);
            ChiTietSanPham ctsp46 = new ChiTietSanPham(0, 225000, 220000, dvt2, sp31);
            ChiTietSanPham ctsp47 = new ChiTietSanPham(0, 185000, 160000, dvt2, sp32);
            ChiTietSanPham ctsp48 = new ChiTietSanPham(0, 150000, 130000, dvt2, sp33);
            ChiTietSanPham ctsp49 = new ChiTietSanPham(0, 200000, 190000, dvt5, sp34);
            ChiTietSanPham ctsp50 = new ChiTietSanPham(0, 85000, 60000, dvt2, sp35);
            ChiTietSanPham ctsp51 = new ChiTietSanPham(0, 120000, 110000, dvt2, sp36);
            ChiTietSanPham ctsp52 = new ChiTietSanPham(0, 170000, 160000, dvt5, sp37);
            ChiTietSanPham ctsp53 = new ChiTietSanPham(0, 65000, 55000, dvt2, sp38);
            ChiTietSanPham ctsp54 = new ChiTietSanPham(0, 100000, 95000, dvt2, sp39);
            ChiTietSanPham ctsp55 = new ChiTietSanPham(0, 150000, 135000, dvt2, sp40);

            // Thiết lập mối quan hệ giữa đơn vị tính và chi tiết sản phẩm
            // Đơn vị tính 1
            Set<ChiTietSanPham> dvt1_ctsp = new HashSet<>(Arrays.asList(ctsp1, ctsp6, ctsp8, ctsp10, ctsp32, ctsp34));
            dvt1.setCacChiTietSanPham(dvt1_ctsp);
            // Đơn vị tính 2
            Set<ChiTietSanPham> dvt2_ctsp = new HashSet<>(Arrays.asList(
                    ctsp2, ctsp7, ctsp9, ctsp11, ctsp13, ctsp14, ctsp16, ctsp19, ctsp21,
                    ctsp23, ctsp25, ctsp27, ctsp29, ctsp31, ctsp33, ctsp35, ctsp36, ctsp37, ctsp38,
                    ctsp39, ctsp40, ctsp41, ctsp42, ctsp43, ctsp44, ctsp45, ctsp46, ctsp47, ctsp48,
                    ctsp50, ctsp51, ctsp53, ctsp54, ctsp55
            ));
            dvt2.setCacChiTietSanPham(dvt2_ctsp);

            // Đơn vị tính 3
            Set<ChiTietSanPham> dvt3_ctsp = new HashSet<>(Collections.singletonList(ctsp3));
            dvt3.setCacChiTietSanPham(dvt3_ctsp);

            // Đơn vị tính 4
            Set<ChiTietSanPham> dvt4_ctsp = new HashSet<>(Arrays.asList(ctsp4, ctsp18, ctsp28, ctsp30));
            dvt4.setCacChiTietSanPham(dvt4_ctsp);

            // Đơn vị tính 5
            Set<ChiTietSanPham> dvt5_ctsp = new HashSet<>(Arrays.asList(ctsp5, ctsp12, ctsp49, ctsp52));
            dvt5.setCacChiTietSanPham(dvt5_ctsp);

            // Đơn vị tính 6
            Set<ChiTietSanPham> dvt6_ctsp = new HashSet<>(Arrays.asList(ctsp15, ctsp17, ctsp20, ctsp22, ctsp24, ctsp26));
            dvt6.setCacChiTietSanPham(dvt6_ctsp);

            // Thiết lập mối quan hệ giữa sản phẩm và chi tiết sản phẩm
            // SP1
            sp1.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp1, ctsp2)));

            // SP2
            sp2.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp3, ctsp4)));

            // SP3 (chỉ có một ctsp)
            sp3.setCacChiTietSanPham(Collections.singleton(ctsp5));

            // SP4
            sp4.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp6, ctsp7)));

            // SP5
            sp5.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp8, ctsp9)));

            // SP6
            sp6.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp10, ctsp11)));

            // SP7 (chỉ có một ctsp)
            sp7.setCacChiTietSanPham(Collections.singleton(ctsp12));

            // SP8 (chỉ có một ctsp)
            sp8.setCacChiTietSanPham(Collections.singleton(ctsp13));

            // SP9
            sp9.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp14, ctsp15)));

            // SP10
            sp10.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp16, ctsp17)));

            // SP11
            sp11.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp18, ctsp19)));

            // SP12 (chỉ có một ctsp)
            sp12.setCacChiTietSanPham(Collections.singleton(ctsp20));

            // SP13
            sp13.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp21, ctsp22)));

            // SP14
            sp14.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp23, ctsp24)));

            // SP15
            sp15.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp25, ctsp26)));

            // SP16
            sp16.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp27, ctsp28)));

            // SP17
            sp17.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp29, ctsp30)));

            // SP18
            sp18.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp31, ctsp32)));

            // SP19
            sp19.setCacChiTietSanPham(new HashSet<>(Arrays.asList(ctsp33, ctsp34)));

            // SP20 (chỉ có một ctsp)
            sp20.setCacChiTietSanPham(Collections.singleton(ctsp35));

            // SP21 (chỉ có một ctsp)
            sp21.setCacChiTietSanPham(Collections.singleton(ctsp36));

            // SP22 (chỉ có một ctsp)
            sp22.setCacChiTietSanPham(Collections.singleton(ctsp37));

            // SP23 (chỉ có một ctsp)
            sp23.setCacChiTietSanPham(Collections.singleton(ctsp38));

            // SP24 (chỉ có một ctsp)
            sp24.setCacChiTietSanPham(Collections.singleton(ctsp39));

            // SP25 (chỉ có một ctsp)
            sp25.setCacChiTietSanPham(Collections.singleton(ctsp40));

            // SP26 (chỉ có một ctsp)
            sp26.setCacChiTietSanPham(Collections.singleton(ctsp41));

            // SP27 (chỉ có một ctsp)
            sp27.setCacChiTietSanPham(Collections.singleton(ctsp42));

            // SP28 (chỉ có một ctsp)
            sp28.setCacChiTietSanPham(Collections.singleton(ctsp43));

            // SP29 (chỉ có một ctsp)
            sp29.setCacChiTietSanPham(Collections.singleton(ctsp44));

            // SP30 (chỉ có một ctsp)
            sp30.setCacChiTietSanPham(Collections.singleton(ctsp45));

            // SP31 (chỉ có một ctsp)
            sp31.setCacChiTietSanPham(Collections.singleton(ctsp46));

            // SP32 (chỉ có một ctsp)
            sp32.setCacChiTietSanPham(Collections.singleton(ctsp47));

            // SP33 (chỉ có một ctsp)
            sp33.setCacChiTietSanPham(Collections.singleton(ctsp48));

            // SP34 (chỉ có một ctsp)
            sp34.setCacChiTietSanPham(Collections.singleton(ctsp49));

            // SP35 (chỉ có một ctsp)
            sp35.setCacChiTietSanPham(Collections.singleton(ctsp50));

            // SP36 (chỉ có một ctsp)
            sp36.setCacChiTietSanPham(Collections.singleton(ctsp51));

            // SP37 (chỉ có một ctsp)
            sp37.setCacChiTietSanPham(Collections.singleton(ctsp52));

            // SP38 (chỉ có một ctsp)
            sp38.setCacChiTietSanPham(Collections.singleton(ctsp53));

            // SP39 (chỉ có một ctsp)
            sp39.setCacChiTietSanPham(Collections.singleton(ctsp54));

            // SP40 (chỉ có một ctsp)
            sp40.setCacChiTietSanPham(Collections.singleton(ctsp55));

            // Lưu danh mục - loại thuốc - sản phẩm - độ tuổi sử dụng - chi tiết sản phẩm - đơn vị tính
            new IDanhMucThuoc().insert(dm1);
            new IDanhMucThuoc().insert(dm2);

            // Thêm Nhân Viên
            NhanVien nv1 = new NhanVien("Nguyễn Văn A", "0987654321", "nguyenvana@gmail.com", ChucVu.NHAN_VIEN);
            NhanVien nv2 = new NhanVien("Trần Thị B", "0981112222", "tranthib@gmail.com", ChucVu.NHAN_VIEN);
            NhanVien nv3 = new NhanVien("Lê Văn C", "0911223344", "levanc@gmail.com", ChucVu.NHAN_VIEN);
            NhanVien nv4 = new NhanVien("Phạm Thị D", "0909988776", "phamthid@gmail.com", ChucVu.QUAN_LY);

            // Thêm Tài Khoản Nhân Viên
            TKNhanVien tknv1 = new TKNhanVien("nv01",new MaHoaMatKhau().toSHA1("nv01"),nv1);
            TKNhanVien tknv2 = new TKNhanVien("nv02",new MaHoaMatKhau().toSHA1("nv02"),nv2);
            TKNhanVien tknv3 = new TKNhanVien("nv03",new MaHoaMatKhau().toSHA1("nv03"),nv3);
            TKNhanVien tknv4 = new TKNhanVien("nv04",new MaHoaMatKhau().toSHA1("nv04"),nv4);

            new ITKNhanVien().insert(tknv1);
            new ITKNhanVien().insert(tknv2);
            new ITKNhanVien().insert(tknv3);
            new ITKNhanVien().insert(tknv4);

            // Thêm Nhập Hàng
            NhapHang nh = new NhapHang(new Date(System.currentTimeMillis()), true, nv4);

            // Thêm chi tiết nhập hàng
            ChiTietNhapHang ctnh1 = new ChiTietNhapHang(ctsp1, 100, new ChiTietNhapHang().totalPrice(100, ctsp1), nh);
            ChiTietNhapHang ctnh2 = new ChiTietNhapHang(ctsp2, 100, new ChiTietNhapHang().totalPrice(100, ctsp2), nh);
            ChiTietNhapHang ctnh3 = new ChiTietNhapHang(ctsp3, 100, new ChiTietNhapHang().totalPrice(100, ctsp3), nh);
            ChiTietNhapHang ctnh4 = new ChiTietNhapHang(ctsp4, 100, new ChiTietNhapHang().totalPrice(100, ctsp4), nh);
            ChiTietNhapHang ctnh5 = new ChiTietNhapHang(ctsp5, 100, new ChiTietNhapHang().totalPrice(100, ctsp5), nh);
            ChiTietNhapHang ctnh6 = new ChiTietNhapHang(ctsp6, 100, new ChiTietNhapHang().totalPrice(100, ctsp6), nh);
            ChiTietNhapHang ctnh7 = new ChiTietNhapHang(ctsp7, 100, new ChiTietNhapHang().totalPrice(100, ctsp7), nh);
            ChiTietNhapHang ctnh8 = new ChiTietNhapHang(ctsp8, 100, new ChiTietNhapHang().totalPrice(100, ctsp8), nh);
            ChiTietNhapHang ctnh9 = new ChiTietNhapHang(ctsp9, 100, new ChiTietNhapHang().totalPrice(100, ctsp9), nh);
            ChiTietNhapHang ctnh10 = new ChiTietNhapHang(ctsp10, 100, new ChiTietNhapHang().totalPrice(100, ctsp10), nh);
            ChiTietNhapHang ctnh11 = new ChiTietNhapHang(ctsp11, 100, new ChiTietNhapHang().totalPrice(100, ctsp11), nh);
            ChiTietNhapHang ctnh12 = new ChiTietNhapHang(ctsp12, 100, new ChiTietNhapHang().totalPrice(100, ctsp12), nh);
            ChiTietNhapHang ctnh13 = new ChiTietNhapHang(ctsp13, 100, new ChiTietNhapHang().totalPrice(100, ctsp13), nh);
            ChiTietNhapHang ctnh14 = new ChiTietNhapHang(ctsp14, 100, new ChiTietNhapHang().totalPrice(100, ctsp14), nh);
            ChiTietNhapHang ctnh15 = new ChiTietNhapHang(ctsp15, 100, new ChiTietNhapHang().totalPrice(100, ctsp15), nh);
            ChiTietNhapHang ctnh16 = new ChiTietNhapHang(ctsp16, 100, new ChiTietNhapHang().totalPrice(100, ctsp16), nh);
            ChiTietNhapHang ctnh17 = new ChiTietNhapHang(ctsp17, 100, new ChiTietNhapHang().totalPrice(100, ctsp17), nh);
            ChiTietNhapHang ctnh18 = new ChiTietNhapHang(ctsp18, 100, new ChiTietNhapHang().totalPrice(100, ctsp18), nh);
            ChiTietNhapHang ctnh19 = new ChiTietNhapHang(ctsp19, 100, new ChiTietNhapHang().totalPrice(100, ctsp19), nh);
            ChiTietNhapHang ctnh20 = new ChiTietNhapHang(ctsp20, 100, new ChiTietNhapHang().totalPrice(100, ctsp20), nh);
            ChiTietNhapHang ctnh21 = new ChiTietNhapHang(ctsp21, 100, new ChiTietNhapHang().totalPrice(100, ctsp21), nh);
            ChiTietNhapHang ctnh22 = new ChiTietNhapHang(ctsp22, 100, new ChiTietNhapHang().totalPrice(100, ctsp22), nh);
            ChiTietNhapHang ctnh23 = new ChiTietNhapHang(ctsp23, 100, new ChiTietNhapHang().totalPrice(100, ctsp23), nh);
            ChiTietNhapHang ctnh24 = new ChiTietNhapHang(ctsp24, 100, new ChiTietNhapHang().totalPrice(100, ctsp24), nh);
            ChiTietNhapHang ctnh25 = new ChiTietNhapHang(ctsp25, 100, new ChiTietNhapHang().totalPrice(100, ctsp25), nh);
            ChiTietNhapHang ctnh26 = new ChiTietNhapHang(ctsp26, 100, new ChiTietNhapHang().totalPrice(100, ctsp26), nh);
            ChiTietNhapHang ctnh27 = new ChiTietNhapHang(ctsp27, 100, new ChiTietNhapHang().totalPrice(100, ctsp27), nh);
            ChiTietNhapHang ctnh28 = new ChiTietNhapHang(ctsp28, 100, new ChiTietNhapHang().totalPrice(100, ctsp28), nh);
            ChiTietNhapHang ctnh29 = new ChiTietNhapHang(ctsp29, 100, new ChiTietNhapHang().totalPrice(100, ctsp29), nh);
            ChiTietNhapHang ctnh30 = new ChiTietNhapHang(ctsp30, 100, new ChiTietNhapHang().totalPrice(100, ctsp30), nh);
            ChiTietNhapHang ctnh31 = new ChiTietNhapHang(ctsp31, 100, new ChiTietNhapHang().totalPrice(100, ctsp31), nh);
            ChiTietNhapHang ctnh32 = new ChiTietNhapHang(ctsp32, 100, new ChiTietNhapHang().totalPrice(100, ctsp32), nh);
            ChiTietNhapHang ctnh33 = new ChiTietNhapHang(ctsp33, 100, new ChiTietNhapHang().totalPrice(100, ctsp33), nh);
            ChiTietNhapHang ctnh34 = new ChiTietNhapHang(ctsp34, 100, new ChiTietNhapHang().totalPrice(100, ctsp34), nh);
            ChiTietNhapHang ctnh35 = new ChiTietNhapHang(ctsp35, 100, new ChiTietNhapHang().totalPrice(100, ctsp35), nh);
            ChiTietNhapHang ctnh36 = new ChiTietNhapHang(ctsp36, 100, new ChiTietNhapHang().totalPrice(100, ctsp36), nh);
            ChiTietNhapHang ctnh37 = new ChiTietNhapHang(ctsp37, 100, new ChiTietNhapHang().totalPrice(100, ctsp37), nh);
            ChiTietNhapHang ctnh38 = new ChiTietNhapHang(ctsp38, 100, new ChiTietNhapHang().totalPrice(100, ctsp38), nh);
            ChiTietNhapHang ctnh39 = new ChiTietNhapHang(ctsp39, 100, new ChiTietNhapHang().totalPrice(100, ctsp39), nh);
            ChiTietNhapHang ctnh40 = new ChiTietNhapHang(ctsp40, 100, new ChiTietNhapHang().totalPrice(100, ctsp40), nh);
            ChiTietNhapHang ctnh41 = new ChiTietNhapHang(ctsp41, 100, new ChiTietNhapHang().totalPrice(100, ctsp41), nh);
            ChiTietNhapHang ctnh42 = new ChiTietNhapHang(ctsp42, 100, new ChiTietNhapHang().totalPrice(100, ctsp42), nh);
            ChiTietNhapHang ctnh43 = new ChiTietNhapHang(ctsp43, 100, new ChiTietNhapHang().totalPrice(100, ctsp43), nh);
            ChiTietNhapHang ctnh44 = new ChiTietNhapHang(ctsp44, 100, new ChiTietNhapHang().totalPrice(100, ctsp44), nh);
            ChiTietNhapHang ctnh45 = new ChiTietNhapHang(ctsp45, 100, new ChiTietNhapHang().totalPrice(100, ctsp45), nh);
            ChiTietNhapHang ctnh46 = new ChiTietNhapHang(ctsp46, 100, new ChiTietNhapHang().totalPrice(100, ctsp46), nh);
            ChiTietNhapHang ctnh47 = new ChiTietNhapHang(ctsp47, 100, new ChiTietNhapHang().totalPrice(100, ctsp47), nh);
            ChiTietNhapHang ctnh48 = new ChiTietNhapHang(ctsp48, 100, new ChiTietNhapHang().totalPrice(100, ctsp48), nh);
            ChiTietNhapHang ctnh49 = new ChiTietNhapHang(ctsp49, 100, new ChiTietNhapHang().totalPrice(100, ctsp49), nh);
            ChiTietNhapHang ctnh50 = new ChiTietNhapHang(ctsp50, 100, new ChiTietNhapHang().totalPrice(100, ctsp50), nh);
            ChiTietNhapHang ctnh51 = new ChiTietNhapHang(ctsp51, 100, new ChiTietNhapHang().totalPrice(100, ctsp51), nh);
            ChiTietNhapHang ctnh52 = new ChiTietNhapHang(ctsp52, 100, new ChiTietNhapHang().totalPrice(100, ctsp52), nh);
            ChiTietNhapHang ctnh53 = new ChiTietNhapHang(ctsp53, 100, new ChiTietNhapHang().totalPrice(100, ctsp53), nh);
            ChiTietNhapHang ctnh54 = new ChiTietNhapHang(ctsp54, 100, new ChiTietNhapHang().totalPrice(100, ctsp54), nh);
            ChiTietNhapHang ctnh55 = new ChiTietNhapHang(ctsp55, 100, new ChiTietNhapHang().totalPrice(100, ctsp55), nh);

            Set<ChiTietNhapHang> nh_ChiTietNhapHang = new HashSet<>(Arrays.asList(
                    ctnh1, ctnh2, ctnh3, ctnh4, ctnh5, ctnh6, ctnh7, ctnh8, ctnh9, ctnh10,
                    ctnh11, ctnh12, ctnh13, ctnh14, ctnh15, ctnh16, ctnh17, ctnh18, ctnh19, ctnh20,
                    ctnh21, ctnh22, ctnh23, ctnh24, ctnh25, ctnh26, ctnh27, ctnh28, ctnh29, ctnh30,
                    ctnh31, ctnh32, ctnh33, ctnh34, ctnh35, ctnh36, ctnh37, ctnh38, ctnh39, ctnh40,
                    ctnh41, ctnh42, ctnh43, ctnh44, ctnh45, ctnh46, ctnh47, ctnh48, ctnh49, ctnh50,
                    ctnh51, ctnh52, ctnh53, ctnh54, ctnh55
            ));

            nh.setDanhSachSanPham(nh_ChiTietNhapHang);


            // Cập nhật số lượng trong từng ChiTietSanPham
            for (ChiTietNhapHang chiTietNhapHang : nh_ChiTietNhapHang) {
                ChiTietSanPham ctsp = chiTietNhapHang.getSanPham(); // Lấy ChiTietSanPham từ ChiTietNhapHang
                int soLuongHienTai = ctsp.getSoLuongSanPhamTrongKho(); // Số lượng hiện tại của sản phẩm
                int soLuongNhap = chiTietNhapHang.getsoLuongNhap(); // Số lượng nhập từ ChiTietNhapHang

                // Cập nhật số lượng mới
                ctsp.setSoLuongSanPhamTrongKho(soLuongHienTai + soLuongNhap);

                // Gọi DAO để cập nhật thông tin sản phẩm vào DB
                new IChiTietSanPham().update(ctsp);
            }

            new INhapHang().insert(nh);

            // Thêm Admin
            Admin ad1 = new Admin("admin01","0935946471","admin01@gmail.com");
            Admin ad2 = new Admin("admin02","0934072465","admin02@gmail.com");
            // Thêm TKAdmin
            TKAdmin tkAdmin1 = new TKAdmin("tk01",new MaHoaMatKhau().toSHA1("admin01"), ad1);
            TKAdmin tkAdmin2 = new TKAdmin("tk02",new MaHoaMatKhau().toSHA1("admin02"), ad2);

            new ITKAdmin().insert(tkAdmin1);
            new ITKAdmin().insert(tkAdmin2);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}