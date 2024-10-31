package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class LoaiThuoc implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String tenLoaiThuoc;

    @ManyToOne
    @JoinColumn(name = "DanhMucThuocID")
    private DanhMucThuoc danhMucThuoc;
    public LoaiThuoc() {}

    @OneToMany(mappedBy = "loaiThuoc")
    private Set<SanPham> danhSachSanPham = new HashSet<>();

    public LoaiThuoc(int id, String tenLoaiThuoc, DanhMucThuoc danhMucThuoc) {
        this.id = id;
        this.tenLoaiThuoc = tenLoaiThuoc;
        this.danhMucThuoc = danhMucThuoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenLoaiThuoc() {
        return tenLoaiThuoc;
    }

    public void setTenLoaiThuoc(String tenLoaiThuoc) {
        this.tenLoaiThuoc = tenLoaiThuoc;
    }

    public DanhMucThuoc getDanhMucThuoc() {
        return danhMucThuoc;
    }

    public void setDanhMucThuoc(DanhMucThuoc danhMucThuoc) {
        this.danhMucThuoc = danhMucThuoc;
    }
}
