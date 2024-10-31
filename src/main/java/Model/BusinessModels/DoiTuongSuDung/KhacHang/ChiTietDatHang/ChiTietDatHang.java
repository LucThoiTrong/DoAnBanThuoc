package Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;
import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "ChiTietDatHang")
public class ChiTietDatHang implements Serializable {
    @EmbeddedId
    private ChiTietDatHangID id;
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
    @MapsId("DatHangID")
    @JoinColumn(name = "DatHangID")
    private DatHang datHang;

    public ChiTietDatHang() {}

    public ChiTietDatHang(ChiTietDatHangID id, ChiTietSanPham sanPham, int soLuongMua, double tongGiaTien, DatHang datHang) {
        this.id = id;
        this.sanPham = sanPham;
        this.soLuongMua = soLuongMua;
        this.tongGiaTien = tongGiaTien;
        this.datHang = datHang;
    }

    public ChiTietDatHangID getId() {
        return id;
    }

    public void setId(ChiTietDatHangID id) {
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

    public DatHang getDatHang() {
        return datHang;
    }

    public void setDatHang(DatHang datHang) {
        this.datHang = datHang;
    }
}
