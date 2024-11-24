package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.AnhDonThuoc;

import java.util.Set;

public class IAnhDonThuoc implements IDAO<AnhDonThuoc>{
    @Override
    public boolean insert(AnhDonThuoc obj) {
        return false;
    }

    @Override
    public boolean update(AnhDonThuoc obj) {
        return false;
    }

    @Override
    public boolean delete(AnhDonThuoc obj) {
        return false;
    }

    @Override
    public Set<AnhDonThuoc> SelectAll() {
        return Set.of();
    }
}
