<%@page import="test.book.dao.BookDao"%>
<%@page import="test.book.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 추가할 책 정보 받아오기
	String name = request.getParameter("name");
	String publisher = request.getParameter("publisher");
	String author = request.getParameter("author");
	String publicationdate = request.getParameter("publicationdate");
	// bookdto에 책정보 넣기
	BookDto dto = new BookDto();
	dto.setName(name);
	dto.setPublisher(publisher);
	dto.setAuthor(author);
	dto.setPublicationDate(publicationdate);
	// DB에 정보 insert
	boolean isSuccess = BookDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/insert.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("<%=name%> 책 정보를 추가했습니다.");
			location.href="${pageContext.request.contextPath }/books/list.jsp";
		<%}else{ %>
			alert("책 정보를 추가하지 못했습니다.");
			location.href="${pageContext.request.contextPath }/books/insertform.jsp";
		<%} %>
	</script>
</body>
</html>