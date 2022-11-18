<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// "list"라는 키값으로 request scope에 담겨 있는 List<String> type의 참조값 얻어오기
	// WEB-INF는 보안되는 폴더이기 때문에 직접 접근은 안됨
	// forward를 통해서는 가능함.
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/friend/list.jsp</title>
</head>
<body>
	<h3>친구 목록입니다.</h3>
	<ul>
		<%for(String tmp:list){%>
			<li><%=tmp%></li>
		<%} %>
	</ul>
</body>
</html>