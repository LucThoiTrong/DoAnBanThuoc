<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Đặt lại mật khẩu mới">
    <title>Đặt Lại Mật Khẩu</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #49CC6C, #2575fc);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }
        .btn-primary {
            background-color: #49CC6C;
            border-color: #49CC6C;
        }
        .btn-primary:hover {
            background-color: #49CC6C/*#2575fc*/;
            border-color: #49CC6C/*#2575fc*/;
        }
        .form-control:focus {
            border-color: #49CC6C;
            box-shadow: 0 0 5px rgba(90, 206, 26, 0.5);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="card p-4">
                <div class="card-body">
                    <h3 class="text-center mb-4">Đặt Lại Mật Khẩu</h3>
                    <p class="text-muted text-center">Nhập mật khẩu mới và xác nhận để tiếp tục.</p>
                    <form action="servletForgotPassword" method="post">
                        <input type="hidden" name="action" value="CapNhatMatKhau">
                        <input type="hidden" name="username" id="usernameInput">
                        <div class="mb-3">
                            <label for="new-password" class="form-label">Mật khẩu mới</label>
                            <input type="password" id="new-password" name="new-password" class="form-control" placeholder="Nhập mật khẩu mới" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirm-password" class="form-label">Xác nhận mật khẩu</label>
                            <input type="password" id="confirm-password" name="confirm-password" class="form-control" placeholder="Nhập lại mật khẩu" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đặt Lại Mật Khẩu</button>
                    </form>
                    <script>
                        // Lấy tham số 'username' từ URL
                        const urlParams = new URLSearchParams(window.location.search);
                        const username = urlParams.get('username');

                        // Gán giá trị vào thẻ input
                        if (username) {
                            document.getElementById('usernameInput').value = username;
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        const newPassword = document.getElementById('new-password').value;
        const confirmPassword = document.getElementById('confirm-password').value;

        // Xóa thông báo lỗi trước đó (nếu có)
        const errorElement = document.getElementById('error-message');
        if (errorElement) {
            errorElement.remove();
        }

        if (newPassword !== confirmPassword) {
            // Tạo thông báo lỗi
            const error = document.createElement('div');
            error.id = 'error-message';
            error.textContent = 'Mật khẩu không khớp. Vui lòng thử lại.';
            error.style.color = 'red';
            error.style.marginTop = '10px';

            // Chèn thông báo lỗi vào dưới form
            this.appendChild(error);

            // Ngăn không cho gửi form
            event.preventDefault();
        }
    });
</script>
</body>
</html>
