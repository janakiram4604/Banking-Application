<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Bank Account | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            color: white;
            padding: 30px;
            max-width: 600px;
            margin: 80px auto;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .form-label {
            font-weight: 500;
        }

        .btn-glow {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: black;
            font-weight: bold;
        }

        .btn-glow:hover {
            opacity: 0.9;
        }

        .form-control, .form-select {
            background-color: rgba(255,255,255,0.1);
            color: white;
            border: 1px solid rgba(255,255,255,0.2);
        }

        .form-control::placeholder {
            color: #ccc;
        }
    </style>
</head>
<body>

<div class="card">
    <h3 class="text-center mb-4">🏦 Create Bank Account</h3>

    <form action="./AccountCreation" method="post">
    	<div class="text-end pe-3">
   			<small>Hello, <strong>${username}</strong></small>
		</div>
    	<c:if test="${not empty status}">
		    <div class="alert alert-${status eq 'Account Creation Successful' ? 'success' : 'danger'} text-center">
		        ${status}
		        <c:if test="${not empty accno}">
		            <br> Your Account No: <strong>${accno}</strong>
		        </c:if>
		    </div>
		</c:if>
        <div class="mb-3">
            <label class="form-label">Account Type</label>
            <select name="account_type" class="form-select" required>
                <option value="">-- Select Type --</option>
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Initial Deposit Amount</label>
            <input type="number" step="0.01" name="account_balance" class="form-control" placeholder="₹1000.00"  min=1000 required>
        </div>

        <div class="mb-3">
            <label class="form-label">Account PIN</label>
            <input type="password" name="account_pin" class="form-control" placeholder="4-digit PIN" required minlength="4" maxlength="4">
        </div>

        <div class="mb-3">
            <label class="form-label">Date of Birth</label>
            <input type="date" name="account_holderDOB" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea name="account_address" rows="2" class="form-control" placeholder="Residential address" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Account Holder Name</label>
            <input type="text" name="account_holderName" class="form-control" placeholder="Full Name" required>
        </div>

        <button class="btn btn-glow w-100">Create Account</button>
    </form>
</div>

</body>
</html>
