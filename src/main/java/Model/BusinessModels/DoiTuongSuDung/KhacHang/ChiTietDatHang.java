package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
//@Table(name = "ChiTietDatHang")
public class ChiTietDatHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "CTSPID")
    private ChiTietSanPham sanPham;
    private int soLuongMua;
    private double tongGiaTien;

    @ManyToOne
    @JoinColumn(name = "DatHangID")
    private DatHang datHang;

    public ChiTietDatHang() {}

    public ChiTietDatHang(ChiTietSanPham sanPham, int soLuongMua) {
        this.sanPham = sanPham;
        this.soLuongMua = soLuongMua;
    }

    public ChiTietDatHang(ChiTietSanPham sanPham, double tongGiaTien, DatHang datHang) {
        this.sanPham = sanPham;
        this.soLuongMua = 1;
        this.tongGiaTien = tongGiaTien;
        this.datHang = datHang;
    }

    public ChiTietDatHang(int id, ChiTietSanPham sanPham, int soLuongMua, double tongGiaTien, DatHang datHang) {
        this.id = id;
        this.sanPham = sanPham;
        this.soLuongMua = soLuongMua;
        this.tongGiaTien = tongGiaTien;
        this.datHang = datHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public double tongGiaTien(int soLuongMua, ChiTietSanPham sanPham) {
        return soLuongMua*sanPham.getGiaBan();
    }
}
