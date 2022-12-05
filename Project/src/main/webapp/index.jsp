<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
</head>
<body>
	<%-- navbar 포함 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<%if(id!=null){ %>
		<p><%=id %>님 로그인 중...</p>
		<%} %>
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
			<%if(id!=null){ %>
				<li><a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a></li>
			<%} %>
			<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath }/books/list.jsp">도서목록</a></li>
			<%if(id != null && id.equals("manager")){ %>
				<li><a href="${pageContext.request.contextPath }/books/insertform.jsp">도서추가</a></li>
			<%} %>
			<li><a href="${pageContext.request.contextPath }/my/rentlist.jsp">대출목록</a></li>
			<li><a href="${pageContext.request.contextPath }/my/returnlist.jsp">반납목록</a></li>
			<li><a href="${pageContext.request.contextPath }/board/list.jsp">게시판</a></li>	
		</ul>
	</div>	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>