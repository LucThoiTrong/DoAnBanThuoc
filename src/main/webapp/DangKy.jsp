<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <style>
        .slide-out {
            animation: slide-out 0.5s forwards;
        }
        .slide-in {
            animation: slide-in 0.5s forwards;
        }
        @keyframes slide-out {
            0% { transform: translateX(0); opacity: 1; }
            100% { transform: translateX(-100%); opacity: 0; }
        }
        @keyframes slide-in {
            0% { transform: translateX(100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }
        #additionalFields {
            display: none;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 100%; max-width: 400px;">
        <h3 class="text-center mb-4">Đăng Ký Tài Khoản</h3>
        <form id="registrationForm">
            <!-- Email -->
            <div class="mb-3 form-field" id="emailField">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required>
            </div>

            <!-- Tên đăng nhập -->
            <div class="mb-3 form-field" id="usernameField">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <input type="text" class="form-control" id="username" placeholder="Nhập tên đăng nhập" required>
            </div>

            <!-- Mật khẩu -->
            <div class="mb-3 form-field" id="passwordField">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required>
            </div>

            <!-- Xác thực mật khẩu -->
            <div class="mb-3 form-field" id="confirmPasswordField">
                <label for="confirm-password" class="form-label">Xác thực mật khẩu</label>
                <input type="password" class="form-control" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
            </div>

            <!-- Nút Tiếp Tục -->
            <button type="button" class="btn btn-primary w-100" id="continueButton" onclick="showAdditionalFields()">Tiếp Tục</button>

            <!-- Các trường bổ sung -->
            <div id="additionalFields" class="slide-in">
                <div class="mb-3">
                    <label for="fullname" class="form-label">Họ và tên</label>
                    <input type="text" class="form-control" id="fullname" placeholder="Nhập họ và tên" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="tel" class="form-control" id="phone" placeholder="Nhập số điện thoại" required>
                </div>

                <!-- Nút Đăng Ký -->
                <button type="submit" class="btn btn-success w-100">Đăng Ký</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <span>Đã có tài khoản?</span> <a href="#">Đăng nhập</a>
        </div>
    </div>
</div>

<script>
    function showAdditionalFields() {
        // Ẩn các trường hiện tại
        let fields = document.querySelectorAll('.form-field');
        fields.forEach(field => {
            field.classList.add('slide-out');
        });

        // Ẩn nút "Tiếp Tục"
        document.getElementById("continueButton").classList.add('slide-out');

        // Hiện các trường bổ sung sau một khoảng thời gian
        setTimeout(() => {
            fields.forEach(field => {
                field.style.display = 'none'; // Ẩn các trường cũ
            });
            document.getElementById("continueButton").style.display = "none"; // Ẩn nút "Tiếp Tục"
            document.getElementById("additionalFields").style.display = "block";
            document.getElementById("additionalFields").classList.add('slide-in');
        }, 500); // Thời gian trễ cho hiệu ứng chuyển động
    }
</script>
</body>
</html>
