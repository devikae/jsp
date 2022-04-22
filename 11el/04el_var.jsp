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
<!-- EL에서는 기본적으로 setAttribute 담긴걸 변수로 사용 가능.
	EL에서도 변수 선언 가능 
 -->
 <%= request.setAttribute("name", "스타벅스") %>
 ${a=5 } <!-- EL은 기본적으로 화면에 출력-->
 ${a }
 <!-- 출력 안하고 변수만 선언하고 싶다면? ";" 세미콜론 
 	EL은 ;앞으로는 출력 안함 하지만 ";으로 끝나면 오류가 난다"	 
 	
 --><br>
 ${a=5;"" } 
 <!-- 이런식으로 사용하면 된다. -->
 
</body>
</html>