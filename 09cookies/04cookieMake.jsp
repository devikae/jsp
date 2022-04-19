<%@page import="com.study.common.util.CookieUtils"%>
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
// 	Cookie cookie = new Cookie("han", "changhee");
// 	cookie.setMaxAge(60*30);
// 	response.addCookie(cookie);

	// 유틸클래스를 만들어 위 내용을 아래처럼 할 수 있음	
	Cookie cookie = CookieUtils.createCookie("han", "changhee", 60*30);
	response.addCookie(cookie);


%>
</body>
</html>