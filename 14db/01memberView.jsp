<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<%
		// 앞 페이지에서 파라미터 값 (mem_id)이 온다.
		String memId = request.getParameter("memId");

		try {
			// 1번 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.print("OracleDriber를 찾을 수 없음");
		}

		Connection conn = null; 	// 연결하는 객체
		PreparedStatement pstmt = null; // 쿼리 수행 객체
		ResultSet rs = null; 		// 결과 저장 객체 

		try {
			// 2.연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "jsp"); // ("a", "b", "c")

			// 3. 쿼리 수행
// 			stmt = conn.createStatement(); // 연결한 객체에게 쿼리를 수행. pstmt 사용 위해 주석
 			
 			StringBuffer sb = new StringBuffer();
			sb.append(" 		SELECT 															");
			sb.append(" 		 	   mem_id, 	mem_pass	, mem_name                 	");
			sb.append(" 			 , mem_bir,	mem_zip		, mem_add1    		    	");
			sb.append(" 			 , mem_add2, mem_hp		, mem_mail	               	");
			sb.append(" 			 , mem_job,	mem_hobby	, mem_mileage	         	");
			sb.append(" 			 , mem_del_yn                                 		     	");
			sb.append(" 		FROM member      		                      	        	");
			sb.append(" 		WHERE 1=1		      		                              	");
		  	sb.append(" 		AND mem_id =  ?													");
				
// 			rs = stmt.executeQuery(sb.toString()); pstmt 사용 위해 주석처리
			int index =1;
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(index, memId); 
			// 물음표 자리(쿼리문 조건절)에 requst로 받은 memId
			
			rs= pstmt.executeQuery();

			if (rs.next()) {
				MemberVO member = new MemberVO();
				member.setMemId(rs.getString("mem_id"));
				member.setMemPass(rs.getString("mem_pass"));
				member.setMemName(rs.getString("mem_name"));
				member.setMemBir(rs.getString("mem_bir"));
				member.setMemZip(rs.getString("mem_zip"));
				member.setMemAdd1(rs.getString("mem_add1"));
				member.setMemAdd2(rs.getString("mem_add2"));
				member.setMemHp(rs.getString("mem_hp"));
				member.setMemMail(rs.getString("mem_mail"));
				member.setMemJob(rs.getString("mem_job"));
				member.setMemHobby(rs.getString("mem_hobby"));
				member.setMemMileage(rs.getInt("mem_mileage"));
				member.setMemDelYn(rs.getString("mem_del_yn"));
				
				request.setAttribute("member", member);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 4. 종료
			// 		if(rs!=null) rs.close(); 이렇게 close 하는것은 권장되지 않는다.
			if (rs != null)   {try {rs.close();} catch (Exception e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
			if (conn != null) {try {conn.close();} catch (Exception e) {}}}
	%>

	<%-- <c:forEach items="${memIdList }" var= "memId"> --%>
	<%-- ${memId }<br> --%>
	<%-- </c:forEach> --%>

	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>memId</th>
				<td>${member.memId }</td>
			</tr>
			<tr>
				<th>memPass</th>
				<td>${member.memPass }</td>
			</tr>
			<tr>
				<th>memName</th>
				<td>${member.memName }</td>
			</tr>
			<tr>
				<th>memBir</th>
				<td>${member.memBir }</td>
			</tr>

			<tr>
				<th>주소</th>
				<td>${member.memAdd1 }</td>
			</tr>
			<tr>
				<th>memAdd2</th>
				<td>${member.memAdd2 }</td>
			</tr>
			<tr>
				<th>memHp</th>
				<td>${member.memHp }</td>
			</tr>
			<tr>
				<th>memMail</th>
				<td>${member.memMail }</td>
			</tr>
			<tr>
				<th>memJob</th>
				<td>${member.memJob }</td>
			</tr>
			<tr>
				<th>memHobby</th>
				<td>${member.memHobby }</td>
			</tr>
			<tr>
				<th>memMileage</th>
				<td>${member.memMileage }</td>
			</tr>
			<tr>
				<th>memDelYn</th>
				<td>${member.memDelYn }</td>
			</tr>
		</tbody>
	</table>

</body>
</html>
