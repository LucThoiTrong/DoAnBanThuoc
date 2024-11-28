package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;

import java.util.Set;

public class IChiTietDatHang implements IDAO<ChiTietDatHang>{
    @Override
    public boolean insert(ChiTietDatHang obj) {
        return false;
    }

    @Override
    public boolean update(ChiTietDatHang obj) {
        return false;
    }

    @Override
    public boolean delete(ChiTietDatHang obj) {
        return false;
    }

    @Override
    public Set<ChiTietDatHang> SelectAll() {
        return Set.of();
    }

    @Override
    public ChiTietDatHang SelectById(int id) {
        return null;
    }

    @Override
    public Set<ChiTietDatHang> SelectByID(int id) {
        return Set.of();
    }
}
