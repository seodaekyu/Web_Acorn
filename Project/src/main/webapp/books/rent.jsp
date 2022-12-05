<%@page import="test.rent.dao.RentDao"%>
<%@page import="test.rent.dto.RentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int booknum = Integer.parseInt(request.getParameter("booknum"));
	
	RentDto dto = new RentDto();
	dto.setId(id);
	dto.setBooknum(booknum);
	
	boolean isSuccess = RentDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/rent.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("<%=booknum %>번 책이 대출되었습니다.");
			location.href="${pageContext.request.contextPath }/books/list.jsp";
		<%}else{ %>
			alert("대출에 실패했습니다.");
			location.href="${pageContext.request.contextPath }/books/list.jsp";
		<%} %>
	</script>
</body>
</html>