<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = FileDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num%>번 파일이 삭제되었습니다.");
			location.href="${pageContext.request.contextPath }/file/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("삭제를 실패했습니다.");
			location.href="${pageContext.request.contextPath }/file/list.jsp";
		</script>
	<%} %>
</body>
</html>