<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>K-Merz The Best Game Community</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver9">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v2">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v2">
<link rel="stylesheet" href="/resources/css/header.css?">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
	<header>
		<a href="#" class="logo">LOGO</a>
		<div class="toggle"></div>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Product</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="#">Community</a></li>
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
						<div class="toggle"></div>
						<ul>
							<li><a href="#">HOT</a></li>
							<li><a href="#">NEW</a></li>
							<li><a href="#">TOP</a></li>
							<li><input type="text"></li>
						</ul>
					</div>
				</div>
				<div class="searchBar border">
					<input class="border" type="text" placeholder="New Post...">
				</div>
				<div class="post border">
					<div class="leftbar">
						<ion-icon name="caret-down-outline"></ion-icon>
						<ion-icon name="caret-up-outline"></ion-icon>
					</div>
					<div class="postTitle">
						SHIT
					</div>
					<div class="postContent">
						Most Shit
					</div>
					<div class="BottmNavBar">
						Shit Nav
					</div>
				</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT</div>
				<div class="post border">SHIT9</div>
				<div class="post border">SHIT9</div>
				<div class="post border">SHIT9</div>
				<div class="post border">SHIT9</div>
				<div class="post border">SHIT9</div>
				<div class="post border">SHIT9</div>
			</div>
			<%@ include file="./include/rSidebar.jsp"%>
		</div>
	</section>
</body>
</html>
