<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body class="bg-light">

<div class="container py-4">
    <h2 class="text-center text-primary mb-4">
        <i class="fa-solid fa-users"></i> Quản lý người dùng
    </h2>

    <!-- Nút điều hướng -->
    <div class="mb-3 text-end">
        <a href="admin?action=user-new" class="btn btn-success">
            <i class="fa fa-plus"></i> Thêm người dùng
        </a>
        <a href="admin?action=dashboard" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Quay lại
        </a>
    </div>

    <!-- Bảng danh sách -->
    <div class="card shadow">
        <div class="card-body">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Điện thoại</th>
                    <th>Vai trò</th>
                    <th width="180px">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="u" items="${listUser}">
                    <tr>
                        <td class="text-center">${u.id}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.phone}</td>
                        <td>
                            <span class="badge ${u.role eq 'admin' ? 'bg-danger' : 'bg-primary'}">
                                ${u.role}
                            </span>
                        </td>
                        <td class="text-center">
                            <a href="admin?action=user-edit&id=${u.id}" class="btn btn-sm btn-warning">
                                <i class="fa fa-edit"></i> Sửa
                            </a>
                            <a href="admin?action=user-delete&id=${u.id}"
                               onclick="return confirm('Bạn có chắc muốn xóa người dùng này?')"
                               class="btn btn-sm btn-danger">
                                <i class="fa fa-trash"></i> Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
