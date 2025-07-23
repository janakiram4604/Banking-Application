<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #101820;
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

        .section-title {
            font-weight: bold;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            padding-bottom: 8px;
            margin-bottom: 1.2rem;
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

        .scroll-table {
            max-height: 250px;
            overflow-y: auto;
        }

        .scroll-table::-webkit-scrollbar {
            width: 8px;
        }

        .scroll-table::-webkit-scrollbar-thumb {
            background: rgba(255,255,255,0.2);
            border-radius: 10px;
        }

        .navbar-brand {
            font-weight: bold;
            color: #00f2fe;
        }

        .profile-icon {
            background-color: #00f2fe;
            color: black;
            padding: 6px 10px;
            border-radius: 50%;
            font-size: 18px;
        }
    </style>
</head>
<body>

<!-- 🔝 Navbar -->
    <jsp:include page="navbar.jsp" />
<!-- ✅ Main Container -->
<div class="container my-5">

    <!-- 🌱 No Account Exists -->
    <c:if test="${not empty username and empty account}">
        <div class="glass-card mx-auto" style="max-width: 500px;">
            <h4 class="section-title">🚀 Create Your Bank Account</h4>
            <form action="./create-account" method="post">
                <div class="mb-3">
                    <label class="form-label">Account Type</label>
                    <select name="type" class="form-select" required>
                        <option value="">-- Select --</option>
                        <option value="Saving">Saving</option>
                        <option value="Current">Current</option>
                    </select>
                </div>
                <button class="btn btn-gradient w-100">Create Account</button>
            </form>
        </div>
    </c:if>

    <!-- 🔐 Account exists but not logged in -->
    <c:if test="${not empty account and not accountLoggedIn}">
        <div class="glass-card mx-auto" style="max-width: 500px;">
            <h4 class="section-title">🔐 Bank Account Login</h4>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
                <c:remove var="error" scope="request" />
            </c:if>
            <form action="./bank-login" method="post">
                <div class="mb-3">
                    <label class="form-label">Account Number</label>
                    <input type="text" name="accno" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Account PIN</label>
                    <input type="password" name="accpass" class="form-control" required>
                </div>
                <button class="btn btn-gradient w-100">Login to Account</button>
            </form>
        </div>
    </c:if>

    <!-- ✅ Logged in fully -->
    <c:if test="${not empty account and accountLoggedIn}">
        <div class="row g-4">
            <!-- 💸 Balance & Actions -->
            <div class="col-md-4">
                <div class="glass-card text-center">
                    <h5 class="text-info">💸 Balance</h5>
                    <h2 class="mt-3 text-success">₹ ${account.account_balance}</h2>
                     <p class="text-light small mb-1">Account No: <strong>${account.account_no}</strong></p>
                    <p class="text-muted">Type: ${account.account_type}</p>
                    <div class="d-grid gap-2 mt-4">
                        <a href="./deposit-form" class="btn btn-gradient" target="_self">Deposit</a>
                        <a href="./withdraw-form" class="btn btn-gradient" target="_self">Withdraw</a>
                        <a href="./change-pin-form" class="btn btn-gradient" target="_self">Change PIN</a>
                    </div>
                </div>
            </div>

            <!-- 🔄 Transactions -->
            <div class="col-md-8">
                <div class="glass-card">
                    <h5 class="section-title">🔄 Recent Transactions</h5>
                    <div class="scroll-table">
                        <table class="table table-dark table-hover table-sm">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Type</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="txn" items="${transactions}">
                                    <tr>
                                        <td>${txn.timestamp}</td>
                                        <td>${txn.type}</td>
                                        <td>₹ ${txn.amount}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
