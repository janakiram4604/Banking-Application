<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Signup Success | Cipher Bank</title>
    <meta http-equiv="refresh" content="5;URL=./login" /> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>

    <style>
        body {
            background: #f0f8ff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .success-card {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-card h2 {
            color: #28a745;
            margin-bottom: 10px;
        }
        .btn-login {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="success-card">
    <h2>✅ Signup Successful!</h2>
    <p>
        Welcome
        <strong>
            <%-- Print username if present, otherwise show fallback --%>
            ${username != null ? username : "to Cipher Bank"}
        </strong>
        .<br/>You’ll be redirected to login page...
    </p>
    
    <a href="login" class="btn btn-primary btn-login">Login Now</a>
</div>

<script>
    confetti({
        particleCount: 100,
        spread: 70,
        origin: { y: 0.6 }
    });
</script>

</body>
</html>
