<%@page import="com.kmerz.app.util.ContentReadAndWrite"%>
<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@page import="com.kmerz.app.vo.CategoryVo"%>
<%@page import="com.kmerz.app.vo.CommunityVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%List<CommunityVo> commList = (List<CommunityVo>)request.getAttribute("commList"); %>
<%List<CategoryVo> cateList = (List<CategoryVo>)request.getAttribute("cateList"); %>
<%PostsVo postVo = (PostsVo)request.getAttribute("postVo"); %>
<div class="posting-input">
	<div class="posting-nav">
		<div class="insert-text">
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_bold_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_italic_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/add_link_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_size_black_24dp.svg" />
					</button></span>
			</div>
		</div>
		<div class="insert-space">
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_list_bulleted_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_list_numbered_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/format_quote_black_24dp.svg" />
					</button></span>
			</div>
		</div>
		<div class="insert-reference">
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/window_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button onclick="openFILE_INSERT_Modal()">
						<img src="/resources/images/icons/postingNav/image_black_24dp.svg" />
					</button></span>
			</div>
			<div>
				<span><button>
						<img
							src="/resources/images/icons/postingNav/smart_display_black_24dp.svg" />
					</button></span>
			</div>
		</div>
		<div class="community-input">
			<select id="community-input" onchange="getCategoryInput()">
				<option value="0">Select Community:</option>
				<%
					for (int i = 0; i < commList.size(); i++) {
				%>
				<option value="<%=commList.get(i).getCommunity_id()%>"><%=commList.get(i).getCommunity_name()%></option>
				<%
					}
				%>
			</select>
		</div>
		<div id="category-input"></div>
	</div>
	<div id="editfield">
		<textarea id="post_title" maxlength="300" placeholder="Title"><%if(postVo != null){%><%=postVo.getPost_title()%><%} %></textarea>
		<div id="editable" class="editable" contenteditable="true"><%if(postVo != null){%><%=ContentReadAndWrite.ReadContent(postVo.getPost_content_file())%><%} %></div>
	</div>
</div>
