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
<%= session.getAttribute("레식")%> <br>
유저: <%= session.getAttribute("user") %> <br>
<%= session.getValue("레식") %>
<%= session.getAttribute("레식") %>


</body>
</html>