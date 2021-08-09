<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%int index = (int)request.getAttribute("index"); %>
<%String[] paths = new String[index]; %>
<%Map<Integer, String> mType = (HashMap<Integer, String>)request.getAttribute("mediaType"); %>
<%for(int i = 0; i < index; i++){ %>
<%paths[i] = (String)request.getAttribute("path_" + i); %>
<%System.out.println(paths[i]); %>
<%System.out.println(mType); %>
	<%if(mType.get(i).equals("video")){ %>
	<div><video width="320" height="240" controls>
			<source src="http://localhost/media/loadVideo?path=<%=paths[i]%>.mp4" type=video/mp4>
		</video></div>
	<%}%>
	<%if(mType.get(i).equals("image")){ %>
	<div><img draggable='false' src="http://localhost/media/loadImage?path=<%=paths[i]%>.jpg"></div>
	<%}%>
<%}%>