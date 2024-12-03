package Model.BusinessModels.DoiTuongSuDung.KhacHang;

import Model.BusinessModels.Enum.PhuongThucThanhToan;
import Model.BusinessModels.Enum.TrangThaiDatHang;
import Model.BusinessModels.SanPham.ChiTietSanPham;
import jakarta.persistence.*;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

@Entity
public class DatHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date ngayDatHang;

    private String diaChi;

    private String linkAnhDonThuoc;

    @Enumerated(EnumType.STRING)
    private PhuongThucThanhToan phuongThucThanhToan;
    @Enumerated(EnumType.STRING)
    private TrangThaiDatHang trangThaiDatHang;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "KhachHangID")
    private KhachHang khachHang;

    @OneToMany(mappedBy = "datHang", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietDatHang> danhSachSanPham = new HashSet<>();

    public DatHang() {}

    public DatHang(KhachHang khachHang) {
        this.khachHang = khachHang;
        this.trangThaiDatHang = TrangThaiDatHang.DANG_MUA_HANG;
    }

    public DatHang(Date ngayDatHang, String diaChi, String linkAnhDonThuoc, PhuongThucThanhToan phuongThucThanhToan, TrangThaiDatHang trangThaiDatHang, KhachHang khachHang, Set<ChiTietDatHang> danhSachSanPham) {
        this.ngayDatHang = ngayDatHang;
        this.diaChi = diaChi;
        this.linkAnhDonThuoc = linkAnhDonThuoc;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.trangThaiDatHang = trangThaiDatHang;
        this.khachHang = khachHang;
        this.danhSachSanPham = danhSachSanPham;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getLinkAnhDonThuoc() {
        return linkAnhDonThuoc;
    }

    public void setLinkAnhDonThuoc(String linkAnhDonThuoc) {
        this.linkAnhDonThuoc = linkAnhDonThuoc;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public PhuongThucThanhToan getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(PhuongThucThanhToan phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public Set<ChiTietDatHang> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Set<ChiTietDatHang> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }

    public TrangThaiDatHang getTrangThaiDatHang() {
        return trangThaiDatHang;
    }

    public void setTrangThaiDatHang(TrangThaiDatHang trangThaiDatHang) {
        this.trangThaiDatHang = trangThaiDatHang;
    }

    // Kiểm tra sản phẩm có trong giỏ hàng hay không
    public boolean kiemTraSanPhamTrongGio(ChiTietSanPham ctsp){
        return findChiTietDatHang(ctsp) != null;
    }

    public void addSanPham(ChiTietDatHang chiTietDatHang){
        this.danhSachSanPham.add(chiTietDatHang);
    }

    public void removeSanPham(ChiTietDatHang chiTietDatHang){
        Iterator<ChiTietDatHang> iterator = this.danhSachSanPham.iterator();  // Khởi tạo iterator
        while(iterator.hasNext()){
            ChiTietDatHang ctdh = iterator.next();
            if(ctdh.getId() == chiTietDatHang.getId()){
                iterator.remove();  // Dùng iterator để xóa phần tử
                break;  // Dừng vòng lặp sau khi xóa phần tử
            }
        }
    }

    // update sản phẩm
    public void updateSanPham(ChiTietSanPham ctsp, int soLuong){
        ChiTietDatHang ctdh = findChiTietDatHang(ctsp);
        if (ctdh != null) {
            int soLuongMoi = ctdh.getSoLuongMua() + soLuong;
            ctdh.setSoLuongMua(soLuongMoi);
        }
    }

    public ChiTietDatHang findChiTietDatHang(ChiTietSanPham ctsp) {
        for (ChiTietDatHang ctdh : danhSachSanPham) {
            if (ctdh.getSanPham().getId() == ctsp.getId() &&
                    ctdh.getSanPham().getDonViTinh().getId() == ctsp.getDonViTinh().getId()) {
                return ctdh;
            }
        }
        return null;
    }

    public double tinhTongGiaTien(){
        double result = 0;
        for(ChiTietDatHang ctdh : danhSachSanPham){
            result += ctdh.getTongGiaTien();
        }
        return result;
    }

    public int getThangFromNgayDatHang() {
        Date sqlDate = ngayDatHang; // Giả sử `ngayDatHang` là java.sql.Date
        LocalDate localDate = sqlDate.toLocalDate(); // Chuyển đổi thành LocalDate
        return localDate.getMonthValue();  // Trả về tháng
    }
}
