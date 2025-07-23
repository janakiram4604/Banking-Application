<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cipher Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
        }

        .navbar {
            background-color: rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
        }

        .hero {
            padding: 100px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
            color: #00f2fe;
        }

        .hero p {
            color: #ccc;
            margin-bottom: 30px;
        }

        .btn-cypher {
            padding: 12px 30px;
            border-radius: 30px;
            margin: 10px;
            font-weight: 600;
        }

        .features {
            padding: 60px 20px;
            background-color: #1a1a1a;
        }

		.feature-card {
			transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
		}
		.feature-card:hover {
			transform: translateY(-8px);
			box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
		}
        .feature-card {
            background-color: #2a2a2a;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            color: #eee;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.4);
        }

        .feature-card i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #00f2fe;
        }

        footer {
            background-color: #111;
            padding: 20px;
            text-align: center;
            font-size: 0.9em;
            color: #aaa;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="bi bi-shield-lock-fill"></i> Cipher Bank</a>
            <div>
                <a class="btn btn-outline-light me-2 btn-sm" href="login">Login</a>
                <a class="btn btn-light btn-sm" href="./signup">Sign Up</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Encrypted. Empowered. Evolved.</h1>
            <p>Your money, the cipher way — secure and seamless digital banking.</p>
            <a href="login" class="btn btn-cypher btn-primary">Login</a>
            <a href="./signup" class="btn btn-cypher btn-success">Sign Up</a>
        </div>
    </section>

    <!-- Features Section -->
<section class="features py-5 bg-dark text-white">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="fw-bold">Why Choose Cipher Bank?</h2>
      <p class="text-secondary">Fast. Secure. Effortless banking built for the modern world.</p>
    </div>

    <div class="row g-4">
      <!-- Instant Transfers -->
      <div class="col-md-4">
        <div class="p-4 text-center bg-gradient rounded-4 border shadow feature-card h-100">
          <i class="bi bi-lightning-charge-fill fs-1 text-warning mb-3"></i>
          <h5 class="fw-bold">Instant Transfers</h5>
          <p class="text-light">Send and receive money in seconds with zero hidden fees.</p>
        </div>
      </div>

      <!-- Bank-Grade Security -->
      <div class="col-md-4">
        <div class="p-4 text-center bg-gradient rounded-4 border shadow feature-card h-100">
          <i class="bi bi-shield-lock-fill fs-1 text-info mb-3"></i>
          <h5 class="fw-bold">Bank-Grade Security</h5>
          <p class="text-light">Protected with industry-standard encryption and secure infrastructure.</p>
        </div>
      </div>

      <!-- Mobile First -->
      <div class="col-md-4">
        <div class="p-4 text-center bg-gradient rounded-4 border shadow feature-card h-100">
          <i class="bi bi-phone-fill fs-1 text-success mb-3"></i>
          <h5 class="fw-bold">Mobile First</h5>
          <p class="text-light">Access your bank from any device — anywhere, anytime.</p>
        </div>
      </div>
    </div>
  </div>
</section>


    <!-- Footer -->
    <footer>
        &copy; 2025 Cipher Bank. Built with ❤️ for secure banking.
    </footer>

</body>
</html>
    