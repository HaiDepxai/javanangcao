<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Kết quả tìm kiếm cho: "<c:out value="${keyword}"/>"</h2>
    <hr>

    <c:if test="${empty thuocList}">
        <div class="alert alert-warning">
            Không tìm thấy thuốc nào.
        </div>
    </c:if>

    <c:if test="${not empty thuocList}">
        <div class="row">
            <c:forEach var="thuoc" items="${thuocList}">
                <div class="col-md-3 mb-3">
                    <div class="card h-100">
                        <c:if test="${not empty thuoc.image}">
                           <img src="assets/image/${thuoc.getImage()}" class="card-img-top" style="aspect-ratio: 1/1"/>

                        </c:if>
                        <div class="card-body">
                            <h5 class="card-title">${thuoc.name}</h5>
                            <p class="card-text">Giá: ${thuoc.price} VNĐ</p>
                            <p class="card-text">
                                <c:choose>
                                    <c:when test="${thuoc.status}">Còn hàng</c:when>
                                    <c:otherwise>Hết hàng</c:otherwise>
                                </c:choose>
                            </p>
                            <a href="cart?action=add&id=${thuoc.id}" class="btn btn-primary btn-sm">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>
</body>
</html> 
