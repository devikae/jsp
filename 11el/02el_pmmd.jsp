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
02el_pmmd + - x / <br><br>
<%
	// EL도 언어이며, 기본적으로 화면에 출력한다.
	
%>
${user } 처럼 setAttribute가 안되어있는 이름을 쓰면 아무것도 출력 안함. 
<!-- setAttribute를 한 적이없어 null user는 null임  -->
<hr>
${3+5 } 3+5 <br>
<!-- 언어 = 연산가능 -->
${"나는 졸리다" }     "나는 졸리다"
<!-- $ 나는 졸리다 만 출력 // 옆의 나는 졸리다는 "나는 졸리다" 큰 따옴표 까지 출력됨  -->
<br>
${3+ "3" } : EL은 기본적으로 산술연산만 지원한다. <br>
				"3"을 숫자 long로 형 변환 > 3+3 = 6을 출력 <br>
<%-- ${3+"아" }	: "아"를 숫자로 바꾸지 못해 에러가 난다.			 --%>
					
	



</body>
</html>