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
	// session은 기본적으로 30 or 60분 유지
	// session은 브라우저별로 생김.
	// 지속시간이 아니고 최근 접속시간 가지고 유지
	
	// 접근이 없으면이다.  ****"설정된 시간동안 존재하는게 아님"
	// 네이버 로그인하고 이런저런일 해도 로그인은 되어있지만, 
	// 1시간동안 아무것도안하다가 오면 로그아웃되어있다.) 

	// 세션 > 메모리 지속적 사용함
	
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
	session.setMaxInactiveInterval(15);	// 15초 동안 접근이 없으면 세션 삭제.   보통 1800 / 3600 사용
%>

</body>
</html>