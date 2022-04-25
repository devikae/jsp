<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<% 
try{
	// 1번 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");  
}catch(ClassNotFoundException e){
	System.out.print("OracleDriber를 찾을 수 없음");
}

Connection conn = null;	
Statement stmt = null;		
ResultSet rs= null;			

try{
	conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp"); // ("a", "b", "c")
	
	stmt= conn.createStatement(); 
	
	StringBuffer sb = new StringBuffer();
	sb.append(" 	 SELECT                                      					");
	sb.append(" 	bo_no                                                      	");
	sb.append(" 	, bo_title , bo_category , bo_writer         	  			  	");
	sb.append(" 	, bo_pass , bo_content , bo_ip                         		");
	sb.append(" 	, bo_hit , bo_reg_date , bo_mod_date         	         		");
	sb.append(" 	, bo_del_yn                                            		");
	sb.append(" 	 FROM free_board                                     			");
	
	rs= stmt.executeQuery(sb.toString());
	
	List<FreeBoardVO> freeList = new ArrayList<FreeBoardVO>(); 
	
	while(rs.next()){
		FreeBoardVO free = new FreeBoardVO();
		free.setBoNo( rs.getInt("bo_no") );
		free.setBoTitle( rs.getString("bo_title") );
		free.setBoCategory( rs.getString("bo_category") );
		free.setBoWriter( rs.getString("bo_writer") );
		free.setBoPass( rs.getString("bo_pass") );
		free.setBoContent( rs.getString("bo_content") );
		free.setBoIp( rs.getString("bo_ip") );
		free.setBoHit( rs.getInt("bo_hit") );
		free.setBoRegDate( rs.getString("bo_reg_date") );
		free.setBoModDate( rs.getString("bo_mod_date") );
		free.setBoDelYn( rs.getString("bo_del_yn") );
		
		freeList.add(free);

		
	}
	
	request.setAttribute("freeList", freeList);	
}catch(SQLException e){
	e.printStackTrace();
}finally{
	
	if(rs!=null)   {try {rs.close();} catch(Exception e){}}
	if(stmt!=null) {try {stmt.close();} catch(Exception e){}}
	if(conn!=null) {try {conn.close();} catch(Exception e){}}
	
}
%>

<table class="table table.striped table-bordered">
	<c:forEach items="${freeList }" var="free">
		<tr>
			<td> ${free.boNo }</td>
			<td> <a href="02freeView.jsp?boNo=${free.boNo }">${free.boTitle }  </a></td>
			<td> ${free.boWriter  }</td>
			<td> ${free.boRegDate  } </td>
		</tr>
	</c:forEach>
</table>
</body>
</html>