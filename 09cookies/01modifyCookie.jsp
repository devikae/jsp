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
	
<!-- Cookie 수정 -->
<!--  같은 이름의 쿠키를 만들어서 보내면 된다. -->
<!--  브라우저는 response로 부터 받은 쿠키가 쿠키 저장소에 있으면 기존에 있는 쿠키 삭제 후 -->
<!--  새로 받은 쿠키 저장 -->

<%
	Cookie cookie = new Cookie("key","value2");
	response.addCookie(cookie);
	// 
%>

</body>
</html>