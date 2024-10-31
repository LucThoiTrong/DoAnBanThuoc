package Model.BusinessModels.TKDoiTuongSuDung;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class TKDoiTuongSuDung implements Serializable {
    @Id
    private String username;
    private String password;

    public TKDoiTuongSuDung() {}

    public TKDoiTuongSuDung(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
