<%@page import="test.rent.dao.RentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rentnum = Integer.parseInt(request.getParameter("rentnum"));

	boolean isSuccess = RentDao.getInstance().update(rentnum);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/return.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("반납완료 되었습니다.");
			location.href="${pageContext.request.contextPath }/my/rentlist.jsp";
		<%}else{ %>
			alert("반납에 실패했습니다.");
			location.href="${pageContext.request.contextPath }/my/rentlist.jsp";
		<%} %>
	</script>
</body>
</html>