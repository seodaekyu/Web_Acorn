<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test09.jsp</title>
</head>
<body>
	<h1>fetch() 함수 테스트</h1>
	<!-- fetch는 internet explore에서는 사용 안됨. -->
	<button id="myBtn">눌러보셈</button>
	<a href="${pageContext.request.contextPath }/index.jsp">눌러보셈</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click", function(){
			//페이지 전환 없이 index.jsp 페이지로 요청하기 
			fetch("${pageContext.request.contextPath }/users/loginform.jsp")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				//index.jsp 페이지가 응답하는 문자열이 함수의 인자로 전달된다. 
				console.log(data);
			});	
		});	
	</script>
</body>
</html>






