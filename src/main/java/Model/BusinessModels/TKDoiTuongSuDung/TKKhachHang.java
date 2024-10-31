package Model.BusinessModels.TKDoiTuongSuDung;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;

@Entity
public class TKKhachHang extends TKDoiTuongSuDung {
    @OneToOne
    @JoinColumn(name = "KhachHangID")
    private KhachHang khachHang;
    public TKKhachHang() {
        super();
    }

    public TKKhachHang(String username, String password, KhachHang khachHang) {
        super(username, password);
        this.khachHang = khachHang;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }
}
