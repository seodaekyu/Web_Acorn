<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/books/inserform.jsp</title>
</head>
<body>
	<div class="container">
		<form action="insert.jsp" method="post">
			<div>
				<label for="name">도서명</label>
				<input type="text" name="name" id="name" />
			</div>
			<div>
				<label for="publisher">출판사</label>
				<input type="text" name="publisher" id="publisher" />
			</div>
			<div>
				<label for="author">저자</label>
				<input type="text" name="author" id="author" />
			</div>
			<div>
				<label for="publicationdate">출판일</label>
				<input type="date" name="publicationdate" id="publicationdate" />
			</div>

			<button type="submit">저장</button>
		</form>
	</div>
</body>
</html>