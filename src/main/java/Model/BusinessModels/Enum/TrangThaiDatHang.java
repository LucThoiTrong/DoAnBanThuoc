package Model.BusinessModels.Enum;

public enum TrangThaiDatHang {
    DANG_MUA_HANG("Đang mua hàng","Đơn hàng đang được mua"),
    CHO_XU_LY("Đang chờ xử lý", "Đơn hàng đang chờ được xử lý"),
    DANG_GIAO("Đang giao hàng", "Đơn hàng đang được giao"),
    DA_GIAO("Đã giao hàng", "Đơn hàng đã được giao");

    private final String displayName;
    private final String description;

    TrangThaiDatHang(String displayName, String description) {
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