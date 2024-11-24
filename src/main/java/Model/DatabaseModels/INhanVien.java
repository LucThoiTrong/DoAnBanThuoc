package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;

import java.util.Set;

public class INhanVien implements IDAO<NhanVien> {
    @Override
    public boolean insert(NhanVien obj) {
        return false;
    }

    @Override
    public boolean update(NhanVien obj) {
        return false;
    }

    @Override
    public boolean delete(NhanVien obj) {
        return false;
    }

    @Override
    public Set<NhanVien> SelectAll() {
        return Set.of();
    }
}
