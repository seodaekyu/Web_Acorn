<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인된 아이디를 읽어온다(로그인을 하지 않았으면 null 이다.)
	String id = (String)session.getAttribute("id");

	// 한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	// 하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT = 5;

	// 보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum = 1;
	
	// 페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum = request.getParameter("pageNum");
	// 만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum = Integer.parseInt(strPageNum);
	}
	
	// 보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	// 보여줄 페이지의 끝 ROWNUM
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	// 하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	// 하단 끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT-1;
	// 전체 글의 갯수
	int totalRow = FileDao.getInstance().getCount();
	// 전체 페이지의 갯수 구하기
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되어있다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; // 보장해준다.
	}
	
	// FileDto 객체를 생성해서
	FileDto dto = new FileDto();
	// 위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	// 파일 목록을 select 해 온다.
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	// 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- navbar 포함 --%>
	
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="fileList" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<h3 class="mt-3">자료실 목록 보기</h3>
			</div>
			<div class="col text-end">
				<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-file-earmark-plus mt-3 me-3" viewBox="0 0 16 16">
					  <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
					  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
					</svg>
				</a>
			</div>
		</div>
		<table class = "table table-striped mt-3">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a>
						</td>
						<td><%=tmp.getFileSize() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td>
							<%-- 글 작성자가 로그인된 아이디와 같을 때만 삭제 링크를 제공한다. --%>
							<% if(tmp.getWriter().equals(id)){ %>
								<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a>
							<%} %>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center mt-5">
				<%--
					startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다.
				 --%>
				 <%if(startPageNum != 1){ %>
				 	<li class="page-item">
				 		<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>"> Prev </a>
				 	</li>
				 <%} %>
				 
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %> </a>
					</li>				
				<%} %>
				
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다.
				 --%>
				 <% if(endPageNum < totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete = confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>