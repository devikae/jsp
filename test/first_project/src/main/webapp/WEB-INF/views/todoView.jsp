<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>


<table border="1" style="margin: 0 auto;">
	<tr><td>글번호</td>   <td>${todo.tdNo }</td></tr>
	<tr><td>제목</td>    <td>${todo.tdContent }</td></tr>
	<tr><td>마감일</td>    <td>${todo.tdDeadline }</td></tr>
	<tr><td>작성자</td>   <td>${todo.tdNm }</td></tr>
	<tr><td>비밀번호</td> <td>${todo.tdPass }</td></tr>
<%-- 	<tr><td>내용</td>    <td><textarea readonly="readonly" rows="5">${todoList.tdContent }</textarea></td></tr> --%>
	<tr><td>등록일</td>   <td>${todo.tdRegDate }</td></tr>
	<tr><td>삭제여부</td> <td>${todo.tdDelYn }</td></tr>
	<tr> <td> <a href="todoEdit.wow?tdNo=${todo.tdNo }">수정</a></td></tr>
	<tr> <td> <a href="todoDelete.wow?tdNo=${todo.tdNo }">삭제 </a></td></tr>
	
	
	
</table>




</body>
</html>