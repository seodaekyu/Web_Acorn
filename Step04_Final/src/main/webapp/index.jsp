<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope에 id라는 키값으로 저장된 값이 있는지 읽어와 본다.(없으면 null)
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
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
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	
	<div class="container mt-4">
		<div class="row justify-content-md-center">
			<div class="card col-md-5 m-3 p-5">
				<div class="text-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">
					  <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z"/>
					  <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0z"/>
					</svg>
				</div>
				 <div class="card-body">
		    		<h5 class="card-title"><strong>공부</strong></h5>
		    		<%if(id==null){ %>
		    			<p class="card-text"><strong><mark class="text-danger">회원 전용 공간!</mark></strong><br>로그인 후 입장하세요!</p>
		    			<a href="${pageContext.request.contextPath }/private/study.jsp" class="btn btn-danger">Go study</a>
		    		<%}else{ %>
		    			<p class="card-text"> 열심히 공부하러 가요! </p>
		    			<a href="${pageContext.request.contextPath }/private/study.jsp" class="btn btn-dark">Go study</a>
		    		<%} %>
		  		</div>
			</div>
		
			<div class="card col-md-5 m-3 p-5" >
				<div class="text-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-controller" viewBox="0 0 16 16">
						 <path d="M11.5 6.027a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2.5-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm-6.5-3h1v1h1v1h-1v1h-1v-1h-1v-1h1v-1z"/>
						 <path d="M3.051 3.26a.5.5 0 0 1 .354-.613l1.932-.518a.5.5 0 0 1 .62.39c.655-.079 1.35-.117 2.043-.117.72 0 1.443.041 2.12.126a.5.5 0 0 1 .622-.399l1.932.518a.5.5 0 0 1 .306.729c.14.09.266.19.373.297.408.408.78 1.05 1.095 1.772.32.733.599 1.591.805 2.466.206.875.34 1.78.364 2.606.024.816-.059 1.602-.328 2.21a1.42 1.42 0 0 1-1.445.83c-.636-.067-1.115-.394-1.513-.773-.245-.232-.496-.526-.739-.808-.126-.148-.25-.292-.368-.423-.728-.804-1.597-1.527-3.224-1.527-1.627 0-2.496.723-3.224 1.527-.119.131-.242.275-.368.423-.243.282-.494.575-.739.808-.398.38-.877.706-1.513.773a1.42 1.42 0 0 1-1.445-.83c-.27-.608-.352-1.395-.329-2.21.024-.826.16-1.73.365-2.606.206-.875.486-1.733.805-2.466.315-.722.687-1.364 1.094-1.772a2.34 2.34 0 0 1 .433-.335.504.504 0 0 1-.028-.079zm2.036.412c-.877.185-1.469.443-1.733.708-.276.276-.587.783-.885 1.465a13.748 13.748 0 0 0-.748 2.295 12.351 12.351 0 0 0-.339 2.406c-.022.755.062 1.368.243 1.776a.42.42 0 0 0 .426.24c.327-.034.61-.199.929-.502.212-.202.4-.423.615-.674.133-.156.276-.323.44-.504C4.861 9.969 5.978 9.027 8 9.027s3.139.942 3.965 1.855c.164.181.307.348.44.504.214.251.403.472.615.674.318.303.601.468.929.503a.42.42 0 0 0 .426-.241c.18-.408.265-1.02.243-1.776a12.354 12.354 0 0 0-.339-2.406 13.753 13.753 0 0 0-.748-2.295c-.298-.682-.61-1.19-.885-1.465-.264-.265-.856-.523-1.733-.708-.85-.179-1.877-.27-2.913-.27-1.036 0-2.063.091-2.913.27z"/>
					</svg>
				</div>
				<div class="card-body">
			    	<h5 class="card-title"><strong>게임</strong></h5>
			    	<%if(id==null){ %>
		    			<p class="card-text"><strong><mark class="text-danger">회원 전용 공간!</mark></strong><br>로그인 후 입장하세요!</p>
		    			<a href="${pageContext.request.contextPath }/private/game.jsp" class="btn btn-danger">Go game</a>
		    		<%}else{ %>
		    			<p class="card-text"> 재밌는 게임을 즐기러 가요~ </p>
		    			<a href="${pageContext.request.contextPath }/private/game.jsp" class="btn btn-dark">Go game</a>
		    		<%} %>
			  	</div>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="card col-md-5 m-3 p-5" >
				<div class="text-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-archive" viewBox="0 0 16 16">
					  <path d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1V2zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5H2zm13-3H1v2h14V2zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					</svg>
				</div>
				<div class="card-body">
			    	<h5 class="card-title"><strong>자료실</strong></h5>
			    	<p class="card-text"> 다양한 이미지 업로드, 이미지 내려받기를 할 수 있는 자료실 입니다!!</p>
			    	<a href="${pageContext.request.contextPath }/file/list.jsp" class="btn btn-dark">Go file</a>
			  	</div>
			</div>
			<div class="card col-md-5 m-3 p-5" >
				<div class="text-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
					  <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
					  <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
					</svg>
				</div>
				<div class="card-body">
			    	<h5 class="card-title"><strong>글 목록 보기</strong></h5>
			    	<p class="card-text">글을 업로드하고, 자세히 볼 수 있는 게시판 카페입니다!</p>
			    	<a href="${pageContext.request.contextPath }/cafe/list.jsp" class="btn btn-dark">Go cafe</a>
			  	</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>