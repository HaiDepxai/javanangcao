<%-- 
    Document   : home
    Created on : Jul 31, 2025, 1:28:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/style.css">  
        <div class ="form-container">
    </head>
    <body>
        <h2>Mua hàng</h2>
        <div style="font-size: 22px">
            <%
                if (request.getSession().getAttribute("cart") != null)
                    out.print("Cart item: " + (Integer) request.getSession().getAttribute("num"));
                else
                    out.print("Cart item: 0");
            %>
            <form action ="home" method="post">
                Mã sản phẩm: <br><!-- comment -->
                <input type="text" name="id" required><br><!-- comment -->
                Tên sản phẩm: <br><!-- comment -->
                <input type="text" name="name" required><br><!-- comment -->
                Đơn giá: <br><!-- comment -->
                <input type="text" name="price" required><br><!-- comment -->
                Số lượng: <br><!-- comment -->
                <input type="text" name="quantity" required><br><!-- comment -->
                <div class="button-group">
                    <button type="submit">Thêm vào giỏ hàng</button>
                    <button type="button" onclick="location.href = 'cart'">Xem giỏ hàng</button>
                </div>
            </form>
        </div>
    </body>
</html>
