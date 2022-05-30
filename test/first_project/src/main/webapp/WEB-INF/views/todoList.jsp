<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">NO</th>
      <th scope="col">CONTENT</th>
      <th scope="col">AUTHOR</th>
      <th scope="col">REGDATE</th>
    </tr>
  </thead>
  <tbody>
<!--       <th scope="row">Danger</th> -->
      <c:forEach items="${todoList }" var="todoList">
			   <tr class="table-danger">
					<td>${todoList.tdNo }</td>
					<td><a href="todoView.wow?tdNo=${todoList.tdNo }"> ${todoList.tdContent } </a> </td>
					<td>${todoList.tdNm }</td>
					<td>${todoList.tdRegDate }</td>
				</tr>
			</c:forEach>
  </tbody>
</table>


	
	
</body>

</html>