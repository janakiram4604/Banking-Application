<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change PIN | Cipher Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #101820;
            color: white;
            font-family: 'Segoe UI', sans-serif;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }
        .btn-gradient {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            font-weight: bold;
            border: none;
        }
        .btn-gradient:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>

<div class="container my-5" style="max-width: 500px;">
    <div class="glass-card">
        <h3 class="text-center mb-4">🔐 Change Account PIN</h3>

        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        	<script>
		        setTimeout(function() {
		            window.location.href = 'dashboard';
		        }, 2000); 
    		</script>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="./change-pin" method="post">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" name="accountno" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Current PIN</label>
                <input type="password" name="oldpin" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">New PIN</label>
                <input type="password" name="newpin" class="form-control" required>
            </div>
            <button class="btn btn-gradient w-100">Update PIN</button>
        </form>
    </div>
</div>

</body>
</html>
