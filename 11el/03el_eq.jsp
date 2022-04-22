<%@page import="java.util.ArrayList"%>
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
${ 3>5 } .......... ${ 3<5 }.......... ${ 3==3 }<br>
<!-- false, true,true 출력 -->
${ 3 gt 5 } .......... ${ 3 lt 5 }...........${3 eq 3 }<br>
<!-- ...........${3 ne 3}<br>  쓸 수 있으나 오류나서 주석처리-->
<!-- ne = not equal / eq는 많이 씀-->
${!true } : ${not true } <br>
<hr>
<hr>
<!--	empty : null, null이 아니지만 비어있는 컬렉션 => true
 -->

<%
	request.setAttribute("name", null);
	List<String> strList = new ArrayList<String>();
	strList.add("aa");
	
	List<String> strEmptyList = new ArrayList<String>();
	request.setAttribute("strL",	strList);
	request.setAttribute("strEmpty", strEmptyList);
%>
${ empty name }......${ empty strL }......${empty strEmpty }
${ not empty name }......${ not empty strL }......${ not empty strEmpty }
<!-- name == null 이기 때문에 true 
	비어있는 컬렉션이나 배열 == null
-->





</body>
</html>