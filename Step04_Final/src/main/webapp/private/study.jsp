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
<style>
	html {
	  position: relative;
	  min-height: 100%;
	  padding-bottom:160px;
	}
	body {
	  margin-bottom: 160px;
	}
	footer {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  height: 160px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- navbar 포함 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="study" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<h1 class="mt-3">공부페이지 입니다.</h1>
		<p class="mt-3"><%=id %>님 열심히 공부해요!</p>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
</body>
</html>