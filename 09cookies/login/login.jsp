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

	<%
		for (Cookie cookies : ck) {
			System.out.println(cookies.getName());
		}

		CookieUtils co = new CookieUtils(request);
		System.out.println("쿠키 없음: " + (co.exists("AUTH")== false));
		System.out.println("쿠키 보유: "+ (co.exists("AUTH")== true));

		if (co.exists("AUTH") == false) { // null이면 쿠키X >> 다시 로그인 창
	%>

	<div class="container">
		<form action="loginCheck.jsp" class="loginForm">
			<h2>로그인</h2>
			<table class="table table-bordered">
				<tbody>
				<%
					if(co.exists("SAVE_ID")){%>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"
							class="form-control input-sm" value="<%=co.getValue("SAVE_ID")%>"></td>
					</tr>
					<% }else{%>
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
	
	if(co.exists("AUTH") == true){ // null이 아니면 id pw 매치 >> 로그아웃 창 
	%>	
		로그인 중
	<a href="logout.jsp" class="btn btn-success btn-sm">로그아웃</a>
<%	}
	%>
	
</body>
</html>