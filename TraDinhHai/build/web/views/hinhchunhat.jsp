<%-- 
    Document   : hinhchunhat
    Created on : Aug 2, 2025, 6:10:05 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tính hình chữ nhật</title>
</head>
<body>
    <h1>Tính hình chữ nhật</h1>
    <form action="hinhchunhat" method="post">
        Nhập chiều dài:<br>
        <input type="text" name="chieudai" required><br>
        Nhập chiều rộng:<br>
        <input type="text" name="chieurong" required><br>
        <button type="submit">Tính</button>
    </form>

    <h2>Kết quả:</h2>
    <c:if test="${not empty error}">
        <p style="color:red;"><c:out value="${error}"/></p>
    </c:if>

    <c:if test="${not empty cv && not empty dt}">
        <p>Chu vi: <c:out value="${cv}"/></p>
        <p>Diện tích: <c:out value="${dt}"/></p>
    </c:if>

    <button><a href="./home">Back</a></button>
</body>
</html>
