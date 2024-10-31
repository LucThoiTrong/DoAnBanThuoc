package Model.BusinessModels.SanPham.ChiTietSanPham;

import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ChiTietSanPhamID implements Serializable {
    private String SanPhamID;
    private int DonViTinhID;

    public ChiTietSanPhamID() {}

    public ChiTietSanPhamID(String sanPhamID, int DonViTinhID) {
        SanPhamID = sanPhamID;
        this.DonViTinhID = DonViTinhID;
    }

    public String getSanPhamID() {
        return SanPhamID;
    }

    public void setSanPhamID(String sanPhamID) {
        SanPhamID = sanPhamID;
    }

    public int getDonViTinhID() {
        return DonViTinhID;
    }

    public void setDonViTinhID(int DonViTinhID) {
        this.DonViTinhID = DonViTinhID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChiTietSanPhamID that = (ChiTietSanPhamID) o;
        return DonViTinhID == that.DonViTinhID && Objects.equals(SanPhamID, that.SanPhamID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(SanPhamID, DonViTinhID);
    }
}
