<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.ProductList"%>
<%@page import="com.study.common.util.ProdVO"%>
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
	// EL >> 스크립트 언어 

	ProdVO prod = ProductList.getProduct("CPU001");
	request.setAttribute("prod", prod);
	UserVO user = new UserVO("malja", "말자", "1004", "ADMIN");
	
%>

request에 담긴 prodId : <%=((ProdVO)request.getAttribute("prod")).getProdId() %><br>
request에 담긴 prodId : ${prod.prodId} <br>

session에 담긴 user: ${user }
<hr>
<!-- session.setAttribute("name1", "value1"); session.setAttribute("user", user);
		${name1} 을 쓰면 "value1"이 화면에 출력
		${user} 을 쓰면  user가 화면에 출력
		$안에 user(객체)에는 필드가 4개 있음 EL에서는 필드 이름을 그대로 써도 됨 
		user필드의 userId를 쓰고 시다면?? >>  ${user.userId} 처럼 필드 이름 그대로 
										 or   ${user["userId"]} jquery처럼 사용도 가능 (조건을 필요한 경우 많이 사용)   
 -->

<%
	// EL은 기본적으로 출력을 해준다. 
	// application, pageContext, session, request에 담긴 속성을 EL로 사용 가능.
	// 아무거나 사용하는게 아니고 setAttribute 한 것만 사용
	// ! : 약한 주석 / <%--  : 강한주석 

%>


</body>
</html>