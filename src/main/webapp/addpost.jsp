<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@ page import="com.example.fileIO.FileIO" %>
<%@ page import="com.example.bean.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
	BoardDAO boardDAO = new BoardDAO();
	FileIO fileIO = new FileIO();
	BoardVO boardVO = fileIO.upLoadFile(request);
	System.out.println(boardVO);

	int i = boardDAO.insertBoard(boardVO);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>