<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
<script type="text/javascript"
	src="<c:url value="/resources/js/vivagraph.js" />"></script>
</head>
<body onload='main()'>
	<script>
	function main() {
		var graph = Viva.Graph.graph();

		var layout = Viva.Graph.Layout.forceDirected(graph, {
			springLength : 50,
			springCoeff : 1e-4,
			dragCoeff : .05,
			gravity : -60,
			theta : .5
		});
		var graphics = Viva.Graph.View.svgGraphics(), 
		nodeSize = 50;
		
		<c:set var="Cc" value="Cc"/>
		<c:set var="NCc" value="NCc"/>
		<c:set var="Dc" value="Dc"/>
		<c:set var="NDc" value="NDc"/>
		<c:set var="Cb" value="Cb"/>
		<c:set var="NCb" value="NCb"/>

		graph.addNode('<c:out value="${user.getId()}"/>', {
			name : '<c:out value="${user.getName()}"/>',
			closenessCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(Cc)}"/>',
			normalizedClosenessCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(NCc)}"/>',
			betweennessCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(Cb)}"/>',
			normalizedbetweennessCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(NCb)}"/>',
			degreeCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(Dc)}"/>',
			normalizedDegreeCentrality: '<c:out value="${graph.getNode(user.getId()).getAttribute(NDc)}"/>'
		});
		<c:forEach items="${friends}" var="friend">
		graph.addNode('<c:out value="${friend.getId()}"/>', {
			name : '<c:out value="${friend.getName()}"/>',
			closenessCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(Cc)}"/>',
			normalizedClosenessCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(NCc)}"/>',
			betweennessCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(Cb)}"/>',
			normalizedbetweennessCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(NCb)}"/>',
			degreeCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(Dc)}"/>',
			normalizedDegreeCentrality: '<c:out value="${graph.getNode(friend.getId()).getAttribute(NDc)}"/>'
		});
		</c:forEach>
		<c:forEach items="${friendships}" var="friendship">
		graph.addLink('<c:out value="${user.getId()}"/>',
		'<c:out value="${friendship.firstId}"/>');
		graph.addLink('<c:out value="${user.getId()}"/>',
		'<c:out value="${friendship.secondId}"/>');
		graph.addLink('<c:out value="${friendship.firstId}"/>',
				'<c:out value="${friendship.secondId}"/>');
		</c:forEach>
		//
		// we use this method to highlight all realted links
		// when user hovers mouse over a node:
		highlightRelatedNodes = function(nodeId, isOn) {
			// just enumerate all realted nodes and update link color:
			graph.forEachLinkedNode(nodeId, function(node, link) {
				var linkUI = graphics.getLinkUI(link.id);
				if (linkUI) {
					// linkUI is a UI object created by graphics below
					linkUI.attr('stroke', isOn ? 'red' : 'gray');
				}
			});
		};

		// Since we are using SVG we can easily subscribe to any supported
		// events (http://www.w3.org/TR/SVG/interact.html#SVGEvents ),
		// including mouse events:
		graphics.node(
				function(node) {
					var ui = Viva.Graph.svg('image').attr('width', nodeSize)
							.attr('height', nodeSize).link(
									'http://graph.facebook.com/' + node.id
											+ '/picture');

					$(ui).hover(function() { // mouse over
						highlightRelatedNodes(node.id, true);
					}, function() { // mouse out
						highlightRelatedNodes(node.id, false);
					});
					$(ui).dblclick(function() { //click friendGraph
						window.alert(node.data.name + "\n" + node.data.closenessCentrality);
					});
					return ui;
				}).placeNode(
				function(nodeUI, pos) {
					nodeUI.attr('x', pos.x - nodeSize / 2).attr('y',
							pos.y - nodeSize / 2);
				});

		graphics.link(function(link) {
			return Viva.Graph.svg('path').attr('stroke', 'gray');
		}).placeLink(
				function(linkUI, fromPos, toPos) {
					var data = 'M' + fromPos.x + ',' + fromPos.y + 'L'
							+ toPos.x + ',' + toPos.y;

					linkUI.attr("d", data);
				})

		// Finally render the graph with our customized graphics object:
		var renderer = Viva.Graph.View.renderer(graph, {
			layout : layout,
			graphics : graphics,
			container : document.getElementById("graph")
		});
		renderer.run();
	}
	
</script>

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
		<%-- <div class="large-3 small-12 columns ">
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
		</div> --%>

		<!-- Main Feed -->
		<!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->


		<div class="large-12 columns ">
			<!-- Feed Entry -->


			<div class="large-12 columns">
				<ul class="inline-list">
					<li><a href="<c:url value="/friendslist"/>"><Strong>Friends</strong></a></li>
					<li><a href="<c:url value="/friendsGraph"/>"><Strong>Graph</strong></a></li>
					<li class="right"><a href="<c:url value="/signout"/>">Logout</a></li>
				</ul>
				<div class="large-12 columns" id="graph"></div>
			</div>

			<!-- Right Sidebar -->
			<!-- On small devices this column is hidden -->




		</div>
	<%-- 	<div class="large-3 columns small-3">
			<br />
			<p id="back-top">
				<a href="#top"><span><br />Back to Top</span></a>
			</p>
		</div> --%>
	</div>
	<%-- <script>
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
	</script> --%>

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