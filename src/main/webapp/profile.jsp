<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.pojo.User"%>
<%@ page import="java.util.*"%>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}

String address = "", city = "", state = "", pincode = "";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stylecartDB", "root", "root@0719");

	PreparedStatement ps = con.prepareStatement("SELECT * FROM address WHERE user_id=?");
	ps.setInt(1, user.getId());

	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
		address = rs.getString("full_address");
		city = rs.getString("city");
		state = rs.getString("state");
		pincode = rs.getString("pincode");
	}

	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
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

<link rel="stylesheet" href="CSS/profile.css">

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


	<!-- 🔔 MESSAGE -->
	<%
	String msg = request.getParameter("msg");
	if (msg != null) {
	%>
	<div class="toast-box">
		<%
		if ("profileUpdated".equals(msg)) {
		%>
		<div class="toast-success">Profile Updated</div>
		<%
		} else if ("addressUpdated".equals(msg)) {
		%>
		<div class="toast-success">Address Updated</div>
		<%
		} else if ("passwordUpdated".equals(msg)) {
		%>
		<div class="toast-success">Password Updated</div>
		<%
		}
		%>
	</div>
	<%
	}
	%>

	<section class="py-5">
		<div class="container mt-5">
			<div class="row g-2">

				<!-- SIDEBAR -->
				<div class="col-md-3">
					<div class="sidebar">

						<h5 class="mb-4 text-dark">My Account</h5>

						<div class="nav flex-column nav-pills">

							<button class="nav-link active" data-bs-toggle="pill"
								data-bs-target="#info">Manage Profile</button>

							<button class="nav-link" data-bs-toggle="pill"
								data-bs-target="#addressTab">Manage Address</button>

							<button class="nav-link" data-bs-toggle="pill"
								data-bs-target="#passwordTab">Manage Password</button>

							<a href="MyOrdersServlet" class="nav-link">My Orders</a> <a
								href="LogoutServlet" class="btn logout-btn mt-4">Logout</a>

						</div>
					</div>
				</div>

				<!-- CONTENT -->
				<div class="col-md-7">
					<div class="tab-content">

						<!-- PROFILE -->
						<div class="tab-pane fade show active profile-card" id="info">

							<h4 class="mb-4">Profile Details</h4>

							<form action="UpdateProfileServlet" method="post">

								<input type="text" name="name" class="form-control mb-3"
									value="<%=user.getName()%>" placeholder="Name" required>

								<input type="email" class="form-control mb-3"
									value="<%=user.getEmail()%>" readonly> <input
									type="text" name="phone" class="form-control mb-3"
									value="<%=user.getPhone()%>" placeholder="Phone" required>

								<button class="btn main-btn">Update</button>

							</form>
						</div>

						<!-- ADDRESS -->
						<div class="tab-pane fade profile-card" id="addressTab">

							<h4 class="mb-4">
								<%=address.isEmpty() ? "Add Address" : "Update Address"%>
							</h4>

							<form action="AddressServlet" method="post">

								<input type="text" name="address" class="form-control mb-2"
									placeholder="Full Address" value="<%=address%>" required>

								<input type="text" name="city" class="form-control mb-2"
									placeholder="City" value="<%=city%>" required> <input
									type="text" name="state" class="form-control mb-2"
									placeholder="State" value="<%=state%>" required> <input
									type="text" name="pincode" class="form-control mb-3"
									placeholder="Pincode" value="<%=pincode%>" required>

								<button class="btn main-btn">
									<%=address.isEmpty() ? "Save" : "Update"%>
								</button>

							</form>
						</div>

						<!-- PASSWORD -->
						<div class="tab-pane fade profile-card" id="passwordTab">

							<h4 class="mb-4">Change Password</h4>

							<form action="ChangePasswordServlet" method="post">

								<input type="password" name="oldPassword"
									class="form-control mb-2" placeholder="Old Password" required>

								<input type="password" name="newPassword"
									class="form-control mb-3" placeholder="New Password" required>

								<button class="btn main-btn">Update</button>

							</form>
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





	<script>
setTimeout(() => {
	let toast = document.querySelector(".toast-box");
	if (toast) toast.style.display = "none";
}, 3000);
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>