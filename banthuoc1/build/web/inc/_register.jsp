<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<section class="py-5" style="background: linear-gradient(135deg, #74ebd5, #acb6e5); min-height: 100vh;">
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-md-10 col-lg-8">
        <div class="card shadow-lg border-0 rounded-5 overflow-hidden">
          <div class="row g-0">
            <!-- Form bên trái -->
            <div class="col-md-6 p-5 bg-white">
              <h2 class="text-center mb-4 fw-bold" style="color: #007bff;">Sign Up</h2>

              <form action="" method="post">
                <!-- Name -->
                <div class="form-group mb-3">
                  <label class="form-label">👤 Your Name</label>
                  <input type="text" name="name" class="form-control" value="${name}" required>
                </div>

                <!-- Email -->
                <div class="form-group mb-3">
                  <label class="form-label">📧 Your Email</label>
                  <input type="email" name="email" class="form-control" value="${email}" required>
                  <div class="text-danger">${email_err}</div>
                </div>

                <!-- Password -->
                <div class="form-group mb-3 position-relative">
                  <label class="form-label">🔒 Password</label>
                  <input type="password" name="password1" id="password1" class="form-control" required>
                  <span class="toggle-password" onclick="togglePassword('password1', this)"
                        style="position: absolute; top: 38px; right: 10px; cursor: pointer;">👁</span>
                </div>

                <!-- Repeat password -->
                <div class="form-group mb-3 position-relative">
                  <label class="form-label">🔁 Repeat your password</label>
                  <input type="password" name="password2" id="password2" class="form-control" required>
                  <span class="toggle-password" onclick="togglePassword('password2', this)"
                        style="position: absolute; top: 38px; right: 10px; cursor: pointer;">👁</span>
                  <div class="text-danger">${pass_err}</div>
                </div>

                <!-- Phone -->
                <div class="form-group mb-4">
                  <label class="form-label">📱 Your Phone</label>
                  <input type="text" name="phone" class="form-control" value="${phone}" required>
                  <div class="text-danger">${phone_err}</div>
                </div>

                <!-- Submit -->
                <div class="d-grid mb-3">
                  <button type="submit" class="btn btn-primary btn-lg">Register</button>
                </div>

                <!-- Link to Login -->
                <p class="text-center mb-0">Already have an account?
                  <a href="login" class="text-decoration-none text-primary fw-bold">Login here</a>
                </p>
              </form>
            </div>

            <!-- Ảnh bên phải -->
            <div class="col-md-6 d-none d-md-block bg-light">
                <div id="signUpAnimation" class="h-100"></div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Toggle Password Script -->
<script>
  function togglePassword(fieldId, icon) {
    const input = document.getElementById(fieldId);
    const isPassword = input.type === 'password';
    input.type = isPassword ? 'text' : 'password';
    icon.textContent = isPassword ? '🙈' : '👁'; // Change icon if needed
  }
</script>
<script>
  lottie.loadAnimation({
    container: document.getElementById('signUpAnimation'), // id div chứa animation
    renderer: 'svg',
    loop: true,
    autoplay: true,
    path: 'https://assets9.lottiefiles.com/packages/lf20_jcikwtux.json'  // link animation JSON
  });
</script>
