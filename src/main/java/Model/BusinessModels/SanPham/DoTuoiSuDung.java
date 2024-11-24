package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class DoTuoiSuDung implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DoTuoiSuDungID")
    private int id;
    private String doiTuongSuDung;

    @ManyToMany(mappedBy = "dsDoTuoiSuDung")
    private Set<SanPham> danhSachSanPham = new HashSet<>();

    public DoTuoiSuDung() {}

    public DoTuoiSuDung(String doiTuongSuDung) {
        this.doiTuongSuDung = doiTuongSuDung;
    }

    public DoTuoiSuDung(String doiTuongSuDung, Set<SanPham> danhSachSanPham) {
        this.doiTuongSuDung = doiTuongSuDung;
        this.danhSachSanPham = danhSachSanPham;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDoiTuongSuDung() {
        return doiTuongSuDung;
    }

    public void setDoiTuongSuDung(String doiTuongSuDung) {
        this.doiTuongSuDung = doiTuongSuDung;
    }

    public Set<SanPham> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Set<SanPham> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }

    public void addSanPham(SanPham sanPham){
        danhSachSanPham.add(sanPham);
    }
    public void removeSanPham(SanPham sanPham){
        danhSachSanPham.remove(sanPham);
    }
}
