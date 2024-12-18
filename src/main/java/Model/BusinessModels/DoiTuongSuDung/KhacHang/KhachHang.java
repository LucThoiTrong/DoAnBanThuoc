package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import Model.BusinessModels.DoiTuongSuDung.DoiTuongSuDung;
import Model.BusinessModels.SanPham.DanhGia;
import Model.DatabaseModels.IKhachHang;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

@Entity
public class KhachHang extends DoiTuongSuDung {
    @OneToMany(mappedBy = "khachHang", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<DatHang> lichSuDatHang = new HashSet<>();

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.EAGER)
    private Set<DanhGia> lichSuDanhGia = new HashSet<>();

    public KhachHang() {
        super();
    }

    public KhachHang(String ten, String soDienThoai, String email) {
        super(ten, soDienThoai, email);
    }

    public KhachHang(String ten, String soDienThoai, String email, Set<DatHang> lichSuDatHang, Set<DanhGia> lichSuDanhGia) {
        super(ten, soDienThoai, email);
        this.lichSuDatHang = lichSuDatHang;
        this.lichSuDanhGia = lichSuDanhGia;
    }

    public Set<DatHang> getLichSuDatHang() {
        return lichSuDatHang;
    }

    public void setLichSuDatHang(Set<DatHang> lichSuDatHang) {
        this.lichSuDatHang = lichSuDatHang;
    }

    public Set<DanhGia> getLichSuDanhGia() {
        return lichSuDanhGia;
    }

    public void setLichSuDanhGia(Set<DanhGia> lichSuDanhGia) {
        this.lichSuDanhGia = lichSuDanhGia;
    }

    public boolean ThemKhachHang(KhachHang khachHang){
        try {
            IKhachHang iKhachHang = new IKhachHang();
            iKhachHang.insert(khachHang);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    // Lấy lịch sử đặt hàng cuối cùng
    public DatHang getLastOrder() {
        return lichSuDatHang.stream()
                .max(Comparator.comparingInt(DatHang::getId)) // so sánh theo id
                .orElse(null);
    }

    // Thêm đặt hàng
    public void addDatHang(DatHang datHang){
        this.lichSuDatHang.add(datHang);
    }
}
