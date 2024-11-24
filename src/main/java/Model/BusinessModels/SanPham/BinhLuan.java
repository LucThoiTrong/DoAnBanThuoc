package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

@Entity
public class BinhLuan implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int idNguoiDung;
    private Date ngayBinhLuan;
    private Time thoiGianBinhLuan;

    @ManyToOne
    @JoinColumn(name = "DanhGiaID")
    private DanhGia danhGia;

    public BinhLuan() {}

    public BinhLuan(int id, int idNguoiDung, Date ngayBinhLuan, Time thoiGianBinhLuan, DanhGia danhGia) {
        this.id = id;
        this.idNguoiDung = idNguoiDung;
        this.ngayBinhLuan = ngayBinhLuan;
        this.thoiGianBinhLuan = thoiGianBinhLuan;
        this.danhGia = danhGia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }

    public Date getNgayBinhLuan() {
        return ngayBinhLuan;
    }

    public void setNgayBinhLuan(Date ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }

    public Time getThoiGianBinhLuan() {
        return thoiGianBinhLuan;
    }

    public void setThoiGianBinhLuan(Time thoiGianBinhLuan) {
        this.thoiGianBinhLuan = thoiGianBinhLuan;
    }

    public DanhGia getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(DanhGia danhGia) {
        this.danhGia = danhGia;
    }
}
