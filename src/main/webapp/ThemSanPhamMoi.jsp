<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Thêm sản phẩm</title>
    <link rel="stylesheet" href="themsanpham.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-3">
    <h2 style="color: #1c7430;font-weight: bold ">Thêm thuốc mới.</h2>
    <form action="servletThemSuaSanPham" method="post">
        <input type="hidden" name="action" value="addSanPham">
        <div class ="row">
            <div class = "col-6">
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Ảnh thuốc:</label>
                    <input type="text" name="anhSP" placeholder="Đường dẫn ảnh" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Tên thuốc:</label>
                    <input type="text" name="tenSP" placeholder="Tên thuốc" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Nơi sản xuất:</label>
                    <input type="text" name="noiSanXuat"placeholder="Nơi sản xuất" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Thương hiệu:</label>
                    <input type="text" name="thuongHieu" placeholder="Thương hiệu" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="display: inline-flex">
                    <p style="font-weight: bold;margin-right: 10px;margin-left: 10px">Loại thuốc: </p>
                    <p name="loaiThuoc" value="${loaiThuoc.id}">${loaiThuoc.tenLoaiThuoc}</p>
                    <input type="hidden" name="loaiThuoc" value="${loaiThuoc.id}">
                </div>
            </div>
        <div class="col-6" >
            <label>Đơn vị tính</label>
            <input type="checkbox" name="donvitinh" value="1">
            <label>Vỉ</label>
            <input type="checkbox" name="donvitinh" value="2">
            <label>Hộp</label>
            <input type="checkbox" name="donvitinh" value="3">
            <label>Tuýp</label>
            <input type="checkbox" name="donvitinh" value="4">
            <label>Ống</label>
            <input type="checkbox" name="donvitinh" value="5">
            <label>Chai</label>
            <input type="checkbox" name="donvitinh" value="6">
            <label>Gói</label><br>
            <label>Danh mục thuốc:</label>
            <select style="margin-top: 15px;" name="danhMucThuoc">
                <option value="2" ${danhMucThuoc.id == 2 ? 'selected' : ''} style="display: ${danhMucThuoc.id == 2 ? 'block' : 'none'};">Thuốc kê đơn</option>
                <option value="1" ${danhMucThuoc.id == 1 ? 'selected' : ''} style="display: ${danhMucThuoc.id == 1 ? 'block' : 'none'};">Thuốc không kê đơn</option>
            </select>
            <input type="hidden" name="danhMucThuoc" value="${danhMucThuoc.id}">

            <div style="margin-bottom: 15px;">
            <label style="display: block; text-align: left;">Link chi tiet san pham:</label>
            <input type="text" name="linkChiTietSanPham" placeholder="Số lượng có trong kho" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
        </div>

        <div style="margin-bottom: 15px;">
            <label style="display: block; text-align: left;">Giá bán:</label>
            <input type="number" name="giaBan" placeholder="Giá bán" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
        </div>
        <div style="margin-bottom: 15px;">
            <label style="display: block; text-align: left;">Giá nhập:</label>
            <input type="number" name="giaNhap" placeholder="Giá nhập" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
        </div>
        <div style="margin-bottom: 15px;">
            <label style="display: block; text-align: left;">Số lượng có trong kho:</label>
            <input type="number" name="soLuongTrongKho" placeholder="Số lượng có trong kho" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
        </div>
        </div>
        </div>
        <div class="button-nhom">
        <button type="submit">
            Thêm
        </button>
        <a href="#" class="close-btn">Đóng</a>
        </div>
    </form>
</div>
</body>
</html>
