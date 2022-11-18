<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
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
		         <li class="breadcrumb-item active">회원 추가 페이지</li>
		      </ol>
		   </nav>
		<h2 class="m-3">할일 추가하기</h2>
		<form action="${pageContext.request.contextPath }/todo/insert.jsp" method="post">
			<div class="mb-3 col-5">
				<label for="content" class="form-label">할일</label>
				<input type="text" name="content" class="form-control" id="content"/>
			</div>
			<button type="submit" class="btn btn-dark">추가</button>
		</form>
	</div>
</body>
</html>