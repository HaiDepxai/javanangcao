<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="bannerCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="6000">
  <div class="carousel-inner">

    <!-- Slide 1 -->
    <div class="carousel-item active">
      <div class="jumbotron d-flex align-items-center text-center text-white"
           style="height: 400px; 
                  background: linear-gradient(-45deg, #ff512f, #dd2476, #24c6dc, #5433ff, #20bdff, #a5fecb);
                  background-size: 500% 500%;
                  animation: gradientBG 15s ease infinite;">
        <div class="container">
          <h1 class="display-3 fw-bold mb-3 animate-fade">💊 Nhà Thuốc Đình Hải</h1>
          <p class="lead fs-4 animate-fade-delay">Sức khỏe của bạn là sứ mệnh của chúng tôi</p>
          <div class="mt-4 animate-fade-delay2">
            <a href="sanpham" class="btn btn-warning btn-lg px-4 me-3 shadow">🛒 Xem sản phẩm</a>
            <a href="#lienhe" class="btn btn-outline-light btn-lg px-4 shadow">📞 Liên hệ ngay</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 2 -->
    <div class="carousel-item">
      <div class="jumbotron d-flex align-items-center text-center text-white"
           style="height: 400px; 
                  background: linear-gradient(-45deg, #1e3c72, #2a5298, #6dd5ed, #2193b0, #6dd5fa);
                  background-size: 500% 500%;
                  animation: gradientBG 15s ease infinite;">
        <div class="container">
          <h1 class="display-3 fw-bold mb-3 animate-fade">🌿 Sản phẩm chính hãng</h1>
          <p class="lead fs-4 animate-fade-delay">Cam kết an toàn - chất lượng - uy tín</p>
          <div class="mt-4 animate-fade-delay2">
            <a href="#uudai" class="btn btn-success btn-lg px-4 me-3 shadow">🔥 Ưu đãi hôm nay</a>
            <a href="#lienhe" class="btn btn-outline-light btn-lg px-4 shadow">📩 Liên hệ</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 3 -->
    <div class="carousel-item">
      <div class="jumbotron d-flex align-items-center text-center text-white"
           style="height: 400px; 
                  background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #fad0c4, #fbc2eb, #a1c4fd, #c2e9fb);
                  background-size: 500% 500%;
                  animation: gradientBG 15s ease infinite;">
        <div class="container">
          <h1 class="display-3 fw-bold mb-3 animate-fade">🚚 Giao hàng toàn quốc</h1>
          <p class="lead fs-4 animate-fade-delay">Nhanh chóng – tiện lợi – tận nơi</p>
          <div class="mt-4 animate-fade-delay2">
            <a href="sanpham" class="btn btn-primary btn-lg px-4 me-3 shadow">📦 Mua ngay</a>
            <a href="#support" class="btn btn-outline-light btn-lg px-4 shadow">💬 Hỗ trợ</a>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Nút điều khiển -->
  <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>