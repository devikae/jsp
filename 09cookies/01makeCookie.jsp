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
	Cookie cookie = new Cookie("key","value");
// coockie 기본생성자x  만든 쿠키를 브라우저 한테 줘야함 response로 
// "브라우저가 보관하는" 데이터 (1주일동안, 하루동안 광고 보지않기 이런곳에 쓰임)
// Cookie : name, value 필수조건
//  maxAge, path, domain << 선택속성

	response.addCookie(cookie);

%>


</body>
</html>
