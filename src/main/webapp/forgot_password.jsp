<%--
  Created by IntelliJ IDEA.
  User: bigbo
  Date: 12/2/2024
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Trang quên mật khẩu thiết kế đẹp bằng Bootstrap">
    <title>Quên Mật Khẩu</title>
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
                    <h3 class="text-center mb-4"><strong>Quên Mật Khẩu</strong></h3>
                    <p class="text-muted text-center">Nhập email của bạn để nhận liên kết khôi phục mật khẩu.</p>
                    <form action="servletForgotPassword?action=forgotPassword" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label font-weight-bold"><strong>Username</strong></label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="Nhập Username của bạn" required>
                            <br><label for="email" class="form-label font-weight-bold"><strong>Email</strong></label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Nhập email của bạn" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Gửi Liên Kết</button>
                    </form>
                    <hr class="my-4">
                    <div class="text-center">
                        <a href="signin.html" class="text-decoration-none">Trở lại Đăng Nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

