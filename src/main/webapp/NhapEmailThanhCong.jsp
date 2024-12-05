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
    <meta name="description" content="Thông báo gửi liên kết đặt lại mật khẩu thành công">
    <title>Thành Công</title>
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
        .icon-success {
            font-size: 50px;
            color: #49CC6C;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="card text-center p-4">
                <div class="card-body">
                    <div class="icon-success mb-3">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <h3 class="mb-3">Thành Công!</h3>
                    <p class="text-muted">Liên kết đặt lại mật khẩu đã được gửi đến địa chỉ email của bạn.</p>
                    <p class="text-muted">Vui lòng kiểm tra hộp thư đến (hoặc thư rác) và làm theo hướng dẫn.</p>
                    <a href="signin.html" class="btn btn-primary w-100">Trở lại Đăng Nhập</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
