<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Money | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #0c1f36;
            color: white;
            font-family: 'Segoe UI', sans-serif;
        }

        .glass-form {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            max-width: 500px;
            margin: 80px auto;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }

        .btn-gradient {
            background: linear-gradient(to right, #fc466b, #3f5efb);
            border: none;
            font-weight: bold;
            color: white;
        }

        .btn-gradient:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp" />

    <div class="glass-form">
        <h4 class="mb-4">💸 Withdraw Funds</h4>

        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
            <c:remove var="success" scope="request" />
            <script>
		        setTimeout(function() {
		            window.location.href = 'dashboard';
		        }, 2000); 
    		</script>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
            <c:remove var="error" scope="request" />
        </c:if>

        <form action="./withdraw" method="post">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" name="accountno" class="form-control" min="10" max="15" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Withdraw Amount</label>
                <input type="number" name="amount" class="form-control" required min="1">
            </div>
            <div class="mb-3">
                <label class="form-label">Account PIN</label>
                <input type="password" name="pin" class="form-control" required>
            </div>
            <button class="btn btn-gradient w-100">Withdraw</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
