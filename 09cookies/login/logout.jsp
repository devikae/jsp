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
	Cookie[] cookies = request.getCookies();
	System.out.println("Info_log: 제대로 옴 ");
	if (cookies != null) { // 값이 왔다면
		for (Cookie cookie : cookies) {
				System.out.println(cookie.getName());
			if (cookie.getName().equals("AUTH")) {
				System.out.println("쿠키 삭제 완료 ");
				
				cookie.setMaxAge(0); // MaxAge를 0으로 만든다.
				response.addCookie(cookie); // 보냄 

			}
		}
	}
	System.out.println("ㅇㅁㄴㅇㄴㅁㅇㄴㅁㅁㄴㅇ");
	
	response.sendRedirect("login.jsp");
%>
</body>
</html>
