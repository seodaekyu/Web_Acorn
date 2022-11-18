<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 폼 전송되는 회원의 이름과 주소를 읽어온다.
		2. MemberDao에 MemberDto를 전달하면 DB에 저장을하고 작업의 성공 여부를 리턴하는 insert() 메소드를 만든다.
			회원 번호는 시퀀스를 이용해서 들어가도록 한다.
		3. 위에서 추출한 회원의 이름과 주소를 MemberDto 객체에 담는다.
		4. MemberDao 객체를 이용해서 MemberDto 객체에 담긴 회원 정보를 DB에 저장한다.
		5. 작업의 성공 여부를 클라이언트에게 응답한다.
	*/
	
	// 폼 전송되는 회원의 이름과 주소를 읽어온다.
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	// MemberDto 객체에 회원의 이름과 주소를 담고
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	// MemberDao 객체를 이용해서 DB에 저장하고 작업의 성공 여부를 리턴 받는다.
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.insert(dto);
	
	// 응답하기
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<%-- 작업의 성공 여부에 따라 다른 내용을 응답해준다. --%>
		<% if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=name %></strong>님의 정보를 성공적으로 추가했습니다.
				<a class="alert-link" href="${pageContext.request.contextPath }/member/list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				회원 정보 추가 실패!
				<a class="alert-link" href="${pageContext.request.contextPath }/member/insertform.jsp">다시 입력하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>