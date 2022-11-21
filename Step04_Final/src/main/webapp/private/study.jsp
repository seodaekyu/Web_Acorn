<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 로그인된 아이디가 있는지 확인해서
	String id = (String)session.getAttribute("id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<h1>공부페이지 입니다.</h1>
	<p><%=id %>님 열심히 공부해요!</p>
</body>
</html>