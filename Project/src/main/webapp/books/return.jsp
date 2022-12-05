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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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