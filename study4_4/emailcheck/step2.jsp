<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>회원가입 2단계</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	
	<div class="container">

		<form:form action="step3.wow" method="post" modelAttribute="member">

			<div class="row col-md-8 col-md-offset-2">
				<div class="page-header">
					<h3>회원가입 2단계</h3>
				</div>


				<table class="table">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>
					<tr>
						<th>ID</th>
						<td>
							<form:input path="memId" cssClass="form-control input-sm"/>
							<form:errors path="memId"/>
							<button type="button" id="idCheck">중복체크</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<form:input path="memPass" cssClass="form-control input-sm" /> 
							<form:errors path="memPass"/>
						</td>
					</tr>

					<tr class="form-group-sm">
						<th>회원명</th>
						<td>
							<form:input path="memName" cssClass="form-control input-sm"/>
							<form:errors path="memName" />
						</td>
					</tr>
					<tr class="form-group-sm">
						<th>이메일</th>
						<td>
							<form:input path="memMail" cssClass="form-control input-sm" />
							<form:errors path="memMail" />
							<button id="mailAuth" type="button">E-mail인증</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="cancel.wow" class="btn btn-sm btn-default"> <span
									class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									&nbsp;&nbsp;취 소
								</a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true"></span> &nbsp;&nbsp;다 음
								</button>
							</div>
						</td>
					</tr>
				</table>

			</div>

		</form:form>
	</div>
	<!-- END : 메인 콘텐츠  컨테이너  -->
</body>
<script type="text/javascript">
	$(document).ready(function(){
// 		var YesWeCan = 3;
// 		var a ="${canEl}";
// 		// el은 기본적으로 jsp에서 out.print 브라우저에서는 el을 받기만함 
// 		<c:if test="false">var YesWeCan=3;</c:if>	
		var isIdCheck = false;
		var isMailAuthed = false;
		
		$("#idCheck").on("click", function(e){
			e.preventDefault(); // 버튼이지만 form안에 있기때문에 submit되는것을 방지
			
			 $.ajax({
				url : "<c:url value='/join/idCheck.wow'/>"
			
				,data : {"memId" : $("#memId").val()} 
				,success: function(data){
					if(data=='사용가능'){
						isIdCheck = true;
						alert("사용 가능합니다.")
					}
				},error: function(req){
					console.log(req);
				}
				
			});//ajax 
			
		}); // id중복체크
		
		$("#idCheck").on("change", function(){
			isIdCheck = false;
		}); // id 변경될 시 
		
		$("#mailAuth").on("click", function() {
			var mail = $("#memMail").val()
// 			alert(mail)
			$.ajax({
				url : "<c:url value='/join/mailAuth.wow'/>"
				,data : {"mail" : mail}
				,success: function(data){
					// 자식창 열기 
// 					var myWin = window.open("url", "name", "_blank (새창으로 열기)");
					var myWin = window.open("<c:url value='/join/mailWindow.wow/' />", "메일인증", "_blank, width = 500px, height = 200px, left=500px, top=200px");
					// 화면 만들어야함
					if(data == '인증'){
						window.close();
					}
				}
				,error: function(req) {
					console.log(req)
				}
					
				
			});
			

		}); // mail 인증버튼 
		
		
		
		
		
		
		
		// submit 할 때 id 중복체크가 안되어있으면 alert id 중복체크를 해주세요 되어있다면 submit
		// 다음버튼 클릭 이벤트
		
		$(".pull-right > .btn").on("click", function(e){
			e.preventDefault();
			if(isIdCheck){
				// 이메일 체크도 되어있어야
				$.ajax({
					url : "<c:url value= '/join/isMailAuthed.wow'/>",
					data : {"mail" : $("#memMail".val() )},
					success : function (data) {
						if(data == '인증'){
							$("form").submit();						
						}else{
							alert("이메일 인증이 되지 않았습니다.")
						}
					},
					error : function (req) {
					}
				});
				
			}else{
			    alert("id 중복체크를 해주세요")
			}
			
		}); // 다음버튼 클릭
		
		
	});//ready

</script>
</html>



