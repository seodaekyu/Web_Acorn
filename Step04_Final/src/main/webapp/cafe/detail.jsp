<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자세히 보여줄 글의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	// DB에서 해당글의 정보를 얻어와서
	CafeDto dto = CafeDao.getInstance().getData(num);	
	// 글 조회수도 1 증가 시킨다.
	CafeDao.getInstance().addViewCount(num);
	// 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="border m-5 p-5">
			<h3 ><strong><%=dto.getTitle() %></strong></h3>
			<table class="mt-3">
				<tr>
					<th class="pe-3">글번호</th>
					<td><%=dto.getNum() %></td>
				</tr>
				<tr>
					<th class="pe-3">작성자</th>
					<td><%=dto.getWriter() %></td>
				</tr>
			
				<tr>
					<th class="pe-3">조회수</th>
					<td><%=dto.getViewCount() %></td>
				</tr>
				<tr>
					<th class="pe-3">작성일</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</table>
			<hr>
			<p><%=dto.getContent() %></p>
			<%
				// 로그인된 아이다가 있으면 읽어온다.(null일 수도 있다.)
				String id = (String)session.getAttribute("id");
			%>
			<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
			<%if(dto.getWriter().equals(id)){ %>
				<div class="text-end">
					<button class="btn btn-dark" onclick="location.href='private/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
					<button class="btn btn-danger" onclick="deleteConfirm()">삭제</button>
				</div>
				<script>
					function deleteConfirm(){
						const isDelete = confirm("이 글을 삭제하겠습니까?");
						if(isDelete){
							location.href="private/delete.jsp?num=<%=dto.getNum()%>"
						}
					}
				</script>
			<%} %>
		</div>
	</div>
</body>
</html>