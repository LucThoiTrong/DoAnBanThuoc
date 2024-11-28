package Model.DatabaseModels;

import Model.BusinessModels.SanPham.DanhGia;

import java.util.Set;

public class IDanhGia implements IDAO<DanhGia> {
    @Override
    public boolean insert(DanhGia obj) {
        return false;
    }

    @Override
    public boolean update(DanhGia obj) {
        return false;
    }

    @Override
    public boolean delete(DanhGia obj) {
        return false;
    }

    @Override
    public Set<DanhGia> SelectAll() {
        return Set.of();
    }

    @Override
    public DanhGia SelectById(int id) {
        return null;
    }

    @Override
    public Set<DanhGia> SelectByID(int id) {
        return Set.of();
    }
}
