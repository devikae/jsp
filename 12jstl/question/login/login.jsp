<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>

	loginCheck : id기억하기 쿠키 :SAVE_ID, id
	
	<%
		String msg = request.getParameter("msg");
		String id = "";
		String checked = "";
		CookieUtils cookieUtils = new CookieUtils(request);
	%>
<%-- 	${String msg = request.getParameter("msg") "" } --%>

	
	<c:set test="msg" value='<%=request.getParameter("msg") %>'></c:set>
	<c:set var="id" value='<%="" %>'></c:set>
	<c:set var="checked" value='<%="" %>'></c:set>
	<c:set var="CookieUtils cookieUtils" value='<%=new CookieUtils(request) %>'> </c:set>
	
	<c:if test="<%=msg != null %>"> <%=msg %> </c:if>
	
	<c:if test="<%=cookieUtils.exists("SAVE_ID") %>">
	<c:set var="id" value='<%=cookieUtils.getValue("SAVE_ID")%>'> </c:set>
	<c:set var="checked" value='<%="checked='checked'" %>'></c:set>
	</c:if>	
	
	
	<c:if test="${USER_INFO !=null }"></c:if>
	
	<%
	if (msg != null) {
		out.print(msg);
	}
	
	if (cookieUtils.exists("SAVE_ID")) {
		id = cookieUtils.getValue("SAVE_ID");
		checked = "checked='checked'";
	}
	
	UserVO user=(UserVO)session.getAttribute("USER_INFO");
	if (user!=null) {
	%>
	로그인 중
	 <br> id : <%=user.getUserId() %> , 이름 : <%=user.getUserName() %>, 역할 : <%=user.getUserRole() %>
	    <a href="logout.jsp" class="btn btn-success btn-sm">로그아웃</a>
	<%
		} else {
	%>


	<div class="container">
		<form action="loginCheck.jsp" class="loginForm">
			<h2>로그인</h2>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId" class="form-control input-sm" value="<%=id%>"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPass" class="form-control input-sm"></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox" name="rememberMe" value="Y" <%=checked %>>ID 기억하기</label></td>
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
	<%}%>
</body>
</html>