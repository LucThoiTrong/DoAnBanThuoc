package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class DonViTinh implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DonViTinhID")
    private int id;
    private String tenDonViTinh;

    @OneToMany(mappedBy = "donViTinh")
    private Set<ChiTietSanPham> cacChiTietSanPham = new HashSet<>();

    public DonViTinh() {}

    public DonViTinh(String tenDonViTinh) {
        this.tenDonViTinh = tenDonViTinh;
    }

    public DonViTinh(String tenDonViTinh, Set<ChiTietSanPham> cacChiTietSanPham) {
        this.tenDonViTinh = tenDonViTinh;
        this.cacChiTietSanPham = cacChiTietSanPham;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDonViTinh() {
        return tenDonViTinh;
    }

    public void setTenDonViTinh(String tenDonViTinh) {
        this.tenDonViTinh = tenDonViTinh;
    }

    public Set<ChiTietSanPham> getCacChiTietSanPham() {
        return cacChiTietSanPham;
    }

    public void setCacChiTietSanPham(Set<ChiTietSanPham> cacChiTietSanPham) {
        this.cacChiTietSanPham = cacChiTietSanPham;
    }

    public void addChiTietSanPham(ChiTietSanPham chiTietSanPham){
        this.cacChiTietSanPham.add(chiTietSanPham);
    }

    public void removeChiTietSanPham(ChiTietSanPham chiTietSanPham){
        this.cacChiTietSanPham.remove(chiTietSanPham);
    }
}
