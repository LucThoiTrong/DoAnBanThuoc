package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
public class AnhDonThuoc implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "AnhDonThuocID")
    private DatHang datHang;

    public AnhDonThuoc() {}

    public AnhDonThuoc(int id, DatHang datHang) {
        this.id = id;
        this.datHang = datHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DatHang getDatHang() {
        return datHang;
    }

    public void setDatHang(DatHang datHang) {
        this.datHang = datHang;
    }
}
