<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 후 가야할 목적지 정보
	String url = request.getParameter("url");
	// 로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
	String encodeUrl = URLEncoder.encode(url);
	
	// 1. 폼 전송되는 아이디, 비밀번호 읽어오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	
	// 체크 박스를 체크한 상태로 로그인 버튼을 누르면 null이 아님
	String isSave = request.getParameter("isSave");
	if(isSave != null){
		// 아이디 비밀번호를 쿠키로 응답하고 1주일동안 유지되도록함.
		Cookie cook1 = new Cookie("savedId", id);
		Cookie cook2 = new Cookie("savedPwd", pwd);
		cook1.setMaxAge(60*24*7);
		cook2.setMaxAge(60*24*7);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}else{
		// 특정 키값으로 저장된 쿠키값 삭제하기(value에는 아무 값이나 넣어도 상관없다.)
		Cookie cook1 = new Cookie("savedId", "");
		Cookie cook2 = new Cookie("savedPwd", "");
		cook1.setMaxAge(0);
		cook2.setMaxAge(0);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}

	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	// 2. DB에 실제로 존재하는 맞는 정보인지 확인한다.(맞는 정보이면 로그인처리 한다.)
	boolean isValid= UsersDao.getInstance().isValid(dto);
	if(isValid){
		// session scope에 id라는 키값으로 로그인된 아이디 담기
		session.setAttribute("id", id);
	}
	
	// 3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/users/login.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-3">
		<%if(isValid) {%>
			<p class="alert alert-success">
				<strong><%=dto.getId() %></strong> 님 로그인되었습니다.
				<a href="<%=url%>">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				아이디 혹은 비밀번호가 틀려요
				<!-- 
					get방식 파라미터를 전달할 때 반드시! 인코딩을 해야함.
					/users/loginform.jsp?url=/Step04/aaa/bbb.jsp?num=2&code=a666 전체를 읽어내야하는데 
					/Step04/aaa/bbb.jsp?num=2밖에 안읽어짐. 뒤에 &은 또다른 파라미터로 인식됨.
					loginform.jsp 페이지에서 request.getParameter("url") => "/Step04/aaa/bbb.jsp?num=2"
					따라서 /users/loginform.jsp?url=%xStep04%xaaa%xbbb.jsp%xnum%x2%xcode%xa666처럼 인코딩을 시켜줘야함.
					인코딩을 하면 알아서 바꿔주고 request.getParameter("")를 하면 알아서 디코딩해줌.					
				 --> 
				<a href="${pageContext.request.contextPath }/users/loginform.jsp?url=<%=encodeUrl%>">다시시도</a>				
			</p>
		<%} %>
	</div>
</body>
</html>