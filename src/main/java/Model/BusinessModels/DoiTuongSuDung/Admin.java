package Model.BusinessModels.DoiTuongSuDung;

import jakarta.persistence.Entity;

@Entity
public class Admin extends DoiTuongSuDung{
    public Admin() {
        super();
    }

    public Admin(int id, String ten, String soDienThoai, String diaChi) {
        super(id, ten, soDienThoai, diaChi);
    }
}
