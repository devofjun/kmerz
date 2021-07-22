<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="lSidebar">
	<div class="communityList border sticky">
		<div class="commHeader hr">
			<a><img src="/resources/images/starcraft_small.jpg"><span>카테고리
					리스트</span></a>
		</div>
		<ul>
			<c:forEach var="CategoryVo" items="${categoryList}">
				<li><a href="#"><span>${CategoryVo.category_name}</span></a></li>
			</c:forEach>
		</ul>
	</div>
</div>