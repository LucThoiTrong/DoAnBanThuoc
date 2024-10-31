package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import Model.BusinessModels.DoiTuongSuDung.DoiTuongSuDung;
import Model.BusinessModels.SanPham.DanhGia;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

import java.util.HashSet;
import java.util.Set;

@Entity
public class KhachHang extends DoiTuongSuDung {
    @OneToMany(mappedBy = "khachHang", cascade = CascadeType.ALL)
    private Set<DatHang> lichSuDatHang = new HashSet<>();

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private Set<DanhGia> lichSuDanhGia = new HashSet<>();

    public KhachHang() {
        super();
    }

    public KhachHang(int id, String ten, String soDienThoai, String diaChi, Set<DatHang> lichSuDatHang, Set<DanhGia> lichSuDanhGia) {
        super(id, ten, soDienThoai, diaChi);
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
}
