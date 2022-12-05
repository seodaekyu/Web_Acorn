<%@page import="test.boardcomment.dao.BoardCommentDao"%>
<%@page import="test.boardcommnet.dto.BoardCommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 수정할 댓글 가져오기
	int commentNum = Integer.parseInt(request.getParameter("num"));
	String comment= request.getParameter("comment1");
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	
	// BoardCommentDto에 수정할 댓글 추가하기
	BoardCommentDto dto = new BoardCommentDto();
	dto.setCommentNum(commentNum);
	dto.setComment1(comment);
	
	// DB에서 수정하기
	BoardCommentDao.getInstance().update(dto);
	
	// 게시물로 바로 이동
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/board/detail.jsp?num="+boardNum);
%>
