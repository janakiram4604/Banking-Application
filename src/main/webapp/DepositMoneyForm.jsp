<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-box {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 15px;
            max-width: 500px;
            margin: 80px auto;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
        }

        .btn-cypher {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            font-weight: bold;
            border: none;
        }

        .btn-cypher:hover {
            opacity: 0.9;
        }

        .text-light-blue {
            color: #00f2fe;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp" />

    <div class="form-box">
        <h3 class="text-center text-light-blue mb-4"><i class="bi bi-piggy-bank-fill"></i> Deposit Money</h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
            <c:remove var="error" scope="request" />
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success text-center">${success}</div>
            <c:remove var="success" scope="request" />
            <script>
		        setTimeout(function() {
		            window.location.href = 'dashboard';
		        }, 2000); 
    		</script>
        </c:if>

        <form method="post" action="./deposit">
        	<div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" name="accountno" class="form-control" required min="10" max="15" placeholder="Enter Account Number">
            </div>
            <div class="mb-3">
                <label class="form-label">Amount (₹)</label>
                <input type="number" name="amount" class="form-control" required min="100" placeholder="Enter deposit amount">
            </div>
            <div class="mb-3">
                <label class="form-label">Account PIN</label>
                <input type="password" name="pin" class="form-control" required placeholder="Enter your account PIN">
            </div>
            <button type="submit" class="btn btn-cypher w-100 mt-3">Deposit</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
