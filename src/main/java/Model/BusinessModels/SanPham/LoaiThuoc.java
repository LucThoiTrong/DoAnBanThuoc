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

    @OneToMany(mappedBy = "loaiThuoc", cascade = CascadeType.ALL)
    private Set<SanPham> danhSachSanPham = new HashSet<>();

    public LoaiThuoc(String tenLoaiThuoc, DanhMucThuoc danhMucThuoc) {
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

    public Set<SanPham> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Set<SanPham> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }

    public void addSanPham(SanPham sanPham) {
        danhSachSanPham.add(sanPham);
    }
    public void removeSanPham(SanPham sanPham) {
        danhSachSanPham.remove(sanPham);
    }
}
