<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Navbar only (no CSS/JS includes) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand fw-bold text-info" href="./">⚡ Cipher Bank</a>

    <div class="ms-auto d-flex align-items-center gap-3">
        <c:if test="${not empty sessionScope.loggeduser}">
            <span class="text-white fw-semibold">${sessionScope.loggeduser.username}</span>
            <div class="dropdown">
                <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-circle fs-5"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="./dashboard">Dashboard</a></li>
                    <li><a class="dropdown-item" href="./about">About</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="./logout">Logout</a></li>
                </ul>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.loggeduser}">
            <a class="btn btn-outline-light me-2" href="./login">Login</a>
            <a class="btn btn-light" href="./signup">Sign Up</a>
        </c:if>
    </div>
</nav>
