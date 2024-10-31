package Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhapHang;
import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "ChiTietNhapHang")
public class ChiTietNhapHang implements Serializable {
    @EmbeddedId
    private ChiTietNhapHangID id;
    @ManyToOne
    @MapsId("ChiTietSanPhamID")
    @JoinColumns({
            @JoinColumn(name="SanPhamID", referencedColumnName = "SanPhamID"),
            @JoinColumn(name = "DonViTinhID", referencedColumnName = "DonViTinhID")
    })
    private ChiTietSanPham sanPham;
    private int soLuongMua;
    private double tongGiaTien;

    @ManyToOne
    @MapsId("NhapHangID")
    @JoinColumn(name = "NhapHangID", referencedColumnName = "NhapHangID")
    private NhapHang nhapHang;

    public ChiTietNhapHang() {}

    public ChiTietNhapHang(ChiTietNhapHangID id, ChiTietSanPham sanPham, int soLuongMua, double tongGiaTien, NhapHang nhapHang) {
        this.id = id;
        this.sanPham = sanPham;
        this.soLuongMua = soLuongMua;
        this.tongGiaTien = tongGiaTien;
        this.nhapHang = nhapHang;
    }

    public ChiTietNhapHangID getId() {
        return id;
    }

    public void setId(ChiTietNhapHangID id) {
        this.id = id;
    }

    public ChiTietSanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(ChiTietSanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuongMua() {
        return soLuongMua;
    }

    public void setSoLuongMua(int soLuongMua) {
        this.soLuongMua = soLuongMua;
    }

    public double getTongGiaTien() {
        return tongGiaTien;
    }

    public void setTongGiaTien(double tongGiaTien) {
        this.tongGiaTien = tongGiaTien;
    }

    public NhapHang getNhapHang() {
        return nhapHang;
    }

    public void setNhapHang(NhapHang nhapHang) {
        this.nhapHang = nhapHang;
    }
}
