<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	
	<%Cookie[] ck = request.getCookies();%>
	//request로 쿠키를 받아서 배열에 넣음.

	<%
		for (Cookie cookies : ck) {
			System.out.println(cookies.getName());
		} 
		// 제대로 쿠키를 받았는지 향상된 for문을 이용해 확인

		CookieUtils co = new CookieUtils(request);
		// 쿠키 메소드를 사용하기 위한 객체 선언
		
		System.out.println("쿠키 없음: " + (co.exists("AUTH")== false));
		System.out.println("쿠키 보유: "+ (co.exists("AUTH")== true));
		// request로 받았을때 쿠키가 제대로 있는지 확인하는 로그

		if (co.exists("AUTH") == false) { // (AUTH라는 이름의 쿠키를 받은게 거짓이 맞다면) AUTH값의 쿠키를 받지 못했다면? 기존 로그인 페이지 출력
	%>

	<div class="container">
		<form action="loginCheck.jsp" class="loginForm">
			<h2>로그인</h2>
			<table class="table table-bordered">
				<tbody>
				<%	// 아이디 기억하기를 체크 했으며, 만약에 들어온 쿠키의 이름이 SAVE_ID 라면?
					if(co.exists("SAVE_ID")){%>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"
							class="form-control input-sm" value="<%=co.getValue("SAVE_ID")%>"></td> //SAVE ID가 입력되어 있도록.
					</tr>
					<% }else{%> //그 외의 경우 기존 로그인 방식과 같음
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"
							class="form-control input-sm" value=""></td>
					</tr>
					<%} %>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPass"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox"
								name="rememberMe" value="Y" >ID 기억하기</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-sm pull-right">로그인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- container -->
	<% }
	
	if(co.exists("AUTH") == true){ // AUTH가 제대로 들어왔다면 로그인 화면 
	%>	
		로그인 중
	<a href="logout.jsp" class="btn btn-success btn-sm">로그아웃</a>
<%	}
	%>
	
</body>
</html>
