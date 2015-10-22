<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>">
<script src="<c:url value="/resources/js/vendor/modernizr.js"/>"></script>
</head>
<body>
	<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

	<!-- Add your site or application content here -->


	<header class="header" role="banner">

		<div class="skiptocontent">
			<a href="#main">skip to main content</a>
		</div>
		<h2 class="logo">
			<a href="<c:url value="/"/>"><img
				src="<c:url value="/resources/img/logo.png"/>" width="300"
				height="100" alt="Web-Store"></a>
		</h2>

		<form class="search-form" method="get">
			<div class="search-container">
				<h2 class="hidden">Search Menu</h2>
				<label for="search-input" class="hidden">Search a product</label> <input
					id="search-input" class="search-input" type="text"
					placeholder="Search a product">
				<button type="submit" title="Search"
					class="search-button button-link" alt="Submit Search">
					<span class="hidetext">Search</span><i class="fa fa-search"></i>
				</button>
			</div>
		</form>
		<div class="clear"></div>
		<nav role="navigation">
			<h2 class="hidden">Navigation Menu</h2>

			<div class="left">
				<ul>
					<li><a id="categories" href="#" title="Categories">Categories
							<span class="hidetext">-></span><i class="fa fa-chevron-down"></i>
					</a>
						<ul id="submenu">
							<c:forEach items="${categoryList}" var="category">
								<li><a
									href="<c:url value="/type-view?category=${category.name}"/>"
									title="${category.name}">${category.name}</a></li>
							</c:forEach>
						</ul></li>
				</ul>
			</div>

			<div class="right">
				<ul>
					<c:choose>
						<c:when test="${email!=null}">
							<li><a href="<c:url value="/account"/>" title="My Account">My
									Account</a></li>
							<li><a href="<c:url value="/cart"/>" title="Cart">Cart <i
									class="fa fa-shopping-cart"></i></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value="/login"/>" title="Login/Register">Login/Register</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</header>


	<aside role="complementary">
		<div>
			<h2>
				<c:out value="${pageCategory.name}" />
				Products
			</h2>
			<ul>
				<c:forEach items="${typeList}" var="type">
					<li><a
						href="<c:url value="/product-view?category=${pageCategory.name}&type=${type.name}"/>">
							${type.name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</aside>

	<main role="main" id="main">
	<p id="breadcrumbs">
		<span class="hidden">You are here: </span><a href="<c:url value="/"/>">Home</a>
		&gt; <a
			href="<c:url value="/type-view?category=${pageCategory.name}"/>"><c:out
				value="${pageCategory.name}" /></a> &gt; <a
			href="<c:url value="/product-view?category=${pageCategory.name}&type=${pageType.name}"/>"><c:out
				value="${pageType.name}" /></a> &gt;
		<c:out value="${pageProduct.name}" />
	</p>
	<article>
		<section>
			<div class="product-view">
				<img src="<c:url value="/resources/img/${pageProduct.name}.png"/>"
					alt="Piaf Tactile Embosser Image">
			</div>
			<div class="product-shop">
				<div class="product-name">
					<h2>
						<c:out value="${pageProduct.name}" />
					</h2>
				</div>
				<p class="availability in-stock">
					Availability: <span>In stock</span>
				</p>

				<p class="availability-only">
					Only <strong>10</strong> left
				</p>

				<div class="price-box">
					<h3 class="hidden">Price:</h3>
					<span class="price">$ <c:out value="${pageProduct.price}" /></span>
				</div>

				<h3 class="hidden">Info:</h3>

				<p>Piaf produces high quality tactile graphics using heat
					sensitive capsule paper. It is ideal for people who are blind and
					vision impaired. Piaf's controlled heat source causes any black
					lines, letters or shapes that are drawn, printed or copied onto the
					capsule paper to swell. The result is an instant tactile graphic.
					Piaf is being used in a variety of educational, employment and
					personal settings.</p>


				<div class="purchase">

					<form class="purchase-form" method="post"
						action="<c:url value="addToCart?product=${pageProduct.name}"/>">

						<div class="add-to-cart">
							<div class="qty-block">
								<h3 class="hidden">Select a quantity:</h3>
								<label for="qty">Quantity:</label> <input type="number"
									name="qty" id="qty" value="1" title="Quantity">
							</div>
							<button type="submit" title="Add to Cart" class="button-link"
								alt="Add to Cart">Add to Cart</button>
						</div>

					</form>
				</div>
			</div>
		</section>

		<div class="clear"></div>

		<section>

			<h3 class="title">
				Details<span class="hidden">:</span>
			</h3>

			<p>

				
			<li><b>Education:</b> In early education Piaf can be used to
				introduce simple shapes and basic concepts; to introduce the concept
				of drawing and two-dimensional rendering of solid objects; to
				encourage students in taking the first tentative steps to expressing
				themselves graphically; and to teach the concepts of handwriting and
				signatures. Later, Piaf can be used to access graphical information
				in nearly all subject areas especially Mathematics and Sciences.<br></li>
			<br>
			<li><b>Orientation and Mobility:</b> Piaf can produce
				high-quality local area maps for orientation and mobility training,
				or make campus or building maps for students or employees.</li> <br>
			<li><b>Employment:</b> With Piaf, blind and vision impaired
				people can understand the information on a computer screen, grasp
				organizational structure of the business and access sales charts.
				One or two tactile diagrams can save thousands of words.<br></li>
			</p>
		</section>

		<section>

			<h3 class="title">
				Video<span class="hidden">:</span>
			</h3>

			<iframe class="product-video"
				src="//www.youtube.com/embed/dvtdReQ6JaI?rel=0" frameborder="0"
				allowfullscreen></iframe>

		</section>
	</article>
	</main>
	<div class="clearfix"></div>
	<footer role="contentinfo">
		<div>
			<h2>Information</h2>
			<ul>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Customer Service</a></li>
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Orders and Returns</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
		<div>
			<h2>Why buy from us</h2>
			<ul>
				<li><a href="#">Shipping & Returns</a></li>
				<li><a href="#">Secure Shopping</a></li>
				<li><a href="#">International Shipping</a></li>
				<li><a href="#">Affiliates</a></li>
				<li><a href="#">Group Sales</a></li>
			</ul>
		</div>
		<div>
			<h2>My account</h2>
			<ul>
				<li><a href="#">Sign In</a></li>
				<li><a href="#">View Cart</a></li>
				<li><a href="#">My Wishlist</a></li>
				<li><a href="#">Track My Order</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</div>
	</footer>

	<script>
		window.jQuery
				|| document
						.write(
								'<script src="<c:url value="/resources/js/vendor/jquery-1.10.2.min.js"/>"><\/script>')
	</script>
	<script src="<c:url value="/resources/js/plugins.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
	(function(b, o, i, l, e, r) {
						b.GoogleAnalyticsObject = l;
						b[l] || (b[l] = function() {
							(b[l].q = b[l].q || []).push(arguments)
						});
						b[l].l = +new Date;
						e = o.createElement(i);
						r = o.getElementsByTagName(i)[0];
						e.src = '//www.google-analytics.com/analytics.js';
						r.parentNode.insertBefore(e, r)
					}(window, document, 'script', 'ga'));
	ga('create', 'UA-XXXXX-X');
	ga('send', 'pageview');
</script>
				<script src="<c:url value="/resources/js/vendor/jquery.js"/>"></script>
</body>
</html>
