package Model.BusinessModels.DoiTuongSuDung.NhanVien;

import jakarta.persistence.*;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
public class NhapHang implements Serializable {
    @Id
    @Column(name = "NhapHangID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date ngayDatHang;
    @OneToMany(mappedBy = "nhapHang", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ChiTietNhapHang> danhSachSanPham = new HashSet<>();
    private boolean trangThaiDonHang;
    @ManyToOne
    private NhanVien nhanVien;
    public NhapHang() {}

    public NhapHang(Date ngayDatHang, boolean trangThaiDonHang, NhanVien nhanVien) {
        this.ngayDatHang = ngayDatHang;
        this.trangThaiDonHang = trangThaiDonHang;
        this.nhanVien = nhanVien;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public Set<ChiTietNhapHang> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Set<ChiTietNhapHang> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }

    public boolean isTrangThaiDonHang() {
        return trangThaiDonHang;
    }

    public void setTrangThaiDonHang(boolean trangThaiDonHang) {
        this.trangThaiDonHang = trangThaiDonHang;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }
}
