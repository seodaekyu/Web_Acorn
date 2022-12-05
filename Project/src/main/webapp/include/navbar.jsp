<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String thisPage = (String)request.getParameter("thisPage");
%>
<nav class="navbar navbar-expand-lg bg-light sticky-top">
  <div class="container navbar-expand-lg">
    <a class="navbar-brand <%=thisPage.equals("index") ? "active" : "" %>" href="${pageContext.request.contextPath }/index.jsp">
    	<img src="${pageContext.request.contextPath }/image/library.png" alt="도서관" width="50px" height="50px" />
    	<strong>Library</strong>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
      <ul class="navbar-nav">
      	<li class="nav-item">
          <a class="nav-link <%=thisPage.equals("index") ? "active" : "" %>" href="${pageContext.request.contextPath }/index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%=thisPage.equals("bookList") ? "active" : "" %>" href="${pageContext.request.contextPath }/books/list.jsp">BookList</a>
        </li>
        <%if(id != null && id.equals("manager")){ %>
  	     	<li class="nav-item">

          		<a class="nav-link <%=thisPage.equals("bookPlus") ? "active" : "" %>" href="${pageContext.request.contextPath }/books/insertform.jsp">BookPlus</a>
			 </li>
		<%} %>
        <li class="nav-item">
          <a class="nav-link <%=thisPage.equals("Board") ? "active" : "" %>" href="${pageContext.request.contextPath }/board/list.jsp">Board</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle <%=thisPage.equals("rentList") || thisPage.equals("returnList") ? "active" : "" %>" href="${pageContext.request.contextPath }/my/rentlist.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyLibrary
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item <%=thisPage.equals("rentList") ? "active" : "" %>" href="${pageContext.request.contextPath }/my/rentlist.jsp">대출목록</a></li>
            <li><a class="dropdown-item <%=thisPage.equals("returnList") ? "active" : "" %>" href="${pageContext.request.contextPath }/my/returnlist.jsp">반납목록</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav">
      	<%if(id == null){ %>
           <li class="nav-item">
              <a class="nav-link <%=thisPage.equals("signupForm") ? "active" : "" %>" href="${pageContext.request.contextPath }/users/signup_form.jsp" >회원가입</a>
           </li>
           <li class="nav-item">
              <a class="nav-link <%=thisPage.equals("loginForm") ? "active" : "" %>" href="${pageContext.request.contextPath }/users/loginform.jsp" >로그인</a>
           </li>
        <%}else{%>
        	 <span class="navbar-text">
		        <%=id %>님 로그인 중...
		      </span>
           	<li class="nav-item">
           		<a class="nav-link" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
           	</li>
        <%} %>
      </ul>
    </div>
  </div>
</nav>