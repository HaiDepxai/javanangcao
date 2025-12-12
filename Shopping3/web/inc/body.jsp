<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="category" items="${listCategory}">
            <section>
                <div class="container my-5">
                    <header class="mb-4">
                        <h3>
                            <c:out value="${category.getName()}"/>
                        </h3>
                    </header>
                    <div class="row">
                        <c:forEach var="product" items="${listProduct}">
                            <c:if test="${category.getId()==product.getId_category() && product.isStatus()==true}">
                                <div class="col-lg-3 col-md-6 d-flex">
                                    <div class="card w-100 my-2 shadow-2-strong">
                                        <img src="assets/images/${product.getImage()}" class="card-img-top" style="aspect-ratio: 1/1"/>
                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-type"><c:out value="${product.getName()}"/></h5>
                                            <p class="card-text"><c:out value="${product.getPrice()}"/>VN?</p>
                                            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                                <a href="#!" class="btn btn-primary shadow-0 me-1">Add to cart</a>
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