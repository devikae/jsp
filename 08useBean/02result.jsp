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
	String id= request.getParameter("userId");
	// 원래 이렇게 사용했지만 이젠 아래와 같이 사용 
%>

<jsp:useBean id="user" class="com.study.login.vo.UserVO"></jsp:useBean>

<%

// 	UserVO user=( userVO)request.getAttribute("user"); 
// 	if(user==null){ 
// 		user = new UserVO(); 
// 		request.setAttribute("user", user); 
// 	} useBean과 위 코드와 같음 

	// 사용자가 입력한 모든 값들을 DB에 넣기 위해 
	
// 	user.setUserId(request.getParameter("userId"));
// 	user.setUserId(request.getParameter("userId"));
// 	user.setUserId(request.getParameter("userId"));
// 	user.setUserId(request.getParameter("userId"));
// 	insert(user);
	// 이렇게 넣기는 불편하니 아래와 같이 한번에 DB에 넣기 위해 사 
%>
<%-- <jsp:setProperty property="*" name="user"/> 위의 set4줄을 한번에--%>
<%-- <%insert(user); %> --%>
<!-- useBean태그를 쓰는 이유 > 파라미터로 온 VO에 자동으로 한번에 세팅 -->
<!-- VO는 자바빈규약을 잘 지켜야하고 파라미터 이름과 필드이름이 같아야한다. ****** -->


<h1>setting 전</h1>
 id		:	<jsp:getProperty property="userId" name="user"/> <br> <!--name은 useBean id값  -->
name	:	<jsp:getProperty property="userName" name="user"/> <br>
pass	:	<jsp:getProperty property="userPass" name="user"/> <br>
role	:	<jsp:getProperty property="userRole" name="user"/>	<br>
<hr>
<h1>setting 후</h1>
<%-- <jsp:setProperty property="userId" name="user"/>  --%>
<%-- <jsp:setProperty property="userName" name="user"/>  --%>
<%-- <jsp:setProperty property="userPass" name="user"/>  --%>
<%-- <jsp:setProperty property="userRole" name="user"/>	 --%>
<!-- 필드 이름과 property 이름(파라미터) 같으면 된다 -->

<jsp:setProperty property="*" name="user"/>
<hr>

 id		:	<jsp:getProperty property="userId" name="user"/> <br> 
name	:	<jsp:getProperty property="userName" name="user"/> <br>
pass	:	<jsp:getProperty property="userPass" name="user"/> <br>
role	:	<jsp:getProperty property="userRole" name="user"/>	<br>
<!-- getProperty는 화면에 보여주려고 사용하는건 아님 (여기선 화면에 보여주지만) -->

</body>
</html>