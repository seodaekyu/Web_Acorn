<%@page import="test.boardcomment.dao.BoardCommentDao"%>
<%@page import="test.boardcommnet.dto.BoardCommentDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디가 있으면 읽어온다.(null일 수도 있다.)
	String id = (String)session.getAttribute("id");	

	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto dto = BoardDao.getInstance().getData(num);
	
	// 조회수 업데이트
	BoardDao.getInstance().addViewCount(num);
	
	// 댓글 정보 가져오기
	List<BoardCommentDto> list = BoardCommentDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
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
		<jsp:param value="Board" name="thisPage"/>
	</jsp:include>
	<div class="container" id="app">
		<div class="border m-5 p-5">
			<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
			<%if(dto.getWriter().equals(id)){ %>
				<div class="text-end mb-3">
					<button class="btn btn-sm btn-dark" onclick="location.href='private/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
					<button class="btn btn-sm btn-danger" v-on:click="deleteConfirm">삭제</button>
				</div>
			<%} %>
			<h3 ><strong><%=dto.getTitle() %></strong></h3>
			<table class="mt-3">
				<tr>
					<th class="pe-3">글번호</th>
					<td><%=dto.getNum() %></td>
				</tr>
				<tr>
					<th class="pe-3">작성자</th>
					<td><%=dto.getWriter() %></td>
				</tr>
			
				<tr>
					<th class="pe-3">조회수</th>
					<td><%=dto.getViewCount() %></td>
				</tr>
				<tr>
					<th class="pe-3">작성일</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</table>
			<hr>
			<p><%=dto.getContent() %></p>
			
			<hr class="mt-5">
			<div>
				<h5><strong>댓글</strong></h5>
				<!-- 로그인이 되어 있으면 댓글 추가 창 보이게 하기-->
				<%if(id != null){ %>
				<div class="card">
				  <div class="card-header">
				     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
					  	<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
					 </svg> 
					 REPLY
				  </div>
				  <div class="card-body">
				   	<form action="${pageContext.request.contextPath }/comment/insert.jsp" method="post">
						<input type="hidden" name="num" value="<%=num%>"/>
						<div>
							<p>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>
								<%=id %>
							</p>
							<textarea class="form-control" id="comment1" name="comment1" row="3">댓글을 입력하세요...</textarea>
						</div>
						<button type="submit" class="btn btn-dark mt-3">등록</button>
					</form>
				  </div>
				</div>
				
				<%} %>
				<!-- 댓글 보이게 하기 -->
				<%for(BoardCommentDto tmp:list){ %>
					<%if(dto.getNum() == tmp.getBoardNum()){ %>
					
						<div class="card mt-3">
						  <div class="card-header">
						     <p>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>
								<%=tmp.getWriter() %>
								<%=tmp.getRegdate() %>
							</p>
						  </div>
						  <div class="card-body">
						   	<form v-if=!commentShow action="${pageContext.request.contextPath }/comment/update.jsp" method="post">
								<div>
									<input type="hidden" name="num" value="<%=tmp.getCommentNum() %>" />
									<input type="hidden" name="boardNum" value="<%=dto.getNum() %>" />
									<textarea class="form-control" id="comment1" name="comment1" row="3"><%=tmp.getComment1() %></textarea>									
								</div>
								<button type="submit" class="btn btn-sm btn-dark">수정</button>
							</form>
							<%if(tmp.getWriter().equals(id)){ %>
								<button v-if=commentShow class="btn btn-sm btn-dark" v-on:click="update">수정</button>
								<button v-if=commentShow class="btn btn-sm btn-danger" v-on:click="commentdel(<%=tmp.getCommentNum()%>)">삭제</button>
							<%} %>
						  </div>
						</div>
					<%} %>
				<%} %>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		let app = new Vue({
			el:"#app",
			data:{
				commentShow : true
			},
			methods:{
				commentdel(num){
					const isDelete = confirm("이 댓글을 삭제하겠습니까?");
					if(isDelete){
						location.href="${pageContext.request.contextPath }/comment/delete.jsp?num="+num+"&boardNum=<%=dto.getNum()%>";
					}
				},
				deleteConfirm(){
					const isDelete = confirm("이 글을 삭제하겠습니까?");
					if(isDelete){
						location.href="private/delete.jsp?num=<%=dto.getNum()%>";
					}
				},
				update(){
					this.commentShow=false;
				}
			}
		});		
		
	</script>
</body>
</html>