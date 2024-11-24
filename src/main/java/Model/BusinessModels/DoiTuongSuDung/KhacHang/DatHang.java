package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import Model.BusinessModels.Enum.PhuongThucThanhToan;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import jakarta.persistence.*;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
public class DatHang implements Serializable {
    @Id
    private String id;
    private Date ngayDatHang;

    @Enumerated(EnumType.STRING)
    private PhuongThucThanhToan phuongThucThanhToan;

    @Enumerated(EnumType.STRING)
    private TrangThaiDatHang trangThaiDatHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "KhachHangID")
    private KhachHang khachHang;

    @OneToMany(mappedBy = "datHang", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ChiTietDatHang> danhSachSanPham = new HashSet<>();

    @OneToMany(mappedBy = "datHang", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<AnhDonThuoc> danhSachAnhDonThuoc = new HashSet<>();

    public DatHang() {}

    public DatHang(String id, Date ngayDatHang, PhuongThucThanhToan phuongThucThanhToan, TrangThaiDatHang trangThaiDatHang, KhachHang khachHang, Set<ChiTietDatHang> danhSachSanPham) {
        this.id = id;
        this.ngayDatHang = ngayDatHang;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.trangThaiDatHang = trangThaiDatHang;
        this.khachHang = khachHang;
        this.danhSachSanPham = danhSachSanPham;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public PhuongThucThanhToan getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(PhuongThucThanhToan phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public TrangThaiDatHang getTrangThaiDatHang() {
        return trangThaiDatHang;
    }

    public void setTrangThaiDatHang(TrangThaiDatHang trangThaiDatHang) {
        this.trangThaiDatHang = trangThaiDatHang;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public Set<ChiTietDatHang> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Set<ChiTietDatHang> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }
}
