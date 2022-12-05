<%@page import="test.rent.dao.RentDao"%>
<%@page import="test.rent.dto.RentDto"%>
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
<style>
	html {
	  position: relative;
	  min-height: 100%;
	  padding-bottom:160px;
	}
	body {
	  margin-bottom: 160px;
	}
	footer {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  height: 160px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- navbar 포함 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="bookList" name="thisPage"/>
	</jsp:include>
	<div class="container">
			<h3><strong>도서 목록</strong></h3>
		<table class="table table-striped mt-3">
			<thead class="table-dark">
				<tr>
					<th>도서번호</th>
					<th>도서이름</th>
					<th>출판사</th>
					<th>저자</th>
					<th>출판일</th>
					<th>대출</th>
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
						<%if(RentDao.getInstance().BookNum_getDate(tmp.getNum()) == null){ %>
							<td><button onclick="location.href='rent.jsp?booknum=<%=tmp.getNum()%>'">대출</button></td>
						<%} %>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>