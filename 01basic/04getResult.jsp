<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String school= request.getParameter("school");
	// 받은 요청에서 입력 받은 school이라는 파라미터의 값을 가져와 String school 변수에 담음.
	int age=Integer.parseInt(request.getParameter("age"));
	String hobby = request.getParameter("hobby");
%>
내 학교: <%=school %> <br>
<%out.print("내 나이: " +age + "<br>"); %>
내 취미: <%=hobby %> <br>

	<%=(이렇게 작성하면 바로 출력된다. %>

</body>
</html>
