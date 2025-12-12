<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="cart-container container my-5">
    <h2 class="cart-title">🛒 Giỏ hàng của bạn</h2>

    <c:if test="${empty cart}">
        <div class="alert alert-warning text-center">
            Giỏ hàng trống! <a href="${pageContext.request.contextPath}/home" class="btn btn-sm btn-primary ms-2">Mua sắm ngay</a>
        </div>
    </c:if>

    <c:if test="${not empty cart}">
        <div class="cart-items">
            <c:forEach var="item" items="${cart}">
                <div class="cart-item d-flex align-items-center shadow-sm p-3 mb-3 rounded">
                    <img src="assets/image/${item.image}" class="cart-img rounded" alt="${item.name}" style="width:80px;height:80px;object-fit:cover;">
                    
                    <div class="cart-info flex-grow-1 ms-3">
                        <h5 class="mb-1">${item.name}</h5>
                        <p class="text-muted mb-1">Giá: <strong class="text-danger">${item.price}₫</strong></p>
                        <p class="mb-0">Số lượng: <span class="badge bg-primary">${item.quantity}</span></p>
                    </div>

                    <div class="cart-total text-end me-3">
                        <span class="fw-bold text-success">${item.totalPrice}₫</span>
                    </div>

                    <!-- Nút xoá -->
                    <form action="cart" method="post" class="d-inline">
                        <input type="hidden" name="action" value="remove"/>
                        <input type="hidden" name="id" value="${item.id}"/>
                        <button type="submit" class="btn btn-outline-danger btn-sm">
                            <i class="fas fa-trash"></i> Xoá
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
        <!-- Tổng tiền giỏ hàng -->
<div class="cart-summary text-end mt-4">
    <h4>
        Tổng cộng: 
        <span class="text-danger fw-bold">
            <c:set var="grandTotal" value="0"/>
            <c:forEach var="item" items="${cart}">
                <c:set var="grandTotal" value="${grandTotal + item.totalPrice}"/>
            </c:forEach>
            ${grandTotal}₫
        </span>
    </h4>
</div>


        <div class="cart-actions d-flex justify-content-between mt-4">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-primary btn-lg">
                <i class="fas fa-arrow-left"></i> Tiếp tục mua
            </a>
            <a href="${pageContext.request.contextPath}/views/thanhtoanthanhcong.jsp" 
   class="btn btn-success btn-lg">
   Thanh toán <i class="fas fa-credit-card"></i>
</a>

        </div>
    </c:if>
</div>


<script>
$(document).ready(function () {
    console.log("Script AJAX thêm vào giỏ hàng chạy rồi!");

    $(".add-to-cart-form").submit(function (e) {
        e.preventDefault();
        console.log("Submit form bắt được!");

        const form = $(this);
        const formData = form.serialize();

        $.ajax({
            url: "cart",
            type: "POST",
            data: formData,
            success: function () {
                console.log("Thêm giỏ hàng thành công!");
                let countElem = $("#cart-count");
                if (countElem.length) {
                    let count = parseInt(countElem.text());
                    countElem.text(count + 1);
                }
                alert("✅ Đã thêm vào giỏ hàng!");
            },
            error: function () {
                alert("❌ Thêm vào giỏ hàng thất bại!");
            }
        });
    });
});
</script>
