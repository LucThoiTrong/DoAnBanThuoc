package Model.BusinessModels.SanPham;

import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class SanPham implements Serializable {
    @Id
    @Column(name = "SanPhamID")
    private String id;
    private String tenSanPham;
    private String quyCachDongGoi;
    private boolean thuocKeDon;
    private String thuongHieu;
    private String noiSanXuat;
    private String cachDung;
    private String thanhPhan;
    private String cachBaoQuan;
    private String khuyenCao;
    private String tacDungPhu;
    private String luuY;
    private String congDung;
    private byte[] anhSanPham;
    private String moTa;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "LoaiThuocID")
    private LoaiThuoc loaiThuoc;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ChiTietSanPham> cacChiTietSanPham = new HashSet<>();

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<DanhGia> cacDanhGia = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "DoTuoiSuDungThuoc",
            joinColumns = {@JoinColumn(name = "SanPhamID")},
            inverseJoinColumns = {@JoinColumn(name = "DoTuoiSuDungID")}
    )
    private Set<DoTuoiSuDung> dsDoTuoiSuDung = new HashSet<>();

    public SanPham() {}

    public SanPham(String id, String tenSanPham, String quyCachDongGoi, boolean thuocKeDon, String thuongHieu, String noiSanXuat, String cachDung, String thanhPhan, String cachBaoQuan, String khuyenCao, String tacDungPhu, String luuY, String congDung, byte[] anhSanPham, String moTa, LoaiThuoc loaiThuoc, Set<ChiTietSanPham> cacChiTietSanPham, Set<DanhGia> cacDanhGia, Set<DoTuoiSuDung> dsDoTuoiSuDung) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.quyCachDongGoi = quyCachDongGoi;
        this.thuocKeDon = thuocKeDon;
        this.thuongHieu = thuongHieu;
        this.noiSanXuat = noiSanXuat;
        this.cachDung = cachDung;
        this.thanhPhan = thanhPhan;
        this.cachBaoQuan = cachBaoQuan;
        this.khuyenCao = khuyenCao;
        this.tacDungPhu = tacDungPhu;
        this.luuY = luuY;
        this.congDung = congDung;
        this.anhSanPham = anhSanPham;
        this.moTa = moTa;
        this.loaiThuoc = loaiThuoc;
        this.cacChiTietSanPham = cacChiTietSanPham;
        this.cacDanhGia = cacDanhGia;
        this.dsDoTuoiSuDung = dsDoTuoiSuDung;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getQuyCachDongGoi() {
        return quyCachDongGoi;
    }

    public void setQuyCachDongGoi(String quyCachDongGoi) {
        this.quyCachDongGoi = quyCachDongGoi;
    }

    public boolean isThuocKeDon() {
        return thuocKeDon;
    }

    public void setThuocKeDon(boolean thuocKeDon) {
        this.thuocKeDon = thuocKeDon;
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

    public String getCachDung() {
        return cachDung;
    }

    public void setCachDung(String cachDung) {
        this.cachDung = cachDung;
    }

    public String getThanhPhan() {
        return thanhPhan;
    }

    public void setThanhPhan(String thanhPhan) {
        this.thanhPhan = thanhPhan;
    }

    public String getCachBaoQuan() {
        return cachBaoQuan;
    }

    public void setCachBaoQuan(String cachBaoQuan) {
        this.cachBaoQuan = cachBaoQuan;
    }

    public String getKhuyenCao() {
        return khuyenCao;
    }

    public void setKhuyenCao(String khuyenCao) {
        this.khuyenCao = khuyenCao;
    }

    public String getTacDungPhu() {
        return tacDungPhu;
    }

    public void setTacDungPhu(String tacDungPhu) {
        this.tacDungPhu = tacDungPhu;
    }

    public String getLuuY() {
        return luuY;
    }

    public void setLuuY(String luuY) {
        this.luuY = luuY;
    }

    public String getCongDung() {
        return congDung;
    }

    public void setCongDung(String congDung) {
        this.congDung = congDung;
    }

    public byte[] getAnhSanPham() {
        return anhSanPham;
    }

    public void setAnhSanPham(byte[] anhSanPham) {
        this.anhSanPham = anhSanPham;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
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
}