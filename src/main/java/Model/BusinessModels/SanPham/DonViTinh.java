package Model.BusinessModels.SanPham;

import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPham;
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

    public DonViTinh(int id, String tenDonViTinh, Set<ChiTietSanPham> cacChiTietSanPham) {
        this.id = id;
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
}
