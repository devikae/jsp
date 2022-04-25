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

Many Conn Many Job 
<br> 걸린시간: 2000~3000
<br> 1개 연결 1개 작업
<pre>
연결 : C 작업: E
C+E = 16~20
C+ 1000E = 100~200
1000C + 1000E = 2000~3000

>> 연결할때 시간이 오래 걸린다.
</pre>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	long startTime = System.currentTimeMillis();
	for(int i =0; i<1000; i++){
		
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp");
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
	
	// conn 객체는 생성될 때 마다 네트워크를 통해서 DB에 한번 갔다 온다. 
	//  새로고침 하거나 다른 페이지로 이동할 때 마다 conn객체가 생성된다 > 위의 과정을 거친다
	// conn객체 자체는 자바 프로그램 메모리에 있는 객체이다. 
	// 한번 생성 할 때 네트워크를 통하는건 한번만 하고 연결 정보를 가지고 있는 conn 객체를 
	// 계속 사용하면? >> 속도가 빨라짐.
	// ===> DBCP 
	
%>

</body>
</html>