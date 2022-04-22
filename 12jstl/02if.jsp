<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	int score = Integer.parseInt(request.getParameter("score"));
%>
name : <%= name%>, 나이 : <%=age %><br>
	<c:if test="<%=score >90 %>"><h1>수</h1></c:if>
	<c:if test="<%=score <=90 & score> 80 %>    "><h1>우</h1></c:if>
	<c:if test="<%=score <=80 & score> 70 %>"><h1>미</h1></c:if>
	<c:if test="<%=score <=70 & score> 60 %>"><h1>양</h1></c:if>
	<c:if test="<%=score <=60 %>"><h1>가</h1></c:if>
	<% // c:if는 else가 없기 때문에 else에 해당하는 조건식 작성 해야함 
		// test의 조건이 true 일 때 조건식이 "true"로 변함 
		// "<%=score >90 " 따옴표 부분 만큼 true가 된다 따옴표 뒤로 공백이 있다면 
		//  오류 발생
	%>
	<c:if test="true">test가 "true"일 때 실행됩니다 </c:if>
	
	<c:choose>
		<c:when test="">스위치</c:when>
		<c:when test="">스위치</c:when>
		<c:when test="">스위치</c:when>
		<c:otherwise>디폴트</c:otherwise>
		
	</c:choose>
<%
	switch(3){
		case 3 : // 실행문 작성
		case 4 :
		default :
	}
%>
	
	
</body>
</html>