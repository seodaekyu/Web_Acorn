<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage = request.getParameter("thisPage");
	String id = (String)session.getAttribute("id");
%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="background-color:#712cf9;">
   <div class="container">
       <a class="navbar-brand" href="${pageContext.request.contextPath }/">
          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
  				<path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z"/>
			</svg>
          Home
       </a>
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
        </button>		
	    <div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("study") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("game") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("fileList") ? "active" : "" %>" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("cafeList") ? "active" : "" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">글목록보기</a>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-collapse justify-content-end" id="navbarNav2">
			<ul class="navbar-nav">
				<%if(id == null){ %>
	               <li class="nav-item">
	                  <a class="nav-link <%=thisPage.equals("signupForm") ? "active" : "" %>" href="${pageContext.request.contextPath }/users/signup_form.jsp" >회원가입</a>
	               </li>
	               <li class="nav-item">
	                  <a class="nav-link <%=thisPage.equals("loginForm") ? "active" : "" %>" href="${pageContext.request.contextPath }/users/loginform.jsp" >로그인</a>
	               </li>
	            <%}else{%>
	            	 <li class="nav-item">
	                  	<a class="nav-link" ><%=id %>님 </a>
	               	</li>
	               	<li class="nav-item">
	               		<a class="nav-link" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
	               	</li>
	            <%} %>
			</ul>
		</div>
	</div>
</nav>