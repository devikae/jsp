<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>Insert title here</title>
</head>

<body>
<%@include file="/WEB-INF/inc/top.jsp" %> 
<%
	//session.invalidate(); //초기화 또는 특정 session 없애기 , remove도 가능 
	session.removeAttribute("USER_INFO");
	response.sendRedirect("login.jsp");
%>

</body>
</html>