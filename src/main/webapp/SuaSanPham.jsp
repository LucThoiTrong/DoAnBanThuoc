<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>San Pham</title>
    <link rel="stylesheet" href="themsanpham.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-3">
    <form action="servletThemSuaSanPham" method="post">
        <input type="hidden" name="action" value="capNhatSanPham">
        <div class="row">
            <p style="color: #1c7430; font-weight: bold !important; font-size: 30px;">Chỉnh sửa.</p>
            <input type="hidden" name="id" value="${sanPham.id}">
        </div>
        <div class ="row">
            <div class = "col-6">
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Ảnh thuốc:</label>
                    <img src="${sanPham.anhSanPham}">
                    <input type="text" name="anhSP" value="${sanPham.anhSanPham}" placeholder="Đường dẫn ảnh" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;" required>
                    <%--          <button style="margin-top: 20px">Load ảnh mới</button>--%>
                </div>
            </div>
            <div class="col-6" >
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Tên thuốc:</label>
                    <input type="text" name="tenSP" value="${sanPham.tenSanPham}" placeholder="Tên thuốc" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Nơi sản xuất:</label>
                    <input type="text" name="noiSanXuat" value="${sanPham.noiSanXuat}" placeholder="Nơi sản xuất" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Thương hiệu:</label>
                    <input type="text" name="thuongHieu" value="${sanPham.thuongHieu}" placeholder="Thương hiệu" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <br>
                <label>Đơn vị tính</label>
                <c:forEach var="i" begin="1" end="6">
                    <input type="checkbox" name="donvitinh" value="${i}" id="${i}"
                           <c:if test="${dsDonViTinhID.contains(i)}">checked</c:if>>
                    <label>${i == 1 ? 'Vỉ' : (i == 2 ? 'Hộp' : (i == 3 ? 'Tuýp' : (i == 4 ? 'Ống' : (i == 5 ? 'Chai' : 'Gói'))))}</label>
                </c:forEach>
                <br>
                <label>Danh muc thuoc:</label>
                <select name="danhMucThuoc">
                    <option value="2" ${iddanhmuc == 2 ? 'selected' : ''}>Thuốc kê đơn</option>
                    <option value="1" ${iddanhmuc == 1 ? 'selected' : ''}>Thuốc không kê đơn</option>
                </select>
                <br>
                <label>Chọn loại thuốc:</label>
                <select name="loaiThuoc">
                    <c:forEach var="loaiThuoc" items="${danhSachLoaiThuoc}">
                        <option value="${loaiThuoc.id}"
                                <c:if test="${loaiThuoc.id == sanPham.loaiThuoc.id}">selected</c:if>>
                                ${loaiThuoc.tenLoaiThuoc}
                        </option>
                    </c:forEach>
                </select>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Link chi tiet san pham:</label>
                    <input type="text" value="${sanPham.linkChiTietSanPham}" name="linkChiTietSanPham" placeholder="Số lượng có trong kho" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;" >
                </div>

                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Giá bán:</label>
                    <input type="number" value="${ctsp.giaBan}" name="giaBan" placeholder="Giá bán" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Giá nhập:</label>
                    <input type="number" value="${ctsp.giaNhap}" name="giaNhap" placeholder="Giá nhập" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                <div style="margin-bottom: 15px;">
                    <label style="display: block; text-align: left;">Số lượng có trong kho:</label>
                    <input type="number" value="${ctsp.soLuongSanPhamTrongKho}" name="soLuongTrongKho" placeholder="Số lượng có trong kho" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
            </div>
        </div>

        <div class="button-nhom">
            <button type="submit" name="action" value="capNhatSanPham">Cập nhật</button>
            <%--      <a href="servletThemSanPhamMoi?action=xoaSanPham&id=${sanPham.id}" class="close-btn">Xóa sản phẩm</a>--%>
        </div>
    </form>
</div>
</body>
</html>
