<%@page import="com.kmerz.app.vo.CategoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%List<CategoryVo> cateList =  (List<CategoryVo>)request.getAttribute("cateList");%>
<div id="appended-category">
<select id="category-input">
	<option value="0">Select Category:</option>
	<% System.out.println("카테리스트" + cateList);
	for(int i = 0; i < cateList.size(); i++){ %>
	<option value="<%=cateList.get(i).getCategory_no()%>"><%=cateList.get(i).getCategory_name() %></option>
	<%} %>
</select>

</div>