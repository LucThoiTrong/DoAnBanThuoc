package Model.BusinessModels.SanPham;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class SanPham implements Serializable {
    @Id
    @Column(name = "SanPhamID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String tenSanPham;
    private String thuongHieu;
    private String noiSanXuat;
    private String anhSanPham;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "LoaiThuocID")
    private LoaiThuoc loaiThuoc;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietSanPham> cacChiTietSanPham = new HashSet<>();

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<DanhGia> cacDanhGia = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "DoTuoiSuDungThuoc",
            joinColumns = {@JoinColumn(name = "SanPhamID")},
            inverseJoinColumns = {@JoinColumn(name = "DoTuoiSuDungID")}
    )
    private Set<DoTuoiSuDung> dsDoTuoiSuDung = new HashSet<>();

    public SanPham() {}

    public SanPham(String tenSanPham, String thuongHieu, String noiSanXuat, String anhSanPham, LoaiThuoc loaiThuoc) {
        this.tenSanPham = tenSanPham;
        this.thuongHieu = thuongHieu;
        this.noiSanXuat = noiSanXuat;
        this.anhSanPham = anhSanPham;
        this.loaiThuoc = loaiThuoc;
    }

    public SanPham(String tenSanPham, String thuongHieu, String noiSanXuat, String anhSanPham, LoaiThuoc loaiThuoc, Set<ChiTietSanPham> cacChiTietSanPham, Set<DanhGia> cacDanhGia, Set<DoTuoiSuDung> dsDoTuoiSuDung) {
        this.tenSanPham = tenSanPham;
        this.thuongHieu = thuongHieu;
        this.noiSanXuat = noiSanXuat;
        this.anhSanPham = anhSanPham;
        this.loaiThuoc = loaiThuoc;
        this.cacChiTietSanPham = cacChiTietSanPham;
        this.cacDanhGia = cacDanhGia;
        this.dsDoTuoiSuDung = dsDoTuoiSuDung;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getThuongHieu() {
        return thuongHieu;
    }

    public void setThuongHieu(String thuongHieu) {
        this.thuongHieu = thuongHieu;
    }

    public String getNoiSanXuat() {
        return noiSanXuat;
    }

    public void setNoiSanXuat(String noiSanXuat) {
        this.noiSanXuat = noiSanXuat;
    }

    public String getAnhSanPham() {
        return anhSanPham;
    }

    public void setAnhSanPham(String anhSanPham) {
        this.anhSanPham = anhSanPham;
    }

    public LoaiThuoc getLoaiThuoc() {
        return loaiThuoc;
    }

    public void setLoaiThuoc(LoaiThuoc loaiThuoc) {
        this.loaiThuoc = loaiThuoc;
    }

    public Set<ChiTietSanPham> getCacChiTietSanPham() {
        return cacChiTietSanPham;
    }

    public void setCacChiTietSanPham(Set<ChiTietSanPham> cacChiTietSanPham) {
        this.cacChiTietSanPham = cacChiTietSanPham;
    }

    public Set<DanhGia> getCacDanhGia() {
        return cacDanhGia;
    }

    public void setCacDanhGia(Set<DanhGia> cacDanhGia) {
        this.cacDanhGia = cacDanhGia;
    }

    public Set<DoTuoiSuDung> getDsDoTuoiSuDung() {
        return dsDoTuoiSuDung;
    }

    public void setDsDoTuoiSuDung(Set<DoTuoiSuDung> dsDoTuoiSuDung) {
        this.dsDoTuoiSuDung = dsDoTuoiSuDung;
    }

    public void addDoTuoiSuDung(DoTuoiSuDung doTuoiSuDung){
        this.dsDoTuoiSuDung.add(doTuoiSuDung);
    }

    public void removeDoTuoiSuDung(DoTuoiSuDung doTuoiSuDung){
        this.dsDoTuoiSuDung.remove(doTuoiSuDung);
    }

    public void addChiTietSanPham(ChiTietSanPham chiTietSanPham){
        this.cacChiTietSanPham.add(chiTietSanPham);
    }

    public void removeChiTietSanPham(ChiTietSanPham chiTietSanPham){
        this.cacChiTietSanPham.remove(chiTietSanPham);
    }
}