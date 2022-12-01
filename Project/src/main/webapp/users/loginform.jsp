<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Get 방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어와 본다.
	String url = request.getParameter("url");
	// 만일 넘어오는 값이 없다면
	if(url==null){
		// 로그인 후 인덱스 페이지로 갈 수 있도록 한다.
		String cPath = request.getContextPath();
		url = cPath+"/index.jsp";
	}
	
	// 쿠키에 저장된 아이디와 비밀번호를 담을 변수
	String savedId = "";
	String savedPwd = "";
	// 쿠키에 저장된 값을 위의 변수에 저장하는 코드
	Cookie[] cooks = request.getCookies();
	if(cooks!=null){
		// 반복문 돌면서 쿠키 객체를 하나씩 참조해서
		for(Cookie tmp:cooks){
			// 저장된 키값을 읽어옴
			String key = tmp.getName();
			// 만일 키 값이 savedId라면
			if(key.equals("savedId")){
				// 쿠키 value 값을 savedId 라는 지역변수에 저장
				savedId = tmp.getValue();
			}
			if(key.equals("savedPwd")){
				savedPwd = tmp.getValue();
			}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	
	<div class="container mt-3">
		<h3>로그인 폼</h3>
		<form action="login.jsp" method = "post">
			<!-- 로그인 성공 후 어디로 갈 지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록 한다. -->
			<input type="hidden" name = "url" value="<%=url %>" />
			<div>
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" value="<%=savedId %>"/>
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" value="<%=savedPwd %>"/>
			</div>
			<div>
				<label>
					<input type="checkbox" name="isSave" value="yes" ${ not empty cookie.savedId ? 'checked':'' }/>
					로그인 정보 저장
				</label>
			</div>
			<button class="btn btn-dark mt-3" type="submit">로그인</button>
		</form>
	</div>
	
</body>
</html>