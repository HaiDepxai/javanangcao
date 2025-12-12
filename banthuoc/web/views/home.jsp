<%-- 
    Document   : home
    Created on : Aug 15, 2025, 10:06:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:forEach var="loaithuoc" items="${listloaithuoc}">
        <li><a class="dropdown-item" href="#">
                <c:out value="${loaithuoc.getName()}"/><br> 
            </a></li>
        </c:forEach>
    </body>
</html>
