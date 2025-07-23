<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #1f1c2c, #928dab);
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: none;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 10px;
            color: white;
        }

        .form-control::placeholder {
            color: #ddd;
        }

        .btn-signup {
            width: 100%;
            border-radius: 30px;
            padding: 12px;
            font-weight: bold;
            background: #00f2fe;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            border: none;
            color: black;
        }

        .btn-signup:hover {
            opacity: 0.9;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #00f2fe;
        }

    </style>
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card col-md-6 col-lg-4">
            <div class="text-center mb-4 logo">Cipher Bank Signup</div>
            	<c:if test="${not empty message}">
					    <div class="alert alert-danger text-center" role="alert">
					        ${message}
					    </div>
				</c:if>            	
           <form class="needs-validation" novalidate action="./signupform" method="post">
			    <div class="mb-3">
			        <label class="form-label">Username</label>
			        <input type="text" name="username" class="form-control" placeholder="Enter your username" required minlength="4">
			        <div class="invalid-feedback">Username must be at least 4 characters.</div>
			    </div>
			
			    <div class="mb-3">
			        <label class="form-label">Password</label>
			        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required minlength="6">
			        <div class="invalid-feedback">Password must be at least 6 characters.</div>
			    </div>
			
			    <div class="mb-3">
			        <label class="form-label">Re-enter Password</label>
			        <input type="password" id="repassword" class="form-control" placeholder="Re-enter your password" required>
			        <div class="invalid-feedback" id="match-error">Passwords do not match.</div>
			    </div>
			
			    <button type="submit" class="btn btn-signup mt-3">Create Account</button>
			</form>

            <div class="text-center mt-3">
                <small>Already have an account? <a href="login" style="color: #00f2fe;">Login</a></small>
            </div>
        </div>
    </div>
	<script>
		(function () {
		    'use strict';
		    const forms = document.querySelectorAll('.needs-validation');

		    Array.from(forms).forEach(form => {
		        form.addEventListener('submit', function (event) {
		            const pwd = document.getElementById("password").value;
		            const repwd = document.getElementById("repassword").value;
		            const matchError = document.getElementById("match-error");

		            if (!form.checkValidity() || pwd !== repwd) {
		                event.preventDefault();
		                event.stopPropagation();

		                if (pwd !== repwd) {
		                    matchError.style.display = "block";
		                } else {
		                    matchError.style.display = "none";
		                }
		            }

		            form.classList.add('was-validated');
		        }, false);
		    });
		})();

	</script>
	
</body>
</html>
    