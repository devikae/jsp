<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("UTF-8"); %>
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%
	//request.setAttribute("list", 어떤 list) 후 EL로 list 사용
%>
list : ${ {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 13}} <br>
map : ${ {"lion" : "사자",  "apeach" : "어피치",   "tiger": "호랑이"} }<br>
set : ${ {1, 3, 5, 7, 9} }


</body>
</html>