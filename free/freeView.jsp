
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<title>자유게시판 - 글 보기</title>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	

	
	<div class="alert alert-warning">
			해당 글이 존재하지 않습니다.
			또는 조회수증가 실패했습니다.
	</div>	
		<a href="freeList.jsp" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>


		<div class="container">
			<div class="page-header">
				<h3>
					자유게시판 - <small>글 보기</small>
				</h3>
			</div>
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th>글번호</th>
						<td>글번호</td>
					</tr>
					<tr>
						<th>글제목</th>
						<td>글제목</td>
					</tr>
					<tr>
						<th>글분류</th>
						<td>글분류</td>
					</tr>
					<tr>
						<th>작성자명</th>
						<td>작성자</td>
					</tr>
					<!-- 비밀번호는 보여주지 않음  -->
					<tr>
						<th>내용</th>
						<td><textarea rows="10" name="boContent" class="form-control input-sm">
						내용
					</textarea></td>
					</tr>
					<tr>
						<th>등록자 IP</th>
						<td>IP</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>조회수</td>
					</tr>
					<tr>
						<th>최근등록일자</th>
						<td>최근등록일자(수정을 했다면?)</td>
					</tr>
					<tr>
						<th>삭제여부</th>
						<td>삭제여부</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="freeList.jsp" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
								</a>
							</div>
							<div class="pull-right">
								<a href="freeEdit.jsp?boNo=" class="btn btn-success btn-sm"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
								</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- container -->

</body>
</html>






