<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// id 받아오기
	String id = (String)session.getAttribute("id");
	// 게시물 작성 내용 받아오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// BoarDto에 담기
	BoardDto dto = new BoardDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = BoardDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/private/insert.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("게시물이 저장되었습니다.");
			location.href="${pageContext.request.contextPath }/board/list.jsp";
		<%}else{ %>
			alert("게시물 저장에 실패했습니다.");
			location.href="${pageContext.request.contextPath }/board/private/insertform.jsp";
		<%} %>
	</script>
</body>
</html>