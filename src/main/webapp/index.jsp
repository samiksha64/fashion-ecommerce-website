<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*,"%>
<%@page import="com.pojo.Product"%>
<%
if (request.getAttribute("products") == null) {
	response.sendRedirect("HomeProductsServlet");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>StyleCart</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="CSS/style.css">


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
						<a href="WishlistServlet" class="text-decoration-none  text-dark"><i
							class="fa-regular fa-heart"></i> <span>Wishlist</span></a>
					</div>

					<div class="icon-item">
						<a href="CartServlet" class="text-decoration-none  text-dark"><i
							class="fa-solid fa-cart-shopping"></i> <span>Cart</span></a>
					</div>

					<div class="icon-item dropdown">
						<a href="#" class="text-decoration-none text-dark dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa-regular fa-user"></i>
							<span>Profile</span>
						</a>

						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="profile.jsp"> My
									Profile</a></li>
							<li><a class="dropdown-item" href="MyOrdersServlet">My
									Orders</a></li>

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

				<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>

				<li><a href="#"><i class="fa fa-cart-shopping"></i> Cart</a></li>

				<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>

				<li><a href="#"><i class="fa fa-right-to-bracket"></i>
						Login</a></li>

			</ul>

		</div>
	</div>

	<!------------------------------------ Home Section ------------------------------------>

	<section class="hero-carousel">
		<div id="fashionCarousel" class="carousel slide"
			data-bs-ride="carousel">

			<div class="carousel-inner">

				<div class="carousel-item active  slide-1">
					<div class="container hero-content text-center">

						<h1 class="hero-title">Discover Your Perfect Style</h1>

						<p class="hero-subtitle">Trendy collections for modern women.
							Shop the latest fashion today.</p>

						<div class="hero-buttons">
							<a href="shop" class="btn shop-btn">Shop Now</a> <a href="shop"
								class="btn explore-btn">Explore Collection</a>
						</div>

					</div>
				</div>


			</div>

		</div>
	</section>


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


	<!------------------------------------ Category section ------------------------------------>

	<section>

		<div class="container py-5">

			<!-- Heading -->
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h2 class="section-title">
					Shop by <span>Category</span>
				</h2>
				<a href="shop" class="vc text-decoration-none fw-semibold"> View
					All Categories → </a>
			</div>

			<!-- Categories -->
			<div class="row g-4">

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=Jeans"
						class="text-decoration-none text-dark"><div
							class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-jeans.png">
							</div>
							<div class="category-name">Jeans</div>
						</div></a>
				</div>

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=Jacket"
						class="text-decoration-none text-dark">
						<div class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-jacket.png">
							</div>
							<div class="category-name">Jacket</div>
						</div>
					</a>
				</div>

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=T-Shirt"
						class="text-decoration-none text-dark">
						<div class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-tshirt.png">
							</div>
							<div class="category-name">T-Shirt</div>
						</div>
					</a>
				</div>

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=Shirt"
						class="text-decoration-none text-dark">
						<div class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-shirt.png">
							</div>
							<div class="category-name">Shirt</div>
						</div>
					</a>
				</div>

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=Blazer"
						class="text-decoration-none text-dark">
						<div class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-blazer.png">
							</div>
							<div class="category-name">Blazer</div>
						</div>
					</a>
				</div>

				<div class="col-6 col-md-4 col-lg">
					<a href="shop?category=Trouser"
						class="text-decoration-none text-dark">
						<div class="category-card">
							<div class="category-img">
								<img src="images/Illustrations/c-trouser.png">
							</div>
							<div class="category-name">Trouser</div>
						</div>
					</a>
				</div>

			</div>

		</div>


	</section>



	<!------------------------------------ Promo card section ------------------------------------>

	<section>
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-12 col-lg-6">
					<div class="promo-card">
						<div class="category-badge">
							<i class="bi bi-sun-fill text-summer"></i> Summer Edit 2026
						</div>
						<h2 class="promo-title fw-bold mb-3">Breathable Linens &
							Florals</h2>
						<p class="lead opacity-75 mb-4">Stay cool with our premium
							sustainable summer collection.</p>

						<div class="d-flex gap-2 flex-wrap">
							<div class="feature-tag">
								<i class="bi bi-wind text-summer"></i> Ultra-Light
							</div>
							<div class="feature-tag">
								<i class="bi bi-recycle text-summer"></i> Eco-Friendly
							</div>
							<div class="feature-tag">
								<i class="bi bi-stars text-summer"></i> New Trends
							</div>
						</div>

						<a href="#" class="btn-fashion"> Explore Summer <i
							class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-12 col-lg-6">
					<div class="promo-card">
						<div class="category-badge">
							<i class="bi bi-briefcase-fill text-workwear"></i> Professional
							Series
						</div>
						<h2 class="promo-title fw-bold mb-3">Sharp Tailoring & Power
							Suits</h2>

						<div class="d-flex align-items-center gap-3 mb-2 mt-3">
							<h2 class="fw-bold mb-0">UP TO 30% OFF</h2>
						</div>
						<p class="small text-uppercase tracking-wider opacity-50">
							Early Bird Code: <strong>BOSS2026</strong>
						</p>

						<a href="#" class="btn-fashion"> Shop Workwear <i
							class="bi bi-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>

	</section>


	<!------------------------------------ Product section------------------------------------>

	<Section class="my-4">

		<div class="products container">

			<!-- Heading -->
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h2 class="section-title">Featured Products</h2>
				<a href="shop" class="vc text-decoration-none fw-semibold"> View
					All → </a>
			</div>

			<div class="row g-2">

				<%
				List<Product> products = (List<Product>) request.getAttribute("products");

				if (products != null) {
					for (Product p : products) {
				%>

				<div class="col-6 col-md-4 col-lg-custom">



					<div class="product-card p-2">

						<div class="product-img">
							<a class="text-decoration-none"
								href="ProductDetailsServlet?id=<%=p.getId()%>"> <img
								src="images/Illustrations/<%=p.getImage()%>" class="img-fluid">
							</a>

							<div class="product-icons mb-2">
								<a href="AddToWishlistServlet?productId=<%=p.getId()%>"
									class="btn wishlist-btn"><i
									class="fa-regular fa-heart wishlist-icon"
									onclick="toggleWishlist(this)"></i></a>
							</div>

						</div>

						<div class="product-info">

							<p class="category"><%=p.getCategoryName()%></p>

							<h4 class="product-name"><%=p.getName()%></h4>

							<div class="rating">
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i> <span>4.2 reviews</span>
							</div>

							<div class="price-cart">
								<span class="price">$<%=p.getPrice()%></span>

							</div>

						</div>

					</div>

				</div>

				<%
				}
				}
				%>

			</div>

		</div>
	</Section>


	<!------------------------------------ Subscribe section ------------------------------------>

	<section class="subscribe-section">

		<div class="container">

			<div class="subscribe-card position-relative">

				<!-- Decorative circles -->
				<div class="circle circle-left"></div>
				<div class="circle circle-right"></div>

				<div class="row align-items-center">

					<!-- LEFT CONTENT -->
					<div class="col-lg-7 mb-4 mb-lg-0">

						<div class="subscribe-icon">
							<i class="bi bi-envelope-paper"></i>
						</div>

						<h2 class="subscribe-title">
							Subscribe & Get <span>20% Off</span><br> Your First Order
						</h2>

						<p class="subscribe-desc">Join thousands of happy customers
							and receive weekly offers, flash sales and exclusive discounts.</p>

						<div class="subscribe-form d-flex flex-column flex-sm-row gap-3">

							<input type="email" class="form-control subscribe-input"
								placeholder="Enter your email">

							<button class="btn subscribe-btn">Subscribe</button>

						</div>

					</div>


					<!-- RIGHT FEATURES -->
					<div class="col-lg-5">

						<div class="subscribe-feature-item">
							<div class="feature-icon">
								<i class="bi bi-gift"></i>
							</div>
							<span>Exclusive Offers</span>
						</div>

						<div class="subscribe-feature-item">
							<div class="feature-icon">
								<i class="bi bi-percent"></i>
							</div>
							<span>Member Discounts</span>
						</div>

						<div class="subscribe-feature-item">
							<div class="feature-icon">
								<i class="bi bi-lightning"></i>
							</div>
							<span>Flash Sales</span>
						</div>

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
						<li><a href="shop?category=Jacket"
							class="text-decoration-none text-dark">Jackets</a></li>
						<li><a href="shop?category=T-Shirt"
							class="text-decoration-none text-dark">T-shirt</a></li>
						<li><a href="shop?category=Shirt"
							class="text-decoration-none text-dark">Shirt</a></li>
						<li><a href="shop?category=Blazer"
							class="text-decoration-none text-dark">Blazer</a></li>
						<li><a href="shop?category=Jeans"
							class="text-decoration-none text-dark">Jeans</a></li>
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



	<%
	String msg = request.getParameter("msg");
	if ("logout".equals(msg)) {
	%>

	<div class="alert alert-warning text-center">Logged out
		successfully!</div>

	<%
	}
	%>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>