package Model.BusinessModels.SanPham;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import jakarta.persistence.*;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

@Entity
public class DanhGia implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String noiDungDanhGia;
    private Date ngayDanhGia;
    private Time thoiGianDanhGia;
    private int diemDanhGia;

    @ManyToOne
    @JoinColumn(name = "KhachHangID")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "SanPhamID")
    private SanPham sanPham;

    public DanhGia() {}

    public DanhGia(Long id, String noiDungDanhGia, Date ngayDanhGia, Time thoiGianDanhGia, int diemDanhGia, KhachHang khachHang, SanPham sanPham) {
        this.id = id;
        this.noiDungDanhGia = noiDungDanhGia;
        this.ngayDanhGia = ngayDanhGia;
        this.thoiGianDanhGia = thoiGianDanhGia;
        this.diemDanhGia = diemDanhGia;
        this.khachHang = khachHang;
        this.sanPham = sanPham;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNoiDungDanhGia() {
        return noiDungDanhGia;
    }

    public void setNoiDungDanhGia(String noiDungDanhGia) {
        this.noiDungDanhGia = noiDungDanhGia;
    }

    public Date getNgayDanhGia() {
        return ngayDanhGia;
    }

    public void setNgayDanhGia(Date ngayDanhGia) {
        this.ngayDanhGia = ngayDanhGia;
    }

    public Time getThoiGianDanhGia() {
        return thoiGianDanhGia;
    }

    public void setThoiGianDanhGia(Time thoiGianDanhGia) {
        this.thoiGianDanhGia = thoiGianDanhGia;
    }

    public int getDiemDanhGia() {
        return diemDanhGia;
    }

    public void setDiemDanhGia(int diemDanhGia) {
        this.diemDanhGia = diemDanhGia;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
}
