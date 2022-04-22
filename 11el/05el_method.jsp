<%@page import="com.study.login.vo.UserVO"%>
<%@page import="sun.usagetracker.UsageTrackerClient"%>
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
<%
	UserVO user = new UserVO("mal", "자", "1004", "admin");
	request.setAttribute("user", user);
	// EL은 기본적으로 화면에 출력 해주는 용도.
%>
userId: ${user.userId }, userName: ${user.userName }, userPass: ${user.userPass }<br>
<% // 메소드도 그대로 사용 가능 %>
userId: ${user.getUserId() }, ${user.setUserId("sunja") }
변경 후 userId: ${user.getUserId() },,,,,, ${user.userId }


</body>
</html>