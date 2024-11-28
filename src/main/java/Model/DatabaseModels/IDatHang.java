package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.DatHang;

import java.util.Set;

public class IDatHang implements IDAO<DatHang> {
    @Override
    public boolean insert(DatHang obj) {
        return false;
    }

    @Override
    public boolean update(DatHang obj) {
        return false;
    }

    @Override
    public boolean delete(DatHang obj) {
        return false;
    }

    @Override
    public Set<DatHang> SelectAll() {
        return Set.of();
    }

    @Override
    public DatHang SelectById(int id) {
        return null;
    }

    @Override
    public Set<DatHang> SelectByID(int id) {
        return Set.of();
    }
}
