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
01useBean.jsp<br>
<%-- <jsp:useBean id="" class="java클래스"></jsp:useBean> --%>
<!-- useBean태그 class 에는 자바 클래스 들어감  -->
<pre>
	자바 빈 규약
	1. 패키지에 있어야 한다.(디폴트 패키지에 X)
	2. 기본 생성자가 꼭 있어야 한다.
	3. 필드는 private 
	4. get/set 
	5. 직렬화(선택) 필수는x
	
	>> MemberVO
</pre>

<%
	UserVO user = new UserVO();
	UserVO user2 = new UserVO("a001","한창희","1004","MEMBER");
	System.out.println(user.toString());
	System.out.println(user2.toString());
	// syso
%>

</body>
</html>