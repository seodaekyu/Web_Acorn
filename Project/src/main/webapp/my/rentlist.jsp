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
		<jsp:param value="rentList" name="thisPage"/>
	</jsp:include>
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
					<th>반납</th>
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
							<td><button onclick="location.href='${pageContext.request.contextPath }/books/return.jsp?rentnum=<%=tmp.getRentnum() %>'">반납</button></td>
						</tr>
				<% 	} 
				  }%>
			</tbody>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
</body>
</html>