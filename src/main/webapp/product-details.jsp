<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.pojo.Product"%>
<%
Product p = (Product) request.getAttribute("product");

List<String> sizes = (List<String>) request.getAttribute("sizes");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<link rel="stylesheet" href="CSS/productDetails.css">

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







	<!----------------------------------------product details section------------------------------------>
	<section>

		<div class="container-fluid mt-4">

			<div class="product-box">

				<div class="row">


					<!------------------------ Left image--------------------->

					<div class="col-md-4">

						<div class="main-img mb-3 text-center">
							<img id="mainImage" src="images/Illustrations/<%=p.getImage()%>">
						</div>

					</div>



					<!------------------------product into--------------------->

					<div class="col-md-8">

						<div class="d-flex gap-2 mb-2">

							<span class="badge bg-dark">Women's Fashion</span> <span
								class="badge bg-light text-dark"><%=p.getCategoryName()%></span>

						</div>

						<h4><%=p.getName()%></h4>

						<div class="text-warning mb-2">

							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-alt"></i> <span class="text-muted">3.5
								(4 reviews)</span>

						</div>

						<div class="mb-3">

							<span class="price">₹ <%=p.getPrice()%></span> <span
								class="old-price ms-2">₹ <%=p.getPrice() + 200%></span> <span
								class="save-badge ms-2">Save 10%</span>

						</div>

						<p class="stock">
							<i class="fa fa-circle"></i> In Stock
						</p>

						<p class="text-muted">
							<%=p.getDescription()%>
						</p>


						<form action="AddToCartServlet" method="post">

							<!-- Hidden Product ID -->
							<input type="hidden" name="productId" value="<%=p.getId()%>">

							<!-- Size Selection -->
							<div class="mb-3">
								<strong>Select Size:</strong><br> <br>

								<%
								if (sizes != null) {
									for (String s : sizes) {
								%>
								<label class="me-2"> <input type="radio" name="size"
									value="<%=s%>" required> <span class="ms-1"><%=s%></span>
								</label>
								<%
								}
								}
								%>
							</div>

							<!-- Quantity + Buttons Row -->
							<div class="d-flex align-items-end flex-wrap gap-3 mb-3">

								<!-- Quantity -->
								<div>
									<label class="form-label"><strong>Quantity</strong></label>

									<div class="input-group" style="width: 130px;">

										

										<button class="btn btn-outline-secondary" type="button"
											onclick="decreaseQty()">
											<i class="fa fa-minus"></i>
										</button>
										
										
										<input type="number" id="qty" name="quantity" value="1"
											min="1" class="form-control text-center">


										<button class="btn btn-outline-secondary" type="button"
											onclick="increaseQty()">
											<i class="fa fa-plus"></i>
										</button>

									</div>
								</div>

								<!-- Add To Cart -->
								<div>
									<button type="submit" class="btn add-cart-btn px-4">
										<i class="fa-solid fa-cart-shopping me-2"></i> Add To Cart
									</button>
								</div>

								<!-- Wishlist -->
								<div class="product-icons mb-2">
									<a href="AddToWishlistServlet?productId=<%=p.getId()%>"
								class="btn wishlist-btn"><i class="fa-regular fa-heart wishlist-icon"
										onclick="toggleWishlist(this)"></i></a>
								</div>

							</div>

						</form>

						<!----------------------total price-------------------------->

						<div
							class="d-flex justify-content-between border p-3 rounded my-3">

							<span>Total Price:</span> <b class="text-dark">₹ <span
								id="total"><%=p.getPrice()%></span></b>

						</div>



						<hr>

						<!------------------------Features section--------------------->

						<div class="row text-center">

							<div class="col">
								<div class="feature-icon mx-auto mb-1">
									<i class="fa fa-truck"></i>
								</div>
								<small>Free Delivery</small>
							</div>

							<div class="col">
								<div class="feature-icon mx-auto mb-1">
									<i class="fa fa-rotate-left"></i>
								</div>
								<small>30 Days Return</small>
							</div>

							<div class="col">
								<div class="feature-icon mx-auto mb-1">
									<i class="fa fa-shield"></i>
								</div>
								<small>Secure Payment</small>
							</div>

						</div>

					</div>

				</div>




				<!-----------------------TABS SECTION------------------>

				<ul class="nav nav-tabs custom-tabs mt-4">

					<li class="nav-item">
						<button class="nav-link active" data-bs-toggle="tab"
							data-bs-target="#details">
							<i class="fa-solid fa-cube"></i> Product Details
						</button>
					</li>

					<li class="nav-item">
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#reviews">
							<i class="fa-solid fa-star"></i> Reviews (4)
						</button>
					</li>

					<li class="nav-item">
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#shipping">
							<i class="fa-solid fa-truck"></i> Shipping & Returns
						</button>
					</li>

				</ul>
				
				
				

				<div class="tab-content p-2 border border-top-0 bg-white mt-3">

					<div class="tab-content tab-box">
					

						<!------------------------ tab one --------------------->

						<div class="tab-pane fade show active" id="details">

							<h5 class="mb-3">About this Product</h5>

							<p class="text-muted">
								<%=p.getDetails()%>
							</p>

							<div class="row mt-4 gap-2 gap-md-0">

								<div class="col-md-6">

									<div class="info-card">

										<h6 class="py-1">
											<i class="fa-solid fa-box"></i> Product Information
										</h6>

										<div class="info-row ">
											<span>Category</span> <span><%=p.getCategoryName()%></span>
										</div>

										<div class="info-row">
											<span>Pattern Type</span> <span><%=p.getPatternType()%></span>
										</div>

										<div class="info-row">
											<span>Color</span> <span><%=p.getColor()%></span>
										</div>

										<div class="info-row py-1">
											<span>Items Sold</span> <b>8922</b>
										</div>

									</div>

								</div>


								<div class="col-md-6">

									<div class="info-card">

										<h6 class="py-1">
											<i class="fa-solid fa-medal"></i> Key Features
										</h6>

										<ul class="feature-list">
											<li><i class="fa-solid fa-circle-check"></i> Premium
												Quality Product</li>
											<li><i class="fa-solid fa-shield"></i> 100% Authentic
												Guarantee</li>
											<li><i class="fa-solid fa-truck"></i> Fast & Secure
												Packaging</li>
											<li><i class="fa-solid fa-circle-check"></i> Quality
												Tested</li>
										</ul>

									</div>

								</div>

							</div>

						</div>


						<!------------------------ tab Two --------------------->

						<div class="tab-pane fade" id="reviews">
							<p>No reviews yet.</p>
						</div>




						<!------------------------ tab Three --------------------->

						<div class="tab-pane fade" id="shipping">

							<div class="row gap-2 gap-md-0">

								<div class="col-md-6">

									<div class="shipping-card">

										<h5>
											<i class="fa-solid fa-truck"></i> Shipping Information
										</h5>

										<ul>
											<li>Free shipping on orders over $50</li>
											<li>Standard delivery: 3–5 business days</li>
											<li>Express delivery available (1–2 days)</li>
											<li>Track your order in real-time</li>
										</ul>

									</div>

								</div>


								<div class="col-md-6">

									<div class="shipping-card">

										<h5>
											<i class="fa-solid fa-rotate-left"></i> Returns & Refunds
										</h5>

										<ul>
											<li>30-day hassle-free returns</li>
											<li>Full refund or exchange available</li>
											<li>Free return shipping on defective items</li>
											<li>Easy online return process</li>
										</ul>

									</div>

								</div>

							</div>

							<div class="buyer-box mt-4">

								<h5>
									<i class="fa-solid fa-shield"></i> Buyer Protection Guarantee
								</h5>

								<p>Get a full refund if your order doesn’t arrive or isn’t
									as described. We ensure your shopping experience is safe,
									secure, and worry-free.</p>

							</div>

						</div>



					</div>

				</div>

			</div>


		</div>
	</section>



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










	<script>
		function increaseQty() {

			let qty = document.getElementById("qty");
			qty.value = parseInt(qty.value) + 1;

		}

		function decreaseQty() {

			let qty = document.getElementById("qty");

			if (qty.value > 1) {
				qty.value = parseInt(qty.value) - 1;
			}

		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>