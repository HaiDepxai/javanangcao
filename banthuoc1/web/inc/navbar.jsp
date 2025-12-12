<%@page import="java.util.List"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="assets/icon/nt5.png" width="80" height="80"/>
            <i class="fas fa-capsules"></i> Nhà Thuốc Đình Hải
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="home"><i class="fas fa-home"></i> Trang chủ</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/sanpham"><i class="fas fa-pills"></i> Sản phẩm</a>
                </li>

                <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-phone"></i> Liên hệ</a></li>
                    <c:if test="${user == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login"><i class="fas fa-sign-in-alt" style="margin-right:6px;"></i>Đăng nhập</a>
                    </li>
                </c:if>

                <c:if test="${user != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Hi ${user.shortName}
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Profile</a></li>          
                            <li><a class="dropdown-item" href="logout">Logout</a></li>   
                        </ul>
                    </li>
                </c:if>

            </ul>
            <form class="d-flex" action="${pageContext.request.contextPath}/Search" method="get">
                <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm kiếm thuốc..." required>
                <button class="btn btn-light" type="submit"><i class="fas fa-search"></i></button>
            </form>

            </form>

            <%
                List<model.Cart> cart = (List<model.Cart>) session.getAttribute("cart");
                int cartSize = 0;
                if (cart != null) {
                    for (model.Cart item : cart) {
                        cartSize += item.getQuantity(); // cộng dồn số lượng
                    }
                }
                request.setAttribute("cartSize", cartSize);
            %>

            <a href="cart" class="btn btn-warning">
                🛒 Giỏ hàng (<c:out value="${cartSize}"/>)
            </a>
        </div>
    </div>
</nav>
