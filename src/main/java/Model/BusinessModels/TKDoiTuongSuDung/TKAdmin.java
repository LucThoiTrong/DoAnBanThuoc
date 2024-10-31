package Model.BusinessModels.TKDoiTuongSuDung;

import Model.BusinessModels.DoiTuongSuDung.Admin;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;

@Entity
public class TKAdmin extends TKDoiTuongSuDung{
    @OneToOne
    @JoinColumn(name = "AdminID")
    private Admin admin;
    public TKAdmin() {
        super();
    }

    public TKAdmin(String username, String password, Admin admin) {
        super(username, password);
        this.admin = admin;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
