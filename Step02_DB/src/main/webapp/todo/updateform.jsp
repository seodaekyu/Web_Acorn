<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 수정할 회원의 번호를 읽어와서
	int num = Integer.parseInt(request.getParameter("num"));
	// 해당 할일의 정보를 DB에서 불러온 다음
	TodoDto dto = TodoDao.getInstance().getData(num);
	// 수정할 수 있는 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<nav class="mt-2">
		      <ol class="breadcrumb">
		         <li class="breadcrumb-item">
		            <a href="${pageContext.request.contextPath }/index.jsp">Home</a>
		         </li>
		         <li class="breadcrumb-item">
		            <a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
		         </li>
		         <li class="breadcrumb-item active">회원 수정 페이지</li>
		      </ol>
		   </nav>
		<h2 class="m-3">할일 수정하기</h2>
		<form action="${pageContext.request.contextPath }/todo/update.jsp" method="post">
			<div class="mb-3 col-5">
				<label for="content">번호</label>
				<input type="text" name="num" id="num" value="<%= dto.getNum()%>" readonly/>
			</div>
			<div class="mb-3 col-5">
				<label for="content">할일</label>
				<input type="text" name="content" id="content"  value="<%= dto.getContent()%>"/>
			</div>
			<div class="mb-3 col-5">
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate" value="<%= dto.getRegdate()%>" readonly/>
			</div>
			<button type="submit" class="btn btn-dark">수정확인</button>
			<button type="reset" class="btn btn-dark">취소</button>
			
		</form>
	</div>
</body>
</html>