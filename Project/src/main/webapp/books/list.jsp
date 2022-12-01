<%@page import="test.book.dto.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="test.book.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BookDto> list =  BookDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/list.jsp</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서이름</th>
				<th>출판사</th>
				<th>저자</th>
				<th>출판일</th>
			</tr>
		</thead>
		<tbody>
			<%for(BookDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getPublisher() %></td>
					<td><%=tmp.getAuthor() %></td>
					<td><%=tmp.getPublicationDate() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>