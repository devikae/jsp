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

DBCP를 이용한 many Conn many Job
<pre>
연결 : C 작업: E
C+E = 16~20
C+ 1000E = 100~200
1000C + 1000E = 2000~3000

>> 연결할때 시간이 오래 걸린다. > DBCP 이용 후 

1000C + 1000E = 1000이하
</pre>

<%
// 	Class.forName("oracle.jdbc.driver.OracleDriver"); DBCP이용해서 필요 없음
	long startTime = System.currentTimeMillis();
	
	
	
	for(int i =0; i<1000; i++){
		
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		
// 		conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp"); 원래 연결하던 방식 
		conn= DriverManager.getConnection("jdbcLapache:commons:dbcp:study"); 
		// DBCP를 이용한 연결 방식 
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(" SELECT * FROM member ");
		
	}catch (SQLException e){
		e.printStackTrace();
	}finally{
		if(conn !=null) conn.close();
		if(stmt !=null) stmt.close();
		if(rs !=null) rs.close();
	}
	}
	long endTime = System.currentTimeMillis();
	out.print("걸린 시간 : " + (endTime-startTime) );
	
	
%>

</body>
</html>