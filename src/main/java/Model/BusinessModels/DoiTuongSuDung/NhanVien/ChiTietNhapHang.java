package Model.BusinessModels.DoiTuongSuDung.NhanVien;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
//@Table(name = "ChiTietNhapHang")
public class ChiTietNhapHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "CTSPID")
    private ChiTietSanPham sanPham;
    private int soLuongNhap;
    private double tongGiaTien;

    @ManyToOne
    @JoinColumn(name = "NhapHangID")
    private NhapHang nhapHang;

    public ChiTietNhapHang() {}

    public ChiTietNhapHang(ChiTietSanPham sanPham, int soLuongNhap, double tongGiaTien, NhapHang nhapHang) {
        this.sanPham = sanPham;
        this.soLuongNhap = soLuongNhap;
        this.tongGiaTien = tongGiaTien;
        this.nhapHang = nhapHang;
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

    public int getsoLuongNhap() {
        return soLuongNhap;
    }

    public void setsoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
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

    public double totalPrice(int soLuongNhap, ChiTietSanPham sanPham) {
        return soLuongNhap * sanPham.getGiaNhap();
    }
}
