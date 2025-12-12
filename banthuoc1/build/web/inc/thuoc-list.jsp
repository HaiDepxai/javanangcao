<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Thuốc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }
        table {
            border-radius: 10px;
            overflow: hidden;
        }
        table thead {
            background: linear-gradient(45deg, #007bff, #00c6ff);
            color: white;
        }
        table tbody tr:hover {
            background-color: #f1f5ff;
        }
        table img {
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        .btn {
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card p-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary fw-bold mb-0">💊 Danh sách Thuốc</h2>
        </div>

        <!-- Buttons -->
        <div class="mb-3">
            <a href="${pageContext.request.contextPath}/admin?action=thuoc-add" class="btn btn-success me-2">
                ➕ Thêm Thuốc
            </a>
            <a href="admin?action=dashboard" class="btn btn-secondary">
                ← Quay lại
            </a>
        </div>

        <!-- Table -->
        <table class="table table-hover align-middle text-center">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên Thuốc</th>
                <th>Ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Trạng thái</th>
                <th>Loại</th>
                <th>Hạn sử dụng</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="thuoc" items="${thuocList}">
                <tr>
                    <td>${thuoc.id}</td>
                    <td class="text-start fw-semibold">${thuoc.name}</td>
                    <td>
                        <c:if test="${not empty thuoc.image}">
                            <img src="assets/image/${thuoc.getImage()}" width="50" height="50"/>
                        </c:if>
                    </td>
                    <td><span class="text-danger fw-bold">${thuoc.price} ₫</span></td>
                    <td>${thuoc.quantity}</td>
                    <td>
                        <c:choose>
                            <c:when test="${thuoc.status}">
                                <span class="badge bg-success">Còn</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Hết</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${thuoc.id_loai}</td>
                    <td><c:out value="${thuoc.hansudung}"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin?action=thuoc-edit&id=${thuoc.id}" 
                           class="btn btn-sm btn-warning">✏ Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin?action=thuoc-delete&id=${thuoc.id}" 
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Bạn có chắc muốn xóa?')">🗑 Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
