package Model.BusinessModels.DoiTuongSuDung;

import jakarta.persistence.Entity;

@Entity
public class Admin extends DoiTuongSuDung{
    public Admin() {
        super();
    }

    public Admin(String ten, String soDienThoai, String email) {
        super(ten, soDienThoai, email);
    }
}
