package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class DanhMucThuoc implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String tenDanhMucThuoc;

    @OneToMany(mappedBy = "danhMucThuoc", cascade = CascadeType.ALL)
    private Set<LoaiThuoc>  danhSachLoaiThuoc = new HashSet<>();

    public DanhMucThuoc() {}

    public DanhMucThuoc(String tenDanhMucThuoc) {
        this.tenDanhMucThuoc = tenDanhMucThuoc;
    }

    public DanhMucThuoc(String tenDanhMucThuoc, Set<LoaiThuoc> danhSachLoaiThuoc) {
        this.tenDanhMucThuoc = tenDanhMucThuoc;
        this.danhSachLoaiThuoc = danhSachLoaiThuoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDanhMucThuoc() {
        return tenDanhMucThuoc;
    }

    public void setTenDanhMucThuoc(String tenDanhMucThuoc) {
        this.tenDanhMucThuoc = tenDanhMucThuoc;
    }

    public Set<LoaiThuoc> getDanhSachLoaiThuoc() {
        return danhSachLoaiThuoc;
    }

    public void setDanhSachLoaiThuoc(Set<LoaiThuoc> danhSachLoaiThuoc) {
        this.danhSachLoaiThuoc = danhSachLoaiThuoc;
    }

    public void addLoaiThuoc(LoaiThuoc loaiThuoc) {
        this.danhSachLoaiThuoc.add(loaiThuoc);
    }

    public void removeThemLoaiThuoc(LoaiThuoc loaiThuoc) {
        this.danhSachLoaiThuoc.remove(loaiThuoc);
    }
}
