<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
ResultSet rs = (ResultSet) request.getAttribute("paymentData");
double subtotal = 0;
double shipping = 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shop</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Font style -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Elsie:wght@400;900&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="CSS/payment.css">
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
						<a href="login.jsp" class="text-decoration-none text-dark"><i
							class="fa fa-right-to-bracket"></i> Login</a>
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
					<li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
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


	<!------------------------------------Offcanvas menu------------------------------------>

	<div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenu">

		<div class="offcanvas-header">
			<h5 class="offcanvas-title">FreshCart Menu</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>

		<div class="offcanvas-body">

			<!------------------------------------ Search ------------------------------------>
			<div class="search-box mb-4">
				<input type="text" placeholder="Search products..."
					class="form-control"> <i class="fa fa-search"></i>
			</div>

			<!------------------------------------ Menu ------------------------------------>
			<ul class="mobile-menu">

				<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>

				<li><a href="shop"><i class="fa fa-store"></i> Shop</a></li>

				<li><a href="#"><i class="fa fa-tags"></i> Brands</a></li>

				<li><a href="WishlistServlet"><i class="fa fa-heart"></i> Wishlist</a></li>

				<li><a href="CartServlet"><i class="fa fa-cart-shopping"></i> Cart</a></li>

				<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>

				<li><a href="#"><i class="fa fa-right-to-bracket"></i>
						Login</a></li>

			</ul>

		</div>
	</div>



<!-- ================= HEADER ================= -->
	<div class="wishlist-header text-center">

		<h2 class="text-center mb-4">Checkout</h2>
		<nav class="d-flex justify-content-center">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>

				<li class="breadcrumb-item "><a href="CartServlet">Shopping
						Cart</a></li>

				<li class="breadcrumb-item active">Checkout</li>
			</ol>
		</nav>

	</div>




	<div class="container my-5">
		<div class="row">

			<!-- LEFT PAYMENT METHOD -->
			<div class="col-lg-8">

				<form action="<%=request.getContextPath()%>/PlaceOrderServlet" method="post">

					<h5 class="mb-4">Select Payment Method</h5>

					<div class="card p-3 mb-3">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMethod"
								value="Paypal" required> <label class="form-check-label">
								<img src="images/paypal.png" width="60"> Paypal
							</label>
						</div>
					</div>

					<div class="card p-3 mb-3">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMethod"
								value="GooglePay" required> <label
								class="form-check-label"> <img
								src="images/googlepay.png" width="60"> Google Pay
							</label>
						</div>
					</div>

					<div class="card p-3 mb-3">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMethod"
								value="Cash on Delivery" required> <label class="form-check-label">
								💵 Cash On Delivery </label>
						</div>
					</div>
			</div>

			<!-- RIGHT ORDER SUMMARY -->
			<div class="col-lg-4">

				<div class="card p-3">
					<h5>Order Summary</h5>
					<hr>

					<%
					while (rs.next()) {
						double price = rs.getDouble("price");
						int qty = rs.getInt("quantity");
						subtotal += price * qty;
					%>

					<p>
						<%=rs.getString("product_name")%>
						(x<%=qty%>) <span class="float-end">₹<%=price * qty%></span>
					</p>

					<%
					}
					double total = subtotal + shipping;
					%>

					<hr>
					<p>
						Subtotal <span class="float-end">₹<%=subtotal%></span>
					</p>
					<p>
						Shipping <span class="float-end">₹<%=shipping%></span>
					</p>
					<hr>
					<h5>
						Total <span class="float-end">₹<%=total%></span>
					</h5>

					<button type="submit" class="btn btn-dark w-100 mt-3">
						Confirm Payment</button>
				
				</div>

			</div>

			</form>
		</div>
		
	</div>




<!------------------------------------ FEATURE SECTION ------------------------------------>
	<section class="features py-5">

		<div class="container">

			<div class="row g-3">

				<div class="col-lg-3 col-md-6 col-6">
					<div class="feature-box">

						<i class="fa-solid fa-truck-fast"></i>

						<h6>Free Shipping</h6>
						<p>On orders over 500</p>

					</div>
				</div>


				<div class="col-lg-3 col-md-6 col-6">
					<div class="feature-box">

						<i class="fa-solid fa-shield"></i>

						<h6>Secure Payment</h6>
						<p>100% secure transactions</p>

					</div>
				</div>


				<div class="col-lg-3 col-md-6 col-6">
					<div class="feature-box">

						<i class="fa-solid fa-rotate-left"></i>

						<h6>Easy Returns</h6>
						<p>14-day return policy</p>

					</div>
				</div>


				<div class="col-lg-3 col-md-6 col-6">
					<div class="feature-box">

						<i class="fa-solid fa-headset"></i>

						<h6>24/7 Support</h6>
						<p>Dedicated support team</p>

					</div>
				</div>


			</div>
		</div>

	</section>



<!------------------------------------ Footer ------------------------------------>

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











</body>
</html>