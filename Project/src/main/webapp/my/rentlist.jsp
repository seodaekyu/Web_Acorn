<%@page import="test.book.dto.BookDto"%>
<%@page import="test.book.dao.BookDao"%>
<%@page import="java.util.List"%>
<%@page import="test.rent.dto.RentDto"%>
<%@page import="test.rent.dao.RentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	List<RentDto> list = RentDao.getInstance().ID_getDate(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my/rentlist.jsp</title>
</head>
<body>
	<div class="container">
		<h3>현재 대출 목록</h3>
		<table>
			<thead>
				<tr>
					<th>대여번호</th>
					<th>도서번호</th>
					<th>도서이름</th>
					<th>출판사</th>
					<th>저자</th>
					<th>대출일</th>
					<th>반납일</th>
				</tr>
			</thead>
			<tbody>
				<%for(RentDto tmp : list){ 
					if(tmp.getReturncompletedate()==null){%>
						<tr>
							<td><%=tmp.getRentnum() %></td>
							<td><%=tmp.getBooknum() %></td>
							<% BookDto bDto = BookDao.getInstance().getData(tmp.getBooknum()); %>
							<td><%=bDto.getName() %></td>
							<td><%=bDto.getPublisher() %></td>
							<td><%=bDto.getAuthor() %></td>
							<td><%=tmp.getRentdate() %></td>
							<td><%=tmp.getReturndate() %></td>
						</tr>
				<% 	} 
				  }%>
			</tbody>
		</table>
	</div>
</body>
</html>