<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int index = (int)request.getAttribute("index"); %>
<%String[] paths = new String[index]; %>
<%for(int i = 0; i < index; i++){ %>
<%paths[i] = (String)request.getAttribute("path_" + i); %>
<%System.out.println(paths[i]); %>
<video width="320" height="240" controls>
	<source src="http://localhost:8001/media/loadVideo?path=<%=paths[i]%>" type=video/mp4>
</video>
<%}%>