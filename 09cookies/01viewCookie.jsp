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
	Cookie[] cookies = request.getCookies();
//	저장 되어있는 쿠키를 불러옴
	if(cookies != null){
		for(Cookie cookie : cookies){
			out.print("쿠키 이름: " + cookie.getName()+",");
			out.print("쿠키의 값:" + cookie.getValue()+"<br>") ;
		}
	}
%>

</body>
</html>