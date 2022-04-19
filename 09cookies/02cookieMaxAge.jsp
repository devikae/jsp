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
	Cookie cookie = new Cookie("name", "창희");
	
	cookie.setMaxAge(15); // 15초 뒤에 쿠키삭제 
	// 브라우저를 껏다 켜도 15초 안에 켜면 쿠키 남아있음 
	// 따로 setMaxAge를 설정 안하면 -1 (default)
	// -1 >> 브라우저가 꺼지면 쿠키를 삭제 

	response.addCookie(cookie);
	// 02cookieMaxAge -> viewCookie 새로고침

%>

</body>
</html>