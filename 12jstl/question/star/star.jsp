<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<% // star 1 %>
	<c:forEach begin="1" end="5" var="i">

		<c:forEach begin="1" end="${i }" var="j">

			<a>*</a>
		</c:forEach>
		<br>
	</c:forEach>
	
	<br><hr>

	
	<% // star2  %>
	<c:forEach begin="1" end="5" var="i">

		<c:forEach begin="1" end="${i }" var="j"> 

			<a>&nbsp&nbsp</a> <% // 2개씩 증가 5번 
									  //  1 2 3 4 5 %>
			
		</c:forEach>
		
		<c:forEach begin="1" end="${6-i }" var="k">

			<a>*</a> <% //5 4 3 2 1 %>
			
		</c:forEach>
		
		<br>
		
	</c:forEach>
	
	<br><hr>

	
	<% // star 3 %>
	<c:forEach begin="1" end="5" var="i">

		<c:forEach begin="1" end="${6-i }" var="j">

			<a>&nbsp&nbsp</a>		<%// 2개씩 감소 5번 
											//  5 4 3 2 1    %>

		</c:forEach>

		<c:forEach begin="1" end="${2*i-1}" var="k">

			<a>*</a>       <% //1 3 5 7 9 
								   //2회씩 더 찍어야함 	%>

		</c:forEach>

		<br>

	</c:forEach>

	<br>
	<hr>


</body>
</html>