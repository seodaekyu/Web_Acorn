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
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
			alert("<%=booknum %>번 책이 대출되었습니다.");
			location.href="${pageContext.request.contextPath }/books/list.jsp";
		<%}else{ %>
			alert("대출에 실패했습니다.");
			location.href="${pageContext.request.contextPath }/books/list.jsp";
		<%} %>
</body>
</html>