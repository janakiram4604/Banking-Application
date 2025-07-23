<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password | Cipher Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light d-flex align-items-center justify-content-center vh-100">

<div class="card p-4 shadow" style="width: 400px;">
	<c:if test="${not empty message}">
		<div class="alert alert-danger text-center" role="alert">
				${message}
		</div>
    </c:if>   
    <h4 class="mb-3 text-center">🔐 Forgot Password</h4>
    <form action="./validate-user" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Enter your username</label>
            <input type="text" name="username" id="username" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Next</button>
    </form>
</div>
</body>
</html>