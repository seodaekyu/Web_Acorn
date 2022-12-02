<%@page import="test.boardcomment.dao.BoardCommentDao"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 게시글 번호 얻기
	int num = Integer.parseInt(request.getParameter("num")); 
	boolean isSuccess = BoardDao.getInstance().delete(num);
	BoardCommentDao.getInstance().bnum_delete(num);
	if(isSuccess){
		 String cPath = request.getContextPath();
		 response.sendRedirect(cPath+"/board/list.jsp");
	}
%>
