<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login | Cipher Bank</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            background: #f0f4f8;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 40px;
            border-radius: 20px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.1);
        }
        .form-control {
            border-radius: 12px;
        }
        .toggle-password {
            cursor: pointer;
            position: absolute;
            right: 15px;
            top: 10px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h3 class="text-center mb-4">Welcome back 👋</h3>
    
    <!-- 🔔 Show error if exists -->
    <c:if test="${not empty message}">
        <div class="alert alert-danger text-center" role="alert">
            ${message}
        </div>
    </c:if>
    
    <form action="./loginform" method="post">
        <div class="mb-3 position-relative">
            <label for="username" class="form-label">Username</label>
            <input type="text" required name="username" id="username" class="form-control" placeholder="Enter your username">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <div class="input-group">
                <input type="password" required name="password" id="password" class="form-control" placeholder="Enter your password">
                <span class="input-group-text" id="togglePassword" style="cursor: pointer;">
                    <i class="bi bi-eye-slash" id="eyeIcon"></i>
                </span>
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>

        <div class="text-center mt-3">
            <a href="./forgot">Forgot Password?</a> |
            <a href="signup">Sign Up</a>
        </div>
    </form>
</div>

<!-- 👁️ Toggle Show/Hide Password -->
<script>
const passwordInput = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");
const eyeIcon = document.getElementById("eyeIcon");

togglePassword.addEventListener("click", () => {
    const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
    passwordInput.setAttribute("type", type);

    // toggle icon class
    eyeIcon.classList.toggle("bi-eye");
    eyeIcon.classList.toggle("bi-eye-slash");
});
</script>

</body>
</html>
