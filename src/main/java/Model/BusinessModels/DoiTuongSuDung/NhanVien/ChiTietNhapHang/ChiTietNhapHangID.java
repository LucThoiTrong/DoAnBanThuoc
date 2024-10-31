package Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;

import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPhamID;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ChiTietNhapHangID implements Serializable {
    private ChiTietSanPhamID ChiTietSanPhamID;
    private String nhapHangID;

    public ChiTietNhapHangID() {}

    public ChiTietNhapHangID(ChiTietSanPhamID chiTietSanPhamID, String nhapHangID) {
        this.ChiTietSanPhamID = chiTietSanPhamID;
        this.nhapHangID = nhapHangID;
    }

    public ChiTietSanPhamID getChiTietSanPhamID() {
        return ChiTietSanPhamID;
    }

    public void setChiTietSanPhamID(ChiTietSanPhamID chiTietSanPhamID) {
        this.ChiTietSanPhamID = chiTietSanPhamID;
    }

    public String getNhapHangID() {
        return nhapHangID;
    }

    public void setNhapHangID(String nhapHangID) {
        this.nhapHangID = nhapHangID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChiTietNhapHangID that = (ChiTietNhapHangID) o;
        return Objects.equals(ChiTietSanPhamID, that.ChiTietSanPhamID) && Objects.equals(nhapHangID, that.nhapHangID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ChiTietSanPhamID, nhapHangID);
    }
}
