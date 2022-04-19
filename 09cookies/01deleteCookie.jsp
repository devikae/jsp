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
<!-- 쿠키 삭제 방법은 따로 없다.  -->
<!-- 지속 시간을 0으로 만들어주면 된다. -->
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null){ // 값이 왔다면
		for(Cookie cookie : cookies){ 
			if(cookie.getName().equals("key")){
				cookie.setMaxAge(0); // MaxAge를 0으로 만든다.
				response.addCookie(cookie); // 보냄 
			}
		}
	}
%>

</body>
</html>