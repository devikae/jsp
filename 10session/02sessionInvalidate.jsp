<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	Date createDate = new Date(); // 만들었을 때 시간 
	Date lastAccessDate = new Date();	// 마지막 접근 시간 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜형식 지정 
	long createTime = session.getCreationTime(); // 브라우저별로 처음 요청 받을 때 생성
	long lastAccessTime = session.getLastAccessedTime(); // 마지막 요청시 (마지막 접근) 시간
	
	// 각 시간에 맞게 set	
	createDate.setTime(createTime); 
	lastAccessDate.setTime(lastAccessTime);
	
%>
<!-- 출력 -->
<%= request.getHeader("User-Agent") %>  생성시간 : <%=sdf.format(createDate) %>   			(처음 생성 시간) <br>
<%= request.getHeader("User-Agent") %>  생성시간 : <%=sdf.format(lastAccessDate) %> 			(마지막 접근 시간) <br>
<br>
세션ID : <%= session.getId() %>
<br>

<%
	session.invalidate(); // 세션삭제
	//새로고침 할 때 마다 세션이 삭제되고 새 세션이 생겨 세션ID  바뀜.
	
%>

</body>
</html>
