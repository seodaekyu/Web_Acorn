<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 게시글 번호 얻기
	int num = Integer.parseInt(request.getParameter("num"));
	// 수정된 게시글 정보 얻기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// BoardDto에 넣기
	BoardDto dto = new BoardDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	// DB에 수정된 내용 업데이트
	boolean isSuccess = BoardDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("게시물이 수정되었습니다.");
			location.href="${pageContext.request.contextPath }/board/list.jsp";
		<%}else{ %>
			alert("게시물 수정에 실패했습니다.");
			location.href="${pageContext.request.contextPath }/board/private/updateform.jsp";
		<%} %>
	</script>
</body>
</html>