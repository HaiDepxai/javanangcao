<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Form người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2 class="mb-4">
        <c:choose>
            <c:when test="${not empty user}">✏ Sửa người dùng</c:when>
            <c:otherwise>➕ Thêm người dùng</c:otherwise>
        </c:choose>
    </h2>

    <form action="admin" method="post">
        <c:choose>
            <c:when test="${not empty user}">
                <input type="hidden" name="action" value="user-update"/>
                <input type="hidden" name="id" value="${user.id}"/>
            </c:when>
            <c:otherwise>
                <input type="hidden" name="action" value="user-insert"/>
            </c:otherwise>
        </c:choose>

        <div class="mb-3">
            <label class="form-label">Tên</label>
            <input type="text" name="name" class="form-control"
                   value="${not empty user ? user.name : ''}"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control"
                   value="${not empty user ? user.email : ''}"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control"
                   value="${not empty user ? user.phone : ''}"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control"
                   value="${not empty user ? user.password : ''}"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="form-control">
                <option value="user" <c:if test="${not empty user && user.role eq 'user'}">selected</c:if>>User</option>
                <option value="admin" <c:if test="${not empty user && user.role eq 'admin'}">selected</c:if>>Admin</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">💾 Lưu</button>
    </form>

    <style>
        body {
            background: #f8f9fa;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .btn {
            min-width: 100px;
        }
    </style>
</body>
</html>
