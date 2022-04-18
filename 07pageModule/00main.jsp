<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 00main -->
<!-- h1 태그가 반복되는 내용이고 h1사이에 있는 내용이 바뀌어야 할때 사용 -->
<!-- .jsp 파일은 java파일로 바뀔 수 있음. -->


<h1> include 전 내용</h1>
<% int a=5; %>
<jsp:include page="00sub.jsp"></jsp:include> 

<h1>include 후 내용</h1>

</body>
</html>