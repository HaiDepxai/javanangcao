<%-- 
    Document   : circle
    Created on : Aug 2, 2025, 5:46:37 PM
    Author     : ADMIN
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hình tròn</title>
    </head>
    <body>
        <h1>Hình tròn</h1>
        <form action="circle" method="post" style="font-size:20pt;">
            Nhập bán kính:<br>
            <input type="text" name="bankinh" required><br>
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


