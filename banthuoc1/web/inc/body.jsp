<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!-- Danh mục thuốc -->
<div class="container mt-4">
    <h3>Danh mục thuốc</h3>
    <a href="#" class="category-btn"><i class="fas fa-eye"></i> Mắt</a>
    <a href="#" class="category-btn"><i class="fas fa-head-side-mask"></i> Tai Mũi Họng</a>
    <a href="#" class="category-btn"><i class="fas fa-lungs"></i> Hô Hấp</a>
</div>

<!-- Sản phẩm theo loại thuốc -->
<c:forEach var="loaithuoc" items="${listLoaithuoc}">
    <section>
        <div class="container my-5">
            <header class="mb-4">
                <h3><c:out value="${loaithuoc.getName()}"/></h3>
            </header>
            <div class="row">
                <c:forEach var="thuoc" items="${listThuoc}">
                    <c:if test="${loaithuoc.getId()==thuoc.getId_loai() && thuoc.isStatus()==true}">
                        <div class="col-lg-3 col-md-6 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <img src="assets/image/${thuoc.getImage()}" class="card-img-top" style="aspect-ratio: 1/1"/>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-type"><c:out value="${thuoc.getName()}"/></h5>
                                    <p class="card-text"><c:out value="${thuoc.getPrice()}"/> VNĐ</p>
                                    <div class="card-footer d-flex justify-content-between align-items-center pt-3 px-2 pb-2 mt-auto">
                                        <!-- Nút Mua ngay -->
                                        <a href="muangay?id=${thuoc.getId()}" class="btn btn-success btn-sm px-3">
                                            <i class="fas fa-bolt"></i> Mua ngay
                                        </a>


                                        <!-- Form Thêm vào giỏ -->
                                        <!-- Nếu đã đăng nhập thì mới hiện nút thêm vào giỏ -->
                                        <c:if test="${not empty user}">
                                            <form action="cart" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="add"/>

                                                <input type="hidden" name="id" value="${thuoc.getId()}"/>
                                                <input type="hidden" name="name" value="${thuoc.getName()}"/>
                                                <input type="hidden" name="price" value="${thuoc.getPrice()}"/>
                                                <input type="hidden" name="quantity" value="1"/>
                                                <input type="hidden" name="image" value="${thuoc.getImage()}"/>
                                                <button type="submit" class="btn btn-primary btn-sm px-3">
                                                    <i class="fas fa-cart-plus"></i> Thêm vào
                                                </button>
                                            </form>
                                        </c:if>

                                        <!-- Nếu chưa login thì hiện nút đăng nhập -->
                                        <c:if test="${empty user}">
                                            <a href="login" class="btn btn-warning btn-sm px-3">
                                                <i class="fas fa-sign-in-alt"></i> Đăng nhập để mua
                                            </a>
                                        </c:if>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </section>
</c:forEach>


