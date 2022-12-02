<%@page import="test.boardcommnet.dto.BoardCommentDto"%>
<%@page import="test.boardcomment.dao.BoardCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 댓글 DB에 추가할 정보 얻어오기
	String id = (String)session.getAttribute("id");
	String comment1 = (String)request.getParameter("comment1");
	int boardNum = Integer.parseInt(request.getParameter("num"));
	
	// BoardCommentDto에 정보 저장
	BoardCommentDto dto = new BoardCommentDto();
	dto.setWriter(id);
	dto.setComment1(comment1);
	dto.setBoardNum(boardNum);
	
	// DB에 추가
	BoardCommentDao.getInstance().insert(dto);
	
	// 게시물로 바로 이동
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/board/detail.jsp?num="+boardNum);
%>