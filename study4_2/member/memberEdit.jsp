
<%@page import="com.study.code.vo.CodeVO"%>
<%@page import="com.study.code.service.CommCodeServiceImpl"%>
<%@page import="com.study.code.service.ICommCodeService"%>
<%@page import="com.study.exception.BizNotFoundException"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@page import="com.study.member.service.IMemberService"%>
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>




 <div class="container">	
	<h3>회원 정보 수정</h3>	
	
<%-- 	<form action="memberModify.wow" method="post" > --%>
	<form:form action="memberModify.wow" method="post" modelAttribute="member">
	
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${member.memId }
					<input type="hidden" name="memId" value="${member.memId }">
					<form:errors path="memId"></form:errors>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<form:password path="memPass" cssClass="form-control input-sm"/>
					<form:errors path="memPass"/>
				</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
<%-- 					<input type="text" name="memName" class="form-control input-sm" value="${member.memName }" --%>
<!-- 						   required="required" pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력" > -->
						<form:input path="memName" cssClass="form-control input-sm"/>
						<form:errors path="memName"/>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
<%-- 					<input type="text" name="memZip" class="form-control input-sm" value='${member.memZip }'> --%>
						<form:input path="memZip" cssClass="form-control input-sm"/>
						<form:errors path="memZip"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
<%-- 					<input type="text" name="memAdd1" class="form-control input-sm" value='${member.memAdd1 }'> --%>
<%-- 					<input type="text" name="memAdd2" class="form-control input-sm" value='${member.memAdd2 }'> --%>
						<form:input path="memAdd1" cssClass="form-control input-sm"/>
						<form:errors path="memAdd1"/>
						<form:input path="memAdd2" cssClass="form-control input-sm"/>
						<form:errors path="memAdd2"/>
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
<%-- 					<input type="date" name="memBir" class="form-control input-sm" value='${member.memBir }'> --%>
						<form:input path="memBir" cssClass="form-control input-sm" value="${member.memBir }"/>
						<%-- Date형식이라 바꿀 수 없음 에러는 띄울 수 있음 --%>
						<form:errors path="memBir"/>
				</td>
			</tr>
			<tr>
				<th>메일</th>
				<td>
					<input type="email" name="memMail" class="form-control input-sm"  value='${member.memMail }'>
					<%-- required="required"위에 인풋태그에서 지워줌 서버에서 검사할꺼라  --%>
					<form:errors path="memMail"/>
				</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>
					<input type="tel" name="memHp" class="form-control input-sm" value='${member.memHp }'>
					<form:errors path="memHp"></form:errors>
				</td>
				
			</tr>
			<tr>
				<th>직업</th>
				<td>
				
<!-- 					<select name="memJob" class="form-control input-sm" > -->
<!-- 						<option value="">-- 직업 선택 --</option> -->
<%-- 						<c:forEach items="${jobList }" var="job"> --%>
<%-- 						<option value="${job.commCd }" ${member.memJob eq job.commCd ? "selected='selected'" :""} >${job.commNm }</option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select>			 -->
						<form:select path="memJob" cssClass="form-control input-sm">
							<form:option value="">-선택하세요-</form:option>
							<form:options items="${jobList }" itemLabel="commNm" itemValue="commCd"/>
						</form:select>
						<form:errors path="memJob"></form:errors>
					
					
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
				
<!-- 					<select name="memHobby" class="form-control input-sm" > -->
<!-- 						<option value="">-- 취미 선택 --</option> -->
<%-- 						<c:forEach items="${hobbyList }" var="hobby"> --%>
<%-- 						<option value="${hobby.commCd }" ${member.memHobby eq hobby.commCd ? "selected='selected'" :""} >${hobby.commNm }</option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select>			 -->
						<form:select path="memHobby" cssClass="form-control input-sm">
							<form:option value="">-선택하세요-</form:option>
							<form:options items="${hobbyList }" itemLabel="commNm" itemValue="commCd"/>
						</form:select>
						<form:errors path="memHobby"></form:errors>
									
				</td>
			</tr>	
			<tr>
				<th>마일리지</th>
				<td>${member.memMileage }</td>
			</tr>	
			<tr>
				<th>탈퇴여부</th>
				<td>${member.memDelYn }</td>
			</tr>	
			<tr>
				<td colspan="2">
					<a href="memberList.wow" class="btn btn-info btn-sm">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					&nbsp;목록으로
					</a>
					<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
					&nbsp;&nbsp; 저장
					</button>
					
						<button type="submit" formaction="memberDelete.wow" class="btn btn-danger btn-sm">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					&nbsp;&nbsp; 삭제
					</button>
					
					
				</td>
			</tr>
		</tbody>	
	</table>
<%-- 	</form> --%>
	</form:form>	
</div>


</body>
</html>