<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 수정할 글의 정보를 얻어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String title = (String)request.getParameter("title");
	String content = (String)request.getParameter("content");
	
	// CafeDto 객체에 담고 
	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	// DB에 수정반영
	boolean isSuccess = CafeDao.getInstance().update(dto);
	
	// 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p class="alert alert-success">
			 	수정했습니다.
				<a href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num%>">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				수정을 실패했습니다.
				<a href="updateform.jsp?num=<%=dto.getNum()%>">다시 수정하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>