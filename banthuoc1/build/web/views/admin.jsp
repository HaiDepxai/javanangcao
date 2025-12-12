<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang quản trị</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1 class="text-center text-primary">👨‍💻 Trang quản trị Admin</h1>
    <hr>
    <div class="row mt-4">
        <div class="col-md-3">
            <div class="list-group">
                <a href="admin?action=user-list" class="list-group-item list-group-item-action">Quản lý người dùng</a>

                <a href="admin?action=thuoc-list" class="list-group-item list-group-item-action">Quản lý thuốc</a>


            </div>
        </div>
        <div class="col-md-9">
            <div class="alert alert-info">
                Chào mừng bạn đến với trang quản trị. Chọn chức năng ở menu bên trái.
            </div>
        </div>
    </div>
</div>

</body>
</html>
