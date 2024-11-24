package Model.BusinessModels.DoiTuongSuDung.NhanVien;

import Model.BusinessModels.DoiTuongSuDung.DoiTuongSuDung;
import Model.BusinessModels.Enum.ChucVu;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

import java.util.HashSet;
import java.util.Set;

@Entity
public class NhanVien extends DoiTuongSuDung {
    private ChucVu chucVu;
    @OneToMany(mappedBy = "nhanVien", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<NhapHang> dsNhapHang = new HashSet<>();
    public NhanVien() {
        super();
    }

    public NhanVien(String ten, String soDienThoai, String email, ChucVu chucVu) {
        super(ten, soDienThoai, email);
        this.chucVu = chucVu;
    }

    public NhanVien(String ten, String soDienThoai, String email, ChucVu chucVu, Set<NhapHang> dsNhapHang) {
        super(ten, soDienThoai,email);
        this.chucVu = chucVu;
        this.dsNhapHang = dsNhapHang;
    }

    public ChucVu getChucVu() {
        return chucVu;
    }

    public void setChucVu(ChucVu chucVu) {
        this.chucVu = chucVu;
    }

    public Set<NhapHang> getDsNhapHang() {
        return dsNhapHang;
    }

    public void setDsNhapHang(Set<NhapHang> dsNhapHang) {
        this.dsNhapHang = dsNhapHang;
    }
}