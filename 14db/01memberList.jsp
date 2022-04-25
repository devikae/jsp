<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	// JDBC 코딩 순서 (commit 꼭 하기!)
	// 1. 드라이버 로드
	// 2. 연결
	// 3. 쿼리행 및 여러가지()
	// 4. 종료 
	
	try{
		// 1번 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");  
	}catch(ClassNotFoundException e){
		System.out.print("OracleDriber를 찾을 수 없음");
	}

	Connection conn = null;	// 연결하는 객체
	Statement stmt = null;		// 쿼리수행 객체
	ResultSet rs= null;			// select의 경우 결과 저장 객체 

	try{
		// 2.연결
		conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp"); // ("a", "b", "c")
		// a= jdbc:oralce:thin:host:PORT:SID | b= 계정 | c= 비밀번호
		
		// 3. 쿼리 수행
		stmt= conn.createStatement(); // 연결한 객체에게 쿼리를 수행해라.
// 		rs=stmt.executeQuery("SELECT  FROM member");		// 쿼리문 내 ";" 쓰지 말 것.
		// select mem_id
		// from member;  의 데이터(a001~a0040까지)가 rs에 담겨있음
		
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" 		SELECT 															");
		sb.append(" 		 		mem_id	, 	mem_pass	, mem_name                 	");
		sb.append(" 			 , mem_bir,	mem_zip	, mem_add1        		    	");
		sb.append(" 			 , mem_add2, mem_hp		, mem_mail	               	");
		sb.append(" 			 , mem_job,	mem_hobby	, mem_mileage		         	");
		sb.append(" 			 , mem_del_yn                                      	");
		sb.append(" 		FROM member      		                              	");
		// Alt + Shift + A 해서 영역 지정 후 copy& paste 
		
		rs= stmt.executeQuery(sb.toString());
		
		
		
// 		List<String> memIdList = new ArrayList<String>(); 
		List<MemberVO> memberList = new ArrayList<MemberVO>(); 
		
		while(rs.next()){
// 			String memId= rs.getString("mem_id");
// 			memIdList.add(memId);
			MemberVO member = new MemberVO();
			member.setMemId( rs.getString("mem_id") );
			member.setMemPass( rs.getString("mem_pass") );
			member.setMemName( rs.getString("mem_name") );
			member.setMemBir( rs.getString("mem_bir") );
			member.setMemZip( rs.getString("mem_zip") );
			member.setMemAdd1( rs.getString("mem_add1") );
			member.setMemAdd2( rs.getString("mem_add2") );
			member.setMemHp( rs.getString("mem_hp") );
			member.setMemMail( rs.getString("mem_mail") );
			member.setMemJob( rs.getString("mem_job") );
			member.setMemHobby( rs.getString("mem_hobby") );
			member.setMemMileage( rs.getInt("mem_mileage") );
			member.setMemDelYn( rs.getString("mem_del_yn") );
			// 추가하고 난 후에 배열에 값 담아주기.
			
			memberList.add(member);

			
		}
// 		request.setAttribute("memIdList", memIdList);
		
		request.setAttribute("memberList", memberList);	// 담아줬다면 setAttribute 해줘야 화면에 출력할 수 있다.
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		
		// 4. 종료
// 		if(rs!=null) rs.close(); 이렇게 close 하는것은 권장되지 않는다.
		if(rs!=null)   {try {rs.close();} catch(Exception e){}}
		if(stmt!=null) {try {stmt.close();} catch(Exception e){}}
		if(conn!=null) {try {conn.close();} catch(Exception e){}}
		
	}
	
	
%>

<%-- <c:forEach items="${memIdList }" var= "memId"> --%>
<%-- ${memId }<br> --%>
<%-- </c:forEach> --%>

<table class="table table-striped table-bordered">
	<tbody>
		<c:forEach items="${memberList }" var="member">
		<tr>
			<td>${member.memId }</td>
			<td> <a href="01memberView.jsp?memId=${member.memId }"> ${member.memName } </a> </td>
			<% // **중요 a태그로 파라미터를 보내고 View에서 파라미터에 관한 데이터를 불러옴 %>
			<td>${member.memBir }</td>
			<td>${member.memHobby }</td>
			<td>${member.memMail }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>