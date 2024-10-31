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

    @OneToMany(mappedBy = "danhMucThuoc")
    private Set<LoaiThuoc>  danhSachLoaiThuoc = new HashSet<>();

    public DanhMucThuoc() {}

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
}
