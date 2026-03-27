<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*,com.pojo.Product"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="CSS/shop.css">

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
						<a href="CartServlet" class="text-decoration-none text-dark"><i class="fa-solid fa-cart-shopping"></i> <span>Cart</span></a>
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

<!---------------------------------------- Shop section ---------------------------------------------->


	<div class="shop-container py-4">

		<!-- FILTER SIDEBAR -->

		<div class="products container">

			<h2 class="page-title">All Products</h2>

			<!-- FILTER BAR -->
			<div class="filter-bar">

				<div class="d-flex justify-content-between align-items-center">


					<!-- Filter Button (Mobile & Tablet) -->
					<div class="apl-btn">
						<button class="btn  d-lg-none " type="button"
							data-bs-toggle="offcanvas" data-bs-target="#mobileFilter">
							<i class="fa fa-filter"></i> Filter
						</button>

					</div>
				</div>

				<!-- Desktop Filters -->

				<form action="shop" class="filter-form d-none d-lg-flex mt-3">

					<select name="category" class="form-select">
						<option value="">All Categories</option>
						<option value="Jacket">Jacket</option>
						<option value="Shirt">Shirt</option>
						<option value="Tshirt">Tshirt</option>
						<option value="Jeans">Jeans</option>
						<option value="Blazer">Blazer</option>
						<option value="Trouser">Trouser</option>
					</select> <select name="color" class="form-select">
						<option value="">All Colors</option>
						<option value="Black">Black</option>
						<option value="Blue">Blue</option>
						<option value="White">White</option>
						<option value="Red">Red</option>
						<option value="Grey">Grey</option>
					</select> <select name="sort" class="form-select">
						<option value="">Sort By</option>
						<option value="low">Price Low → High</option>
						<option value="high">Price High → Low</option>
					</select>

					<button type="submit" class="btn">Apply</button>

				</form>

				<!-- Mobile & Tablet Filter Dropdown -->

				<div class="offcanvas offcanvas-start" tabindex="-1"
					id="mobileFilter">

					<div class="offcanvas-header ">
						<h5 class="offcanvas-title">Filter Products</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas"></button>
					</div>

					<div class="offcanvas-body">

						<form action="shop">

							<label class="fw-bold mb-1">Category</label> <select
								name="category" class="form-select mb-3">
								<option value="">All Categories</option>
								<option value="Jacket">Jacket</option>
								<option value="Shirt">Shirt</option>
								<option value="Tshirt">Tshirt</option>
								<option value="Jeans">Jeans</option>
								<option value="Blazer">Blazer</option>
								<option value="Trouser">Trouser</option>
							</select> <label class="fw-bold mb-1">Color</label> <select name="color"
								class="form-select mb-3">
								<option value="">All Colors</option>
								<option value="Black">Black</option>
								<option value="Blue">Blue</option>
								<option value="White">White</option>
								<option value="Red">Red</option>
								<option value="Grey">Grey</option>
							</select> <label class="fw-bold mb-1">Sort</label> <select name="sort"
								class="form-select mb-4">
								<option value="">Sort By</option>
								<option value="low">Price Low → High</option>
								<option value="high">Price High → Low</option>
							</select>

							<div class="apl-btn">
								<button type="submit" class="btn  w-100 ">Apply Filters</button>
							</div>

						</form>

					</div>

				</div>

			</div>

			<!-- PRODUCT AREA -->

			<div class="products container">

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
								class="btn wishlist-btn"><i class="fa-regular fa-heart wishlist-icon"
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



<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
	%>

	<div id="customToast" class="toast-success">

				<div class="toast-body">
					<i class="bi bi-check-circle-fill me-2"></i>
					<%=msg%>
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto"
					onclick="document.getElementById('customToast').style.display='none';">
				</button>
			
	</div>
	<script>
		
		setTimeout(function() {
			var toast = document.getElementById("customToast");
			if (toast) {
				toast.style.display = "none";
			}
		}, 3000); 
	</script>

	<%
	session.removeAttribute("msg");
	}
	%>









			<!------------------------------------ Footer ------------------------------------>

			<footer class="footer-section mt-4">

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
								<i class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i>
								<i class="fab fa-instagram"></i> <i class="fab fa-pinterest"></i>
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


			<script>
				function toggleWishlist(icon) {

					icon.classList.toggle("active");

					if (icon.classList.contains("active")) {
						icon.classList.remove("fa-regular");
						icon.classList.add("fa-solid");
						showToast("❤️ Added to Wishlist");
					} else {
						icon.classList.remove("fa-solid");
						icon.classList.add("fa-regular");
						showToast("Removed from Wishlist");
					}

				}
			</script>


			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>