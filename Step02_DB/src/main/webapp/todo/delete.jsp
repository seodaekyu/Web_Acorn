<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 삭제할 번호 
	int num = Integer.parseInt(request.getParameter("num"));
	// 삭제하기
	TodoDao.getInstance().delete(num);
	// 리다일렉트 응답하기(특정 경로로 요청을 다시 하라고 강요하는 응답)
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/todo/list.jsp");
%>
