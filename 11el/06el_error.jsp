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
<%
	UserVO user = new UserVO("mal", "자", "1004", "admin");
	request.setAttribute("user", user);
%>
${usar } <% // "에러 XX" 속성에 담기지 않은걸로 알고 화면에 출력되지 않음.  %>
${user.id } <% // 이렇게 썻을 때 "--.PropertyNotFoundException 에러 발생--" user는 null이 아닌데 필드를 이상한거 씀. (필드 이름이 틀림) << 아주 중요   %>


</body>
</html>