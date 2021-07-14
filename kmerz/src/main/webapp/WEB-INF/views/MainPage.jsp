<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=0.8 user-scale=no">
<meta charset="UTF-8">
<title>K-Merz The Best Game Community</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver35">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v10">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v10">
<link rel="stylesheet" href="/resources/css/header.css?">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>

</script>
</head>

<body>
	<%@ include file="./include/modal.jsp"%>
	<script>
		var modal = document.getElementById("myModal");
		console.log(modal);
		function openModal() {
			modal.style.display = "block";
		}
		function closeModal() {
			modal.style.display = "none";
		}
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

	<header>

		<a href="#" class="logo">LOGO</a>
		<div class="toggle"></div>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Product</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="/c/createForm">Community</a></li>
		</ul>
	</header>
	<section class="banner">
		<div class="hero_capsule app_impression_tracked"
			data-ds-appid="289070">
			<a
				href="https://store.steampowered.com/app/289070/Sid_Meiers_Civilization_VI/?snr=1_4_600__651"
				class="hero_click_overlay"></a> <img class="hero_capsule_img"
				src="https://cdn.akamai.steamstatic.com/steam/clusters/sale_autumn2019_assets/54b5034d397baccb93181cc6/hero_289070_english.png?t=1625159088"
				data-src="https://cdn.akamai.steamstatic.com/steam/clusters/sale_autumn2019_assets/54b5034d397baccb93181cc6/hero_289070_english.png?t=1625159088">
			<div class="hover_screenshots">
				<div class="hover_video_container hero_screenshot_load"
					data-background="url( https://cdn.akamai.steamstatic.com/steam/apps/289070/ss_36c63ebeb006b246cb740fdafeb41bb20e3b330d.600x338.jpg?t=1616688275  )"
					style="background-image: url(&quot;https://cdn.akamai.steamstatic.com/steam/apps/289070/ss_36c63ebeb006b246cb740fdafeb41bb20e3b330d.600x338.jpg?t=1616688275&quot;);">
					<video class="hero_video" loop="loop" preload="none" muted="muted"
						autoplay="autoplay">
						<source
							src="https://cdn.akamai.steamstatic.com/steam/apps/256672703/microtrailer.webm?t=1476737110?v=3"
							type="video/webm">
					</video>
				</div>
			</div>
			<div class="hero_data">
				<div class="hero_data_content">
					<div class="hero_name">Sid Meier’s Civilization® VI</div>
					<div class="hero_stat">
						<span class="label">개발자:</span> <span class="data"> <a
							href="https://store.steampowered.com/developer/firaxisgames?snr=1_4_600__629">Firaxis
								Games</a>, <a
							href="https://store.steampowered.com/developer/Aspyr?snr=1_4_600__629">Aspyr
								(Mac)</a>, <a
							href="https://store.steampowered.com/developer/Aspyr?snr=1_4_600__629">Aspyr
								(Linux)</a>
						</span>
					</div>
					<div class="hero_stat">
						<span class="label">배급사:</span> <span class="data"> <a
							href="https://store.steampowered.com/publisher/2K?snr=1_4_600__629">2K</a>,
							<a
							href="https://store.steampowered.com/publisher/Aspyr?snr=1_4_600__629">Aspyr
								(Mac)</a>, <a
							href="https://store.steampowered.com/publisher/Aspyr?snr=1_4_600__629">Aspyr
								(Linux)</a>
						</span>
					</div>
					<div class="hero_stat"
						data-tooltip-html="이 게임에 대한 사용자 평가 115,991개 중 82% 가 긍정적입니다.">
						<span class="label">모든 평가</span> <span class="data"> <span
							class="game_review_summary positive"> 매우 긍정적 </span> <span
							style="color: #AEAEAE;">(115,991)</span>
						</span>
					</div>
				</div>
				<div class="hero_add_to_cart">
					<button class="btn_green_white_innerfade btn_medium" type="button"
						onclick="addToCart( 123215 );">
						<span>장바구니에 추가</span>
					</button>
				</div>
			</div>

			<div class="discount_block discount_block_inline hero_discount"
				data-price-final="1625000">
				<div class="discount_pct">-75%</div>
				<div class="discount_prices">
					<div class="discount_original_price">₩ 65,000</div>
					<div class="discount_final_price">₩ 16,250</div>
				</div>
			</div>
			<div class="ds_options">
				<div></div>
			</div>
		</div>
	</section>
	<section class="postSection">
		<div class="posts">
			<%@ include file="./include/lSidebar.jsp"%>
			<div class="postList">
				<div class="sticky">
					<div class="stickyHeader">
						<ul>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="rocket-outline"></ion-icon><span> BEST</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="flame-outline"></ion-icon><span> HOT</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="flag-outline"></ion-icon><span> NEW</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="podium-outline"></ion-icon><span> TOP</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="trending-up-outline"></ion-icon><span> RISING</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="ellipsis-horizontal-outline"></ion-icon></a></li>
						</ul>
					</div>
					<div class="searchBar border">
						<div class="inputSection">
							<div class="PostingTitleDiv">
								<input class="PostingTitle" type="text" placeholder="Title...">
							</div>
							<input class="PostingContent" type="text"
								placeholder="Post Content...">
						</div>
						<div class="inputSelection">
							<ul class="border">
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>COMMUNITY</span></li>
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>CATEGORY</span></li>
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>POST TYPE</span></li>
								<li class="bd"><ion-icon size="large"
										name="add-circle-outline"></ion-icon><span>POSTING
										DETAIL</span></li>
								<li class="bd"><ion-icon size="large"
										name="checkmark-circle-outline"></ion-icon><span>POST</span></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
				<!-- 포스트 DEFAULT 시작 -->
				<div class="postBox">
					<input type="checkbox" id="toggleBtn" style="display: none" checked>
					<div class="post border">
						<div class="leftbar">
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-up-circle-outline"></ion-icon></a>
							</div>
							<span>0</span>
							<div class="like">
								<a href="#"><ion-icon size="large"
										name="caret-down-circle-outline"></ion-icon></a>
							</div>
							<div class="BottmNavBar">
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
								</div>
								<div class="toggleNav">
									<a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a>
								</div>
								<div>
									<a href="#"><ion-icon size="large"
											name="ellipsis-horizontal-circle-outline"></ion-icon></a>
								</div>
							</div>
						</div>
						<div class="rightbar">
							<div class="contentTop">
								<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
								<div class="communityAdress">
									<a href="#"><img
										src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span>
										- 3분전 / 작성자 : </span><a href="#"><img
										src="/resources/images/starcraft_small.jpg">윤수</a>
								</div>
							</div>
							<div class="postContent border" onclick="openModal()">
								<p>람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더 람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
							</div>


							<div class="postDown">
								<label for="toggleBtn" class="labelBtn" onclick=""> <ion-icon
										name="chevron-up-outline"></ion-icon></label>
							</div>

						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->

			</div>
			<%@ include file="./include/rSidebar.jsp"%>
			${sessionScope.loginVo}
		</div>
	</section>
</body>
</html>
