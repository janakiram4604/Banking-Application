<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password | Cipher Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-dark text-light d-flex align-items-center justify-content-center vh-100">

<div class="card p-4 shadow" style="width: 400px;">
    <h4 class="mb-3 text-center">🔒 Reset Your Password</h4>
    <form action="./reset-password" method="post" onsubmit="return validatePasswords()">
        <input type="hidden" name="username" value="${username}" />

        <!-- New Password -->
        <div class="mb-3">
            <label class="form-label">New Password</label>
            <div class="input-group">
                <input type="password" id="password" name="password" class="form-control" required>
                <span class="input-group-text" onclick="togglePassword('password', this)" style="cursor:pointer;">
                    <i class="bi bi-eye-slash"></i>
                </span>
            </div>
        </div>

        <!-- Password Strength -->
        <div class="mb-2">
            <div class="progress" style="height: 5px;">
                <div id="strengthBar" class="progress-bar" role="progressbar"></div>
            </div>
            <small id="strengthText" class="text-light"></small>
        </div>

        <!-- Re-enter Password -->
        <div class="mb-3">
            <label class="form-label">Re-enter Password</label>
            <div class="input-group">
                <input type="password" id="repassword" class="form-control" required>
                <span class="input-group-text" onclick="togglePassword('repassword', this)" style="cursor:pointer;">
                    <i class="bi bi-eye-slash"></i>
                </span>
            </div>
        </div>

        <!-- Error Message -->
        <div id="error" class="text-danger mb-2" style="display:none;"></div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-success w-100">Reset Password</button>

        <!-- Success Toast -->
        <c:if test="${not empty message}">
            <script>
                Swal.fire({
                    toast: true,
                    position: 'top-end',
                    icon: 'success',
                    title: '${message}',
                    showConfirmButton: false,
                    timer: 5000,
                    timerProgressBar: true,
                    didClose: () => {
                        window.location.href = './login';
                    }
                });
            </script>
        </c:if>
    </form>
</div>

<!-- JS Section -->
<script>
    function validatePasswords() {
        const pwd = document.getElementById("password").value;
        const repwd = document.getElementById("repassword").value;
        const errorDiv = document.getElementById("error");

        if (pwd !== repwd) {
            errorDiv.textContent = "Passwords do not match.";
            errorDiv.style.display = "block";
            return false;
        }
        errorDiv.style.display = "none";
        return true;
    }

    function togglePassword(fieldId, span) {
        const input = document.getElementById(fieldId);
        const icon = span.querySelector('i');
        const isPassword = input.type === "password";
        input.type = isPassword ? "text" : "password";
        icon.classList.toggle("bi-eye");
        icon.classList.toggle("bi-eye-slash");
    }

    document.getElementById("password").addEventListener("input", function () {
        const pwd = this.value;
        const bar = document.getElementById("strengthBar");
        const text = document.getElementById("strengthText");

        let strength = 0;
        if (pwd.length >= 6) strength++;
        if (/[A-Z]/.test(pwd)) strength++;
        if (/[0-9]/.test(pwd)) strength++;
        if (/[\W]/.test(pwd)) strength++;

        bar.classList.remove("bg-danger", "bg-warning", "bg-success");
        switch (strength) {
            case 0:
            case 1:
                bar.style.width = "33%";
                bar.classList.add("bg-danger");
                text.textContent = "Weak password";
                break;
            case 2:
            case 3:
                bar.style.width = "66%";
                bar.classList.add("bg-warning");
                text.textContent = "Moderate password";
                break;
            case 4:
                bar.style.width = "100%";
                bar.classList.add("bg-success");
                text.textContent = "Strong password 💪";
                break;
        }
    });
</script>

</body>
</html>
