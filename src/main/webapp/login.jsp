<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>StyleCart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet" href="CSS/login.css">
</head>
<body>

	<!------------------------------------ HEADER ------------------------------------>
	<header class="shadow-sm">

		<div class="container py-3">
			<div class="row align-items-center">

				<!-- LOGO -->
				<div class="col-lg-3 col-6 logo">
					<h3>
						<i class="fa-solid fa-cart-shopping"></i> StyleCart
					</h3>
				</div>

				<!-- SEARCH (DESKTOP ONLY) -->
				<div class="col-lg-6 d-none d-lg-block">
					<div class="search-box">
						<input type="text" placeholder="Search for products..."
							class="form-control"> <i class="fa fa-search"></i>
					</div>
				</div>

				<!-- DESKTOP ICONS -->
				<div class="col-lg-3 d-none d-lg-flex justify-content-end icons">

					<div class="icon-item">
						<a href="WishlistServlet"  class="text-decoration-none  text-dark"><i class="fa-regular fa-heart"></i> <span>Wishlist</span></a>
					</div>

					<div class="icon-item">
						<a href="CartServlet" class="text-decoration-none  text-dark"><i class="fa-solid fa-cart-shopping"></i> <span>Cart</span></a>
					</div>

					<div class="icon-item dropdown">
						<a href="#" class="text-decoration-none text-dark dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa-regular fa-user"></i>
							<span>Profile</span>
						</a>

						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="profile.jsp"> My
									Profile</a></li>
							<li><a class="dropdown-item" href="MyOrdersServlet">My Orders</a></li>

						</ul>
					</div>
					<div class="icon-item">
						<a href="register.jsp" class="text-decoration-none text-dark"><i
							class="fa-solid fa-user-plus"></i> SignUp</a>
					</div>

				</div>


				<!-- HAMBURGER BUTTON (MOBILE/TAB) -->
				<div class="col-6 d-lg-none text-end">

					<button class="btn menu-btn" data-bs-toggle="offcanvas"
						data-bs-target="#mobileMenu">
						<i class="fa fa-bars"></i>
					</button>

				</div>

			</div>
		</div>


		<!-- DESKTOP MENU -->
		<div class="menu-bar d-none d-lg-block">
			<div
				class="container d-flex justify-content-between align-items-center gap-5">

				<div class="dropdown categories">
					<a class="btn dropdown-toggle text-white" href="#" role="button"
						data-bs-toggle="dropdown"> <i class="fa fa-bars"></i> All
						Categories
					</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="shop?category=Jacket">Jacket</a></li>
						<li><a class="dropdown-item" href="shop?category=Shirt">Shirt</a></li>
						<li><a class="dropdown-item" href="shop?category=Tshirt">Tshirt</a></li>
						<li><a class="dropdown-item" href="shop?category=Jeans">Jeans</a></li>
						<li><a class="dropdown-item" href="shop?category=Blazer">Blazer</a></li>
						<li><a class="dropdown-item" href="shop?category=Trouser">Trouser</a></li>
					</ul>
				</div>

				<ul class="nav pe-5 me-5">
					<li class="nav-item"><a class="nav-link active"
						href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="shop">Shop</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Brands</a></li>
				</ul>

				<div class="offers ms-5 ps-5">
					<i class="fa-solid fa-truck"></i> Free Shipping On Orders Over 500
				</div>

				<div class="offers">
					<i class="fa-solid fa-gift"></i> New Arrivals Daily
				</div>

			</div>
		</div>

	</header>


	<!-- OFFCANVAS MENU -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenu">

		<div class="offcanvas-header">
			<h5 class="offcanvas-title">FreshCart Menu</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>

		<div class="offcanvas-body">

			<!-- SEARCH -->
			<div class="search-box mb-4">
				<input type="text" placeholder="Search products..."
					class="form-control"> <i class="fa fa-search"></i>
			</div>

			<!-- MENU -->
			<ul class="mobile-menu">

				<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>

				<li><a href="shop"><i class="fa fa-store"></i> Shop</a></li>

				<li><a href="#"><i class="fa fa-tags"></i> Brands</a></li>

				<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>

				<li><a href="#"><i class="fa fa-cart-shopping"></i> Cart</a></li>

				<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>

				<li><a href="register.jsp"
					class="text-decoration-none text-dark"><i
						class="fa-solid fa-user-plus"></i> SignUp</a></li>



			</ul>

		</div>
	</div>


	<!------------------------------------Login form ------------------------------------->

	<section>

		<div class="container login-container my-4">
			<div class="row min-vh-100">
				<div class="col-lg-6 brand-section">
					<div class="logo-box">
						<i class="bi bi-gem"></i>
					</div>
					<h1>Welcome Back to StyleCart</h1>
					<p class="px-md-5">Access your curated wardrobe, luxury style
						guides, and exclusive member-only collections.</p>

					<div class="row feature-icon-group g-0">
						<div class="col-4 feature-item">
							<i class="bi bi-truck"></i> Global Shipping
						</div>
						<div class="col-4 feature-item">
							<i class="bi bi-shield-check"></i> Authentic Luxury
						</div>
						<div class="col-4 feature-item">
							<i class="bi bi-headset"></i> Style Concierge
						</div>
					</div>
				</div>


				<!------------------------------------Form ------------------------------------>

				<div class="col-lg-6 form-section">
					<div class="mx-auto" style="max-width: 450px; width: 100%;">
						<h2 class="fw-bold mb-1">Welcome Back</h2>
						<p class="text-muted mb-4">Sign in to continue your bespoke
							shopping experience.</p>

						<a href="#" class="social-btn"> <img
							src="images/Illustrations/google-icon-logo-svgrepo-com.svg"
							width="18" alt="Google"> Continue with Google
						</a> <a href="#" class="social-btn"> <i
							class="bi bi-facebook text-primary"></i> Continue with Facebook
						</a>

						<div class="divider">OR CONTINUE WITH EMAIL</div>



						<form action="LoginServlet" method="post">

							<div class="mb-3">
								<label class="form-label small fw-bold">Email Address</label>
								<div>
									<input type="email" name="email"
										class="form-control border-start-0"
										placeholder="Enter your email" required>
								</div>
							</div>

							<div class="mb-2">
								<div class="d-flex justify-content-between">
									<label class="form-label small fw-bold">Password</label> <a
										href="#" class="text-dark small text-decoration-none">
										Forgot Password? </a>
								</div>

								<div>
									<input type="password" name="password"
										class="form-control border-start-0 border-end-0"
										placeholder="Enter your password" required>
								</div>
							</div>

							<div class="form-check mb-4 mt-3">
								<input type="checkbox" class="form-check-input" id="keepSigned">
								<label class="form-check-label small text-muted"
									for="keepSigned"> Keep me signed in </label>
							</div>

							<button type="submit" class="btn btn-signin">Sign In</button>

							<!-- ERROR MESSAGE -->
							<%
							String message = (String) request.getAttribute("message");
							if (message != null) {
							%>

							<div class="alert alert-danger mt-3 text-center">
								<%=message%>
							</div>

							<%
							}
							%>

						</form>


						<p class="text-center mt-4 small">
							New to StyleCart? <a href="register.jsp"
								class="text-ca fw-bold text-decoration-none">Create an
								account</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</section>


	<!------------------------------------Footer section ------------------------------------>

	<footer class="footer-section">

		<div class="container">

			<div class="row">

				<!-- Logo + Description -->
				<div class="col-lg-4 col-md-6 mb-4">

					<h3 class="footer-logo">
						<i class="fa-solid fa-cart-shopping"></i> StyleCart
					</h3>

					<p class="footer-text">StyleCart is a versatile e-commerce
						platform offering a wide range of products. Enjoy a seamless
						shopping experience with premium support.</p>

					<div class="social-icons">
						<i class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i
							class="fab fa-instagram"></i> <i class="fab fa-pinterest"></i>
					</div>

				</div>

				<!-- Categories -->
				<div class="col-lg-2 col-md-6 mb-4">

					<h5 class="footer-title">Categories</h5>

					<ul class="footer-links">
						<li><a href="shop?category=Jacket" class="text-decoration-none text-dark">Jackets</a></li>
						<li><a href="shop?category=T-Shirt" class="text-decoration-none text-dark">T-shirt</a></li>
						<li><a href="shop?category=Shirt" class="text-decoration-none text-dark">Shirt</a></li>
						<li><a href="shop?category=Blazer" class="text-decoration-none text-dark">Blazer</a></li>
						<li><a href="shop?category=Jeans" class="text-decoration-none text-dark">Jeans</a></li>
					</ul>

				</div>

				<!-- Quick Links -->
				<div class="col-lg-3 col-md-6 mb-4">

					<h5 class="footer-title">Quick Links</h5>

					<ul class="footer-links">
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms Of Services</a></li>
						<li><a href="#">Shipping Policy</a></li>
					</ul>

				</div>

				<!-- Customer Service -->
				<div class="col-lg-3 col-md-6 mb-4">

					<h5 class="footer-title">Customer Service</h5>

					<ul class="footer-links">
						<li><a href="profile.jsp">My Account</a></li>
						<li><a href="MyOrdersServlet">My Orders</a></li>
						<li><a href="WishlistServlet">Wishlist</a></li>
						<li><a href="CartServlet">Cart</a></li>
						<li><a href="#">Help Center</a></li>
					</ul>

				</div>

			</div>

			<hr>

			<div class="footer-bottom">

				<p>© 2026 FreshCart. All rights reserved.</p>


			</div>

		</div>

	</footer>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


	<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
	%>

	<div id="successToast" class="toast-success">
		<i class="bi bi-check-circle-fill me-2"></i>
		<%=msg%>
	</div>

	<script>
		window.onload = function() {

			let toast = document.getElementById("successToast");

			if (toast) {
				setTimeout(function() {

					toast.style.opacity = "0";

					setTimeout(function() {
						toast.remove();
					}, 500);

				}, 4000);
			}

		}
	</script>

	<%
	}
	%>
</body>
</html>