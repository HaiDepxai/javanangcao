<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<section class="vh-100" style="background-color: #f8f9fa;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-10 col-lg-8 col-xl-7">
        <div class="card shadow-lg border-0 rounded-4">
          <div class="row g-0">
            <!-- Hình ảnh -->
   <!-- Hình ảnh động Lottie -->
   <div class="col-md-6 d-none d-md-block bg-light">
       <div id="loginAnimation" style="height: 300px; width:100%;"></div>
   </div>



            <!-- Form đăng nhập -->
            <div class="col-md-6 d-flex align-items-center">
              <div class="card-body p-5">
                <h3 class="fw-bold mb-4 text-primary">LOGIN</h3>
                
                <c:if test="${not empty login_err}">
                  <div class="alert alert-danger py-2">${login_err}</div>
                </c:if>

                <form action="" method="post">
                  <div class="form-floating mb-3">
                    <input type="text" name="emailphone" class="form-control" id="emailphone" placeholder="Email or phone" required />
                    <label for="emailphone">Email or phone</label>
                  </div>

                  <div class="form-floating mb-3 position-relative">
                    <input type="password" name="password" class="form-control" id="password" placeholder="Password" required />
                    <label for="password">Password</label>
                    <span id="toggle-icon" onclick="togglePassword()" 
                          style="position: absolute; top: 50%; right: 1rem; transform: translateY(-50%); cursor: pointer; user-select: none;">
                      👁
                    </span>
                  </div>

                  <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="remember" />
                    <label class="form-check-label" for="remember">Remember me</label>
                    <a href="#!" class="float-end text-decoration-none">Forgot password?</a>
                  </div>

                  <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">Login</button>
                  </div>

                  <p class="text-center mt-4 mb-0">Don't have an account?
                    <a href="register" class="text-danger fw-semibold text-decoration-none">Sign up</a><br>or
                     <a href="home" class="text-danger fw-semibold text-decoration-none">back</a>
                  </p>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Thêm script bên dưới -->
  <script>
    function togglePassword() {
      const passwordField = document.getElementById("password");
      const icon = document.getElementById("toggle-icon");
      const isPassword = passwordField.type === "password";
      passwordField.type = isPassword ? "text" : "password";
      icon.textContent = isPassword ? "🙈" : "👁";
    }
  </script>
</section>
<!-- 1. Lottie Library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.10.1/lottie.min.js"></script>

<script>
  lottie.loadAnimation({
    container: document.getElementById('loginAnimation'),
    renderer: 'svg',
    loop: true,
    autoplay: true,
    path: 'https://assets5.lottiefiles.com/packages/lf20_1jXwep7pBb.json' // Ví dụ đường dẫn JSON khác
  });
</script>

