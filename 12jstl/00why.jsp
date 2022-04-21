<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.sun.scenario.effect.impl.sw.sse.SSESepiaTonePeer"%>
<%@page import="com.sun.scenario.effect.impl.sw.sse.SSEBlend_ADDPeer"%>
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
로그인에서
<%
	UserVO user = (UserVO)session.getAttribute("USER_INFO");
	if(user != null){
%>
	무언가 복잡한 html 태그
	<%
	}else{
	%> 복잡한 html 태그
	<%} %>
	
<%-- 	<if test="<%user != null %>"> 무언가 복잡한 태그 </if> --%>
<%-- 	<if test="<%user == null %>"> 복잡한 태그 </if>  이렇게 하면 좋을텐데--%> 
	
	JSTL : JSP Standard Tag Library 
	
	
	
	
</body>
</html>