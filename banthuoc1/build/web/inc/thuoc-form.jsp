<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><c:choose><c:when test="${not empty thuoc}">Sửa Thuốc</c:when><c:otherwise>Thêm Thuốc</c:otherwise></c:choose></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">
        <c:choose>
            <c:when test="${not empty thuoc}">Sửa Thuốc</c:when>
            <c:otherwise>Thêm Thuốc</c:otherwise>
        </c:choose>
    </h2>

    <form action="${pageContext.request.contextPath}/admin" method="post">
        <input type="hidden" name="id" value="${thuoc.id}"/>
        <input type="hidden" name="action" value="<c:choose><c:when test='${not empty thuoc}'>thuoc-update</c:when><c:otherwise>thuoc-insert</c:otherwise></c:choose>"/>

        <div class="mb-3">
            <label class="form-label">Tên Thuốc</label>
            <input type="text" class="form-control" name="name" value="${thuoc.name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh (URL)</label>
            <input type="text" class="form-control" name="image" value="${thuoc.image}">
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" step="0.01" class="form-control" name="price" value="${thuoc.price}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số lượng</label>
            <input type="number" class="form-control" name="quantity" value="${thuoc.quantity}" required>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="status" <c:if test="${thuoc != null && thuoc.status}">checked</c:if>>
            <label class="form-check-label">Còn thuốc</label>
        </div>

        <div class="mb-3">
            <label class="form-label">ID Loại</label>
            <input type="number" class="form-control" name="id_loai" value="${thuoc.id_loai}">
        </div>

        <div class="mb-3">
            <label class="form-label">Hạn sử dụng</label>
            <input type="date" class="form-control" name="hansudung"
                   value="<c:if test='${not empty thuoc.hansudung}'>${fn:substring(thuoc.hansudung.toString(),0,10)}</c:if>">
        </div>

        <button type="submit" class="btn btn-success">Lưu</button>
        <a href="${pageContext.request.contextPath}/admin?action=thuoc-list" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
