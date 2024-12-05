package Model.BusinessModels.Enum;

public enum PhuongThucThanhToan {
    MOMO("MoMo","Thanh toán qua MoMo"),
    CASH("Tiền mặt", "Thanh toán bằng tiền mặt");

    private final String displayName; // Tên hiển thị
    private final String description; // Mô tả

    PhuongThucThanhToan(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getDescription() {
        return description;
    }
}
