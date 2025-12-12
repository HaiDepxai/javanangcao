<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Mua ngay</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/jmakecss/muangay.css">
    </head>
    <body>

        <div class="container form-container">
            <h3 class="form-title">🛒 Đặt hàng ngay</h3>

            <c:if test="${not empty thuoc}">
                <div class="text-center mb-4">
                    <img src="${pageContext.request.contextPath}/assets/image/${thuoc.image}" 
                         alt="${thuoc.name}" class="thuoc-img mx-auto d-block" />

                    <h5 class="mt-3">${thuoc.name}</h5>
                    <p class="text-danger font-weight-bold">${thuoc.price} VNĐ</p>
                </div>

                <form action="${pageContext.request.contextPath}/muangay" method="post">
                    <input type="hidden" name="id" value="${thuoc.id}"/>

                    <div class="form-group">
                        <label for="quantity">Số lượng:</label>
                        <div class="input-group quantity-control">
                            <div class="input-group-prepend">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(-1)">−</button>
                            </div>
                            <input type="number" class="form-control text-center" name="quantity" id="quantity" value="${quantity}" min="1" readonly>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(1)">+</button>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="address">📍 Địa chỉ giao hàng:</label>
                        <textarea class="form-control" name="address" id="address" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="phone">📞 Số điện thoại:</label>
                        <input type="text" class="form-control" name="phone" id="phone" required>
                    </div>

                    <div class="form-group">
                        <label>💳 Chọn phương thức thanh toán:</label>
                        <div class="d-flex flex-wrap justify-content-between">
                            <label class="payment-label">
                                <input type="radio" name="payment" value="vietcombank" required>
                                <img src="${pageContext.request.contextPath}/assets/icon/vietcombank.png" alt="Vietcombank" class="payment-option" />
                            </label>

                            <label class="payment-label">
                                <input type="radio" name="payment" value="mastercard">
                                <img src="${pageContext.request.contextPath}/assets/icon/mastercard.png" alt="MasterCard" class="payment-option" />
                            </label>

                            <label class="payment-label">
                                <input type="radio" name="payment" value="vietinbank">
                                <img src="${pageContext.request.contextPath}/assets/icon/vietinbank.png" alt="Vietinbank" class="payment-option" />
                            </label>

                            <label class="payment-label">
                                <input type="radio" name="payment" value="mb">
                                <img src="${pageContext.request.contextPath}/assets/icon/mb.jpg" alt="MB" class="payment-option" />
                            </label>

                            <label class="payment-label">
                                <input type="radio" name="payment" value="bidv">
                                <img src="${pageContext.request.contextPath}/assets/icon/bidv.png" alt="BIDV" class="payment-option" />
                            </label>

                            <label class="payment-label">
                                <input type="radio" name="payment" value="agribank">
                                <img src="${pageContext.request.contextPath}/assets/icon/agr.jpg" alt="Agribank" class="payment-option" />
                            </label>
                        </div>

                        <div id="cardInfo" class="form-group mt-3" style="display: none;">
                            <label for="cardNumber">🔢 Số thẻ:</label>
                            <input type="text" class="form-control mb-2" id="cardNumber" name="cardNumber" placeholder="Nhập số thẻ">

                            <label for="cardHolder">👤 Tên chủ thẻ:</label>
                            <input type="text" class="form-control mb-2" id="cardHolder" name="cardHolder" placeholder="Nhập tên chủ thẻ">

                            <label for="issueDate">📅 Ngày cấp thẻ:</label>
                            <input type="date" class="form-control" id="issueDate" name="issueDate">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>💰 Tổng tiền:</label>
                        <p id="totalAmount" class="font-weight-bold text-primary">
                            <c:out value="${thuoc.price * quantity}" /> VNĐ
                        </p>
                    </div>

                    <button type="submit" class="btn btn-success btn-block">
                        ✅ Đặt hàng ngay
                    </button>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary btn-block mt-2">⬅️ Quay lại trang chủ</a>
                </form>
            </c:if>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const paymentRadios = document.querySelectorAll('input[name="payment"]');
                const cardInfo = document.getElementById('cardInfo');
                let lastChecked = null; // Lưu lại radio được click lần trước

                paymentRadios.forEach(radio => {
                    radio.addEventListener('click', function () {
                        if (lastChecked === this) {
                            // Nếu nhấn lại radio đang chọn thì bỏ chọn và ẩn phần thẻ
                            this.checked = false;
                            lastChecked = null;
                            cardInfo.style.display = 'none';
                            // Gỡ required
                            document.getElementById("cardNumber").required = false;
                            document.getElementById("cardHolder").required = false;
                            document.getElementById("issueDate").required = false;
                        } else {
                            // Chọn radio mới -> hiển thị phần thẻ
                            lastChecked = this;
                            cardInfo.style.display = 'block';
                            // Thêm required
                            document.getElementById("cardNumber").required = true;
                            document.getElementById("cardHolder").required = true;
                            document.getElementById("issueDate").required = true;
                        }
                    });
                });
            });
        </script>
        <script>
            const price = ${thuoc.price};
            function updateTotal() {
                const quantityInput = document.getElementById('quantity');
                const totalAmount = document.getElementById('totalAmount');

                let quantity = Number(quantityInput.value);
                if (quantity < 1)
                    quantity = 1;

                const total = price * quantity;
                totalAmount.textContent = total.toLocaleString('vi-VN') + ' VNĐ';
            }
            document.addEventListener('DOMContentLoaded', updateTotal);
        </script>
<script>
    function changeQuantity(amount) {
        const quantityInput = document.getElementById("quantity");
        let quantity = parseInt(quantityInput.value) || 1;
        quantity = Math.max(1, quantity + amount); // không nhỏ hơn 1
        quantityInput.value = quantity;
        updateTotal(); // cập nhật tổng tiền
    }

    function updateTotal() {
        const quantity = parseInt(document.getElementById("quantity").value) || 1;
        const total = quantity * price;
        document.getElementById("totalAmount").textContent = total.toLocaleString('vi-VN') + " VNĐ";
    }

    document.addEventListener("DOMContentLoaded", updateTotal);
</script>


    </body>
</html>


