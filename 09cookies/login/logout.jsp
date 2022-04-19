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
	// 요청에 쿠키가 있다면 생성
	
	System.out.println("Info_log: 제대로 옴 "); //log
	
	
	if (cookies != null) { // 쿠키가 왔다면
		for (Cookie cookie : cookies) {
				System.out.println(cookie.getName()); // 쿠키 목록 출력
				
			if (cookie.getName().equals("AUTH")) { //AUTH라는 이름의 쿠키가 들어 왔다면
				System.out.println("쿠키 삭제 완료 "); // log
				
				cookie.setMaxAge(0); // MaxAge를 0으로 만들어 쿠키 삭제.
				response.addCookie(cookie); // 보냄 

			}
		}
	}
	
	response.sendRedirect("login.jsp");
%>
</body>
</html>
