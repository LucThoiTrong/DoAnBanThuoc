// Linh An

// Phần mục lục của thông tin sản phẩm
document.addEventListener('scroll', () => {
    const fromTop = window.scrollY + 60; // adjust offset for smooth transition
    document.querySelectorAll('.sidebar a').forEach(link => {
        const section = document.querySelector(link.getAttribute('href'));
        if (section.offsetTop <= fromTop && section.offsetTop + section.offsetHeight > fromTop) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
});

//Xử lý giá, đơn vị tính và số lượng
document.addEventListener('DOMContentLoaded', function () {

    // Xử lý sự kiện chọn đơn vị tính
    const unitButtons = document.querySelectorAll('.unit-btn');
    unitButtons.forEach(button => {
        button.addEventListener('click', function () {
            unitButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            // Cập nhật giá hoặc đơn vị tính tùy theo lựa chọn
            const selectedUnit = button.dataset.unit;
            // Cập nhật giá trị của đơn vị tính (ví dụ thay đổi hiển thị giá)
            console.log('Đơn vị tính được chọn:', selectedUnit);
        });
    });

    // Xử lý thay đổi số lượng

    // Lấy các phần tử cần thiết
    const quantityInput = document.getElementById('quantity');
    const decreaseButton = document.getElementById('decrease-quantity');
    const increaseButton = document.getElementById('increase-quantity');

    // Lắng nghe sự kiện click trên nút giảm
    decreaseButton.addEventListener('click', () => {
        let currentValue = parseInt(quantityInput.value, 10); // Lấy giá trị hiện tại và chuyển sang số
        const minValue = parseInt(quantityInput.min, 10); // Lấy giá trị tối thiểu
        if (currentValue > minValue) {
            quantityInput.value = currentValue - 1; // Giảm giá trị đi 1
        }
    });

    // Lắng nghe sự kiện click trên nút tăng
    increaseButton.addEventListener('click', () => {
        let currentValue = parseInt(quantityInput.value, 10);
        const maxValue = parseInt(quantityInput.max, 10); // Lấy giá trị tối đa
        if (currentValue < maxValue) {
            quantityInput.value = currentValue + 1; // Tăng giá trị lên 1
        }
    });

    // Lắng nghe sự kiện khi người dùng thay đổi giá trị bằng cách nhập trực tiếp
    quantityInput.addEventListener('input', () => {
        let currentValue = parseInt(quantityInput.value, 10);
        const minValue = parseInt(quantityInput.min, 10);
        const maxValue = parseInt(quantityInput.max, 10);

        // Kiểm tra nếu giá trị không hợp lệ (chữ, rỗng, v.v.)
        if (isNaN(currentValue) || currentValue < minValue) {
            quantityInput.value = minValue; // Gán giá trị tối thiểu
        } else if (currentValue > maxValue) {
            quantityInput.value = maxValue; // Gán giá trị tối đa
        }
    });

});