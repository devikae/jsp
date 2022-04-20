<%@page import="com.study.login.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("UTF-8") ;%>
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<!-- 세션에 데이터가 담겼다면 로그인 한거  -->
<!-- 아니라면 로그인하지 않은거  -->
<!-- get/set 실질적으로 많이 사용됨 -->

<%
	session.setAttribute("레식", "마렵다");
	UserVO user = new UserVO("malja", "말자", "1004", "MEMBER");
	session.setAttribute("user", user);
%>
</body>
</html>