<%@page import="test.boardcomment.dao.BoardCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 댓글 번호 받아오기
	int commentNum = Integer.parseInt(request.getParameter("num"));
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	
	// DB에서 삭제
	BoardCommentDao.getInstance().cnum_delete(commentNum);
	
	// 게시물로 바로 이동
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/board/detail.jsp?num="+boardNum);
%>