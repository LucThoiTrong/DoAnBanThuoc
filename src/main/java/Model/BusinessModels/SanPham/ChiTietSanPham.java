package Model.BusinessModels.SanPham;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class ChiTietSanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int soLuongSanPhamTrongKho;
    private double giaBan;
    private double giaNhap;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "DonViTinhID")
    private DonViTinh donViTinh;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "SanPhamID")
    private SanPham sanPham;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietNhapHang> chiTietNhapHang = new HashSet<>();

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietDatHang> chiTietDatHang = new HashSet<>();

    public ChiTietSanPham() {}

    public ChiTietSanPham(int soLuongSanPhamTrongKho, double giaBan, double giaNhap, DonViTinh donViTinh, SanPham sanPham) {
        this.soLuongSanPhamTrongKho = soLuongSanPhamTrongKho;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
        this.donViTinh = donViTinh;
        this.sanPham = sanPham;
    }

    public ChiTietSanPham(int soLuongSanPhamTrongKho, double giaBan, double giaNhap, DonViTinh donViTinh, SanPham sanPham, Set<ChiTietNhapHang> chiTietNhapHang, Set<ChiTietDatHang> chiTietDatHang) {
        this.soLuongSanPhamTrongKho = soLuongSanPhamTrongKho;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
        this.donViTinh = donViTinh;
        this.sanPham = sanPham;
        this.chiTietNhapHang = chiTietNhapHang;
        this.chiTietDatHang = chiTietDatHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuongSanPhamTrongKho() {
        return soLuongSanPhamTrongKho;
    }

    public void setSoLuongSanPhamTrongKho(int soLuongSanPhamTrongKho) {
        this.soLuongSanPhamTrongKho = soLuongSanPhamTrongKho;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }

    public double getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(double giaNhap) {
        this.giaNhap = giaNhap;
    }

    public DonViTinh getDonViTinh() {
        return donViTinh;
    }

    public void setDonViTinh(DonViTinh donViTinh) {
        this.donViTinh = donViTinh;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public Set<ChiTietNhapHang> getChiTietNhapHang() {
        return chiTietNhapHang;
    }

    public void setChiTietNhapHang(Set<ChiTietNhapHang> chiTietNhapHang) {
        this.chiTietNhapHang = chiTietNhapHang;
    }

    public Set<ChiTietDatHang> getChiTietDatHang() {
        return chiTietDatHang;
    }

    public void setChiTietDatHang(Set<ChiTietDatHang> chiTietDatHang) {
        this.chiTietDatHang = chiTietDatHang;
    }

}
