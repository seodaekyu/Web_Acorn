<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 할일을 읽어와서 
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	// TodoDto에 담고
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	// DB에 저장하고
	boolean isSuccess = TodoDao.getInstance().insert(dto);
	// 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%-- 작업의 성공 여부에 따라 다른 내용을 응답해준다. --%>
		<% if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=dto.getContent() %></strong> 할일을 성공적으로 추가했습니다.
				<a class="alert-link" href="${pageContext.request.contextPath }/todo/list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				할일 정보 추가 실패!
				<a class="alert-link" href="${pageContext.request.contextPath }/todo/insertform.jsp">다시 입력하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>