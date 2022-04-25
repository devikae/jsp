<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.net.nt.ConnectDescription"%>
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

One Conn Many Job 
<br>걸린시간 :100~200
<br> 1개 연결 다중 작업
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	long startTime = System.currentTimeMillis();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp");
		stmt = conn.createStatement();
		for(int i=0; i<1000; i++){
			
		rs = stmt.executeQuery(" SELECT * FROM member ");
		}
		
	}catch (SQLException e){
		e.printStackTrace();
	}finally{
		if(conn !=null) conn.close();
		if(stmt !=null) stmt.close();
		if(rs !=null) rs.close();
	}
	long endTime = System.currentTimeMillis();
	out.print("걸린 시간 : " + (endTime-startTime) );
	
%>

</body>
</html>