<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 수정할 할일의 번호와 내용을 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	
	//TodoDto에 담고 
	TodoDto dto = new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	
	// 수정 반영
	boolean isSuccess = TodoDao.getInstance().update(dto);

	// 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=dto.getNum() %> 번을 수정했습니다.");
	   		location.href="${pageContext.request.contextPath }/todo/list.jsp";
	   		</script>
	<%}else{%>
		<script>
			alert("수정을 실패했습니다.");
	   		location.href="${pageContext.request.contextPath }/todo/updateform.jsp";
	   	</script>
	<%}%>
	}
	
</body>
</html>