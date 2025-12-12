<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán thành công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .success-wrapper {
            max-width: 700px;
            margin: 80px auto;
            padding: 40px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #28a745;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: scaleUp 0.6s ease-in-out;
        }
        .success-icon i {
            color: #fff;
            font-size: 50px;
        }
        @keyframes scaleUp {
            from { transform: scale(0.5); opacity: 0; }
            to   { transform: scale(1); opacity: 1; }
        }
        .order-info {
            margin: 25px 0;
            text-align: left;
        }
        .order-info h5 {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .order-info p {
            margin: 5px 0;
            color: #555;
        }
        .btn-custom {
            margin: 10px;
            border-radius: 30px;
            padding: 10px 25px;
            font-size: 16px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<div class="success-wrapper">
    <!-- Icon thành công -->
    <div class="success-icon">
        <i class="bi bi-check-lg"></i>
    </div>

    <!-- Thông báo -->
    <h2 class="text-success mb-3">Thanh toán thành công!</h2>
    <p class="text-muted">Cảm ơn bạn đã mua hàng tại <strong>Nhà thuốc Đình Hải</strong>.  
        Đơn hàng sẽ được xử lý và giao sớm nhất.</p>



    <!-- Nút điều hướng -->
    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary btn-custom">
        <i class="bi bi-house-door"></i> Về trang chủ
    </a>

</div>
</body>
</html>
