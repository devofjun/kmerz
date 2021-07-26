<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0 user-scale=no">
<link rel="stylesheet" href="/resources/css/PostingPage.css?ver3">
<link rel="stylesheet" href="/resources/css/header.css?ver4">
<script src="/resources/script/PostingPage.js?ver7"></script>
<title>Posting to KMerz</title>
</head>
<body>
	<div class="modal-section">
	
	</div>
	<div>
		<%@ include file="./include/top_menu_bar.jsp"%>
	</div>
	<div class="section">
		<div class="posting-section">
			<div class="posting-input">
				<div class="page-title"><span>Create Post</span></div>
				<div class="posting-nav">
					<div class="insert-text">
						<div><span><button><img src="/resources/images/icons/postingNav/format_bold_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/format_italic_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/add_link_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/format_size_black_24dp.svg"></button></span></div>
					</div>
					<div class="insert-space">
						<div><span><button><img src="/resources/images/icons/postingNav/format_list_bulleted_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/format_list_numbered_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/format_quote_black_24dp.svg"></button></span></div>
					</div>
					<div class="insert-reference">
						<div><span><button><img src="/resources/images/icons/postingNav/window_black_24dp.svg"></button></span></div>
						<div><span><button onclick="openFILE_INSERT_Modal()"><img src="/resources/images/icons/postingNav/image_black_24dp.svg"></button></span></div>
						<div><span><button><img src="/resources/images/icons/postingNav/smart_display_black_24dp.svg"></button></span></div>
					</div>
				</div>
				<textarea id="post_title" maxlength="300" placeholder="Title"></textarea>
				<div id="editable" class="editable" contenteditable="true"></div>
				<button class="posting" onclick="posting()">Post</button>
			</div>
			<div class="right-menu">
				<div class="post-rule">post-rule</div>
				<div class="policy">policy</div>
			</div>
		</div>
	</div>
</body>
</html>