<%-- 
    Document   : cart
    Created on : Jul 31, 2025, 3:01:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" type="text/css" href="./css/giohang.css">
    </head>
    <body>
        <h2>Các mặt hàng có trong giỏ hàng!</h2>
        <div style="font-size: 22px">
            <table border ="1">
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <c:set var="s" value="0"/>
                <c:forEach var="p" items="${products}">
                    <tr>
                        <td><c:out value="${p.getId()}"/></td>
                        <td><c:out value="${p.getName()}"/></td>
                        <td><c:out value="${p.getPrice()}"/></td>
                        <td><c:out value="${p.getQuantity()}"/></td>
                        <td><c:out value="${p.getQuantity()*p.getPrice()}"/></td>
                        <c:set var="s" value="${s+p.getQuantity()*p.getPrice()}"/>
                    </tr>
                </c:forEach>
            </table>
        </div>
                <c:out value="Tổng tiền: ${s}"/><br>
        <button onclick="location.href='Delcart'">xóa giỏ hàng</button>
        <button onclick="location.href='home'">tiếp tục mua hàng</button>
    </body>
</html>
