<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/WEB-INF/inc/common_header.jsp"%>
   	<title></title>
  </head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<h3>회원정보</h3>
		<hr>
		<div class="cls_div_main_form row">
			<form:form action="memberRegist" commandName="member" cssClass="form-horizontal" id="id_form">
			
				<!-- 아이디 -->
				<div class="form-group">
					<label for="inputid" class="col-sm-2 control-label">아이디 : </label>
					<div class="col-sm-8">
						<form:input path="mem_id" id="inputid" cssClass="form-control" placeholder="ID"/>
					</div>
					<div class="col-sm-2">
						<input type="button" class="btn btn-warning" id="id_overlap_check" value="중복체크">
					</div>
				</div>
				<br>
				
				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="inputpass" class="col-sm-2 control-label">비밀번호 : </label>
					<div class="col-sm-8">
						<form:input path="mem_pass" id="inputpass" cssClass="form-control" placeholder="password"/>
					</div>
				</div>
				<br>
				
				<!-- 이름 -->
				<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">이름 : </label>
					<div class="col-sm-8">
						<form:input path="mem_name" id="inputname" cssClass="form-control" placeholder="name"/>
					</div>
				</div>
				<br>
				
				<!-- 주민번호 -->
				<div class="form-group">
					<label for="inputregno" class="col-sm-2 control-label">주민등록번호 : </label>
					<div class="col-sm-4">
						<form:input path="mem_regno1" id="inputregno" cssClass="form-control" placeholder="YY/MM/DD"/>
					</div>
					
					<div class="col-sm-1">
						-
					</div>
					
					<div class="col-sm-4">
						<form:input path="mem_regno2" cssClass="form-control" placeholder="*******"/>
					</div>		
				</div>
				<br>
				
				<!-- 전화번호 -->
				<div class="form-group">
					<label for="inputhp" class="col-sm-2 control-label">전화번호 : </label>
					<div class="col-sm-8">
						<form:input path="mem_hp" id="inputhp" cssClass="form-control" placeholder="phone"/>
					</div>
				</div>
				<br>
				
				<!-- 생년월일 -->
				<div class="form-group">
					<label for="inputbir" class="col-sm-2 control-label">생년월일 : </label>
					<div class="col-sm-8">
						<input type="date" id="inputbir" class="form-control" name="mem_bir">
					</div>
				</div>
				
				<!-- 주소 -->
				<div class="form-group">
					<label for="inputaddr" class="col-sm-2 control-label">주소 : </label>
					<div class="col-sm-8">
						<form:input path="mem_addr" class="form-control" placeholder="address"/>
					</div>
				</div>
				<br>
				<div>
					<a href="${pageContext.request.contextPath}/"
						class="btn btn-default">홈으로</a>
					<input type="button" id="id_submit_btn" class="btn btn-success"
						value="회원가입" />
				</div>
			</form:form>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>