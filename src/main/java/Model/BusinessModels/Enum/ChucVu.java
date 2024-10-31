package Model.BusinessModels.Enum;

public enum ChucVu {
    NHAN_VIEN("Nhân viên"),
    QUAN_LY("Quản lý");

    private final String tenChucVu;

    ChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public String getTenChucVu() {
        return tenChucVu;
    }
}