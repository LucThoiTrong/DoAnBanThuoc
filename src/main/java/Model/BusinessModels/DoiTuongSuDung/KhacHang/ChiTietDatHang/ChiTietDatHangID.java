package Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;

import Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPhamID;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ChiTietDatHangID implements Serializable {
    private ChiTietSanPhamID ChiTietSanPhamID;
    private String DatHangID;

    public ChiTietDatHangID() {}

    public ChiTietDatHangID(ChiTietSanPhamID ChiTietSanPhamID, String DatHangID) {
        this.ChiTietSanPhamID = ChiTietSanPhamID;
        this.DatHangID = DatHangID;
    }

    public Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPhamID getChiTietSanPhamID() {
        return ChiTietSanPhamID;
    }

    public void setChiTietSanPhamID(Model.BusinessModels.SanPham.ChiTietSanPham.ChiTietSanPhamID chiTietSanPhamID) {
        ChiTietSanPhamID = chiTietSanPhamID;
    }

    public String getDatHangID() {
        return DatHangID;
    }

    public void setDatHangID(String datHangID) {
        DatHangID = datHangID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChiTietDatHangID that = (ChiTietDatHangID) o;
        return Objects.equals(ChiTietSanPhamID, that.ChiTietSanPhamID) && Objects.equals(DatHangID, that.DatHangID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ChiTietSanPhamID, DatHangID);
    }
}
