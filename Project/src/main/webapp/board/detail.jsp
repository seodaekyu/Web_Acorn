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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
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
					<form action="${pageContext.request.contextPath }/comment/insert.jsp" method="post">
					<input type="hidden" name="num" value="<%=num%>"/>
					<div>
						<label for="comment1"><%=id %></label>
						<input type="text" id="comment1" name="comment1" value="댓글을 입력하세요..." />
					</div>
					<button type="submit">등록</button>
				</form>
				<%} %>
				<!-- 댓글 보이게 하기 -->
				<%for(BoardCommentDto tmp:list){ %>
					<%if(dto.getNum() == tmp.getBoardNum()){ %>
						<div>
							<p><%=tmp.getWriter() %></p>
							<p><%=tmp.getComment1() %></p>
							<p><%=tmp.getRegdate() %></p>
							<%if(tmp.getWriter().equals(id)){ %>
								<button class="btn btn-sm btn-dark" onclick="location.href='comment/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
								<%String s = tmp.getComment1();%>
								<button class="btn btn-sm btn-danger" onclick="commentdel">삭제</button>
							<%} %>
						</div>
					<%} %>
				<%} %>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		let app = new Vue({
			el:"#app",
			data:{
				
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
				}
			}
		});		
		
	</script>
</body>
</html>