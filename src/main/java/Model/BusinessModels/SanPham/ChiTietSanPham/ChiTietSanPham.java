package Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang.ChiTietDatHang;
import Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang.ChiTietNhapHang;
import Model.BusinessModels.SanPham.DonViTinh;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class ChiTietSanPham implements Serializable {
    @EmbeddedId
    private ChiTietSanPhamID id;
    private int soLuongSanPhamTrongKho;
    private double giaBan;
    private double giaNhap;

    @ManyToOne
    @MapsId("DonViTinhID")
    @JoinColumn(name = "DonViTinhID", referencedColumnName = "DonViTinhID")
    private DonViTinh donViTinh;

    @ManyToOne
    @MapsId("SanPhamID")
    @JoinColumn(name = "SanPhamID", referencedColumnName = "SanPhamID")
    private SanPham sanPham;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ChiTietNhapHang> chiTietNhapHang = new HashSet<>();

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ChiTietDatHang> chiTietDatHang = new HashSet<>();

    public ChiTietSanPham() {}

    public ChiTietSanPham(ChiTietSanPhamID id, int soLuongSanPhamTrongKho, double giaBan, double giaNhap, DonViTinh donViTinh, SanPham sanPham, Set<ChiTietNhapHang> chiTietNhapHang, Set<ChiTietDatHang> chiTietDatHang) {
        this.id = id;
        this.soLuongSanPhamTrongKho = soLuongSanPhamTrongKho;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
        this.donViTinh = donViTinh;
        this.sanPham = sanPham;
        this.chiTietNhapHang = chiTietNhapHang;
        this.chiTietDatHang = chiTietDatHang;
    }

    public ChiTietSanPhamID getId() {
        return id;
    }

    public void setId(ChiTietSanPhamID id) {
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
