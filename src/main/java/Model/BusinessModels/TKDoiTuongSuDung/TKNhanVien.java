package Model.BusinessModels.TKDoiTuongSuDung;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import jakarta.persistence.*;

@Entity
public class TKNhanVien extends TKDoiTuongSuDung{
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "NhanVienID")
    private NhanVien nhanVien;
    public TKNhanVien() {
        super();
    }

    public TKNhanVien(String username, String password, NhanVien nhanVien) {
        super(username, password);
        this.nhanVien = nhanVien;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }
}
