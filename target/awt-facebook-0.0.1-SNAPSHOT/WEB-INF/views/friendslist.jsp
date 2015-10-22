<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<!--Foundation Styles-->
<link href="<c:url value="/resources/css/foundation.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/foundation.min.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/normalize.css"/>"
	rel="stylesheet" type="text/css">
<!--My styles-->
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet"
	type="text/css">
<!--Foundation Scripts-->
<script src="<c:url value="/resources/js/foundation/foundation.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/vendor/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/foundation.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/vendor/modernizr.js"/>"
	type="text/javascript"></script>

</head>
<body>
	<!-- Header and Nav -->

	<div class="row">
		<div class="large-12 columns">
			<div class="panel">


				<h1>Your Facebook Profile</h1>

			</div>
		</div>
	</div>
	<!-- End Header and Nav -->
	<div id="header" class="row">
		<!-- Nav Sidebar -->
		<!-- This is source ordered to be pulled to the left on larger screens -->
		<div class="large-3 small-12 columns ">
			<div class="panel">
				<a href="#"><img
					src="http://graph.facebook.com/<c:out value="${user.id}"/>/picture?type=normal" /></a>
				<h5>
					<Strong>User ID</Strong>:
					<c:out value="${user.id}" />
				</h5>
				<h5 class="title">
					<Strong>Name</strong>:
					<c:out value="${user.name}" />
				</h5>
				<h5 class="title">
					<Strong>Location</Strong>:
					<c:out value="${user.getLocation().name}" />
				</h5>
				<h5 class="title">
					<Strong>Nickname</Strong>:
					<c:out value="${user.username}" />
				</h5>
				<h5 class="title">
					<Strong>Gender</Strong>:
					<c:out value="${user.gender}" />
				</h5>
			</div>
		</div>
		<!-- Main Feed -->
		<!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->
		<div class="large-6 small-9 columns ">
			<!-- Feed Entry -->
			<div class="large-6 columns">
				<ul class="inline-list">
					<li><a href="#"><Strong>Friends</strong></a></li>
					<li class="right"><a href="<c:url value="/signout"/>">Logout</a></li>
				</ul>
				<form class="custom" action="<c:url value="commonFriends"/>"
					method="POST">
					<ol>
						<c:forEach items="${friends}" var="friend">
							<li><label for="${friend.id}"><input type="checkbox"
									name="friend" value="${friend.id}"><span
									class="custom checkbox"></span> ${friend.name} </label></li>
						</c:forEach>
					</ol>
					<button type="submit">Get Common Friends</button>
				</form>
			</div>
			<!-- Right Sidebar -->
			<!-- On small devices this column is hidden -->
		</div>
		<div class="large-3 columns small-3">
			<br />
			<p id="back-top">
				<a href="#top"><span><br />Back to Top</span></a>
			</p>
		</div>
	</div>
	<script>
		$(document).ready(function() {

			// hide #back-top first
			$("#back-top").hide();

			// fade in #back-top
			$(function() {
				$(window).scroll(function() {
					if ($(this).scrollTop() > 100) {
						$('#back-top').fadeIn();
					} else {
						$('#back-top').fadeOut();
					}
				});

				// scroll body to 0px on click
				$('#back-top a').click(function() {
					$('body,html').animate({
						scrollTop : 0
					}, 800);
					return false;
				});
			});

		});
	</script>

	<!-- Footer -->
	<footer class="row">
		<div class="large-12 columns">
			<hr />
			<div class="panel">
				<div class="row">

					<div class="large-5 columns small-4 columns">
						<p>© Copyright 2014</p>
					</div>
					<div class="large-7 columns small-7 columns">
						<ul class="inline-list right">
							<li>developers: Antonello Fodde and Chai Botta</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>