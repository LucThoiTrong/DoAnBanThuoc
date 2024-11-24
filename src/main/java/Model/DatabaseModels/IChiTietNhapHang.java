package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.ChiTietNhapHang;

import java.util.Set;

public class IChiTietNhapHang implements IDAO<ChiTietNhapHang> {
    @Override
    public boolean insert(ChiTietNhapHang obj) {
        return false;
    }

    @Override
    public boolean update(ChiTietNhapHang obj) {
        return false;
    }

    @Override
    public boolean delete(ChiTietNhapHang obj) {
        return false;
    }

    @Override
    public Set<ChiTietNhapHang> SelectAll() {
        return Set.of();
    }
}
