<%@page import="com.study.login.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% // jstl을 사용하려면 위에 태그 추가 해줘야한다. %>
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

<c:set var="abc" value='<%= new UserVO("malja", "말자", "1004", "ADMIN") %>' ></c:set>
${abc }


</body>
</html>