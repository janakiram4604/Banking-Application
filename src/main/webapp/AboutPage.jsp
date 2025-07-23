<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        }

        .section-title {
            border-bottom: 2px solid #00f2fe;
            display: inline-block;
            padding-bottom: 5px;
            margin-bottom: 1.5rem;
        }

        .team-card {
            background: rgba(255, 255, 255, 0.06);
            border-radius: 12px;
            padding: 1.5rem;
            color: #ddd;
            transition: 0.3s;
            text-align: center;
        }

        .team-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
        }

        .footer {
            background-color: #111;
            padding: 20px;
            font-size: 0.9rem;
            color: #aaa;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- 🔝 Navbar -->
<jsp:include page="navbar.jsp" />

<!-- 📘 About Content -->
<div class="container py-5">
    <div class="glass-card mb-5">
        <h2 class="section-title">🔐 About Cipher Bank</h2>
        <p class="lead">
            Cipher Bank is a secure and seamless digital banking platform built with modern Java technologies. We aim to simplify your financial life with instant access, powerful tools, and bulletproof encryption.
        </p>
        <ul class="mt-3">
            <li>⚡ Lightning-fast banking transactions</li>
            <li>🔒 End-to-end security & data privacy</li>
            <li>📊 Transparent, minimal, user-friendly design</li>
            <li>🌐 24/7 access across all devices</li>
        </ul>
    </div>

    <!-- 👨‍💻 Developer Section -->
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="team-card">
                <i class="bi bi-person-circle fs-1 text-info"></i>
                <h4 class="mt-3">Janakiram Koduru</h4>
                <p class="mb-1">Full Stack / Backend Java Developer</p>
                <small>Builder of Cipher Bank — crafted with Java, Spring MVC, Hibernate, and MySQL.</small>
            </div>
        </div>
    </div>
</div>

<!-- 🔚 Footer -->
<div class="footer">
    &copy; 2025 Cipher Bank — Built by Janakiram Koduru ❤️.
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
