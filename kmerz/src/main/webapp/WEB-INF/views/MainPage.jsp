<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="./include/header.jsp" %>

	<section class="banner">
		<div>
		<!-- autoplay="autoplay" -->
		<video id="v" muted="muted" loop="loop" onmouseenter="bannerVideo(this)" 
		poster="https://cdn.akamai.steamstatic.com/steam/apps/814380/capsule_616x353.jpg?t=1603904569">
			<source
				src="https://cdn.akamai.steamstatic.com/steam/apps/256820008/movie480_vp9.webm?t=1612278985"
				type="video/webm">
		</video>
	</div>
		<div class="textBox">
			<h2>TextBox<br><span>ANG</span> test</h2>
			<h3>REOGAMER DEV</h3>
			<a href="#" class="btn">Button</a>
		</div>
		
	</section>
	
	<section class="postSection">
		<div class="sticky">
			<div class="stickyHeader">
				<div class="toggle"></div>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Product</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Community</a></li>
					</ul>
				</div>
			</div>
		<div class="posts">
			<%@ include file="./include/lSidebar.jsp" %>
			<div class="postList">
			POST LIST
				<div class="post">
				GIMOTI
				</div>
				
				<div class="post">
				SHIT
				</div>
			</div>
			<%@ include file="./include/rSidebar.jsp" %>
		</div>
	</section>
</body>
</html>
