<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/inserform.jsp</title>
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
		<jsp:param value="bookPlus" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3 class="mt-3"><strong>도서 추가</strong></h3>	
		<form action="insert.jsp" method="post">
			<div class="mb-3 col-6">
				<label class="form-label mt-3" for="name">도서명</label>
				<input class="form-control" type="text" name="name" id="name" />
			</div>
			<div class="mb-3 col-6">
				<label class="form-label mt-3" for="publisher">출판사</label>
				<input class="form-control" type="text" name="publisher" id="publisher" />
			</div>
			<div class="mb-3 col-6">
				<label class="form-label mt-3" for="author">저자</label>
				<input class="form-control" type="text" name="author" id="author" />
			</div>
			<div class="mb-3 col-6">
				<label class="form-label mt-3" for="publicationdate">출판일</label>
				<input type="date" name="publicationdate" id="publicationdate" />
			</div>

			<button class="btn btn-dark" type="submit">저장</button>
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
</body>
</html>