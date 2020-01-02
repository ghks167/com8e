<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>로그인</title>
<style type="text/css">
#id_div_mem_find{
	float: right;
}
.cls_login_form{
	height: 70vh;
}


</style>

</head>

<script type="text/javascript">
	function go_home() {
		window.location.href="/com8e/";
		
	}

</script>
<body>
	<div class="container">
		<div class="row">
			<h3>로그인</h3>
		</div>
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>

		<div class="cls_login_form">
	
			
			<div class="container" style="  width: auto; margin-left: 30% "  >
			<div	class = "col-sm-5"  style="text-align:center; ">
				<form action="${pageContext.request.contextPath}/login/logincheck" method="post">
		
					<br> <input class="form-control  input-sm" type="text" name="mem_id" placeholder="ID"/>
					<br> <input type="password" class="form-control  input-sm" type="text" name="mem_pass" placeholder="Password"/>
					<br> <br> <input type="submit" class="btn btn-default" value="로그인"> <br>
				</form>
				
			
			</div>

			</div>
			<hr>
			<div>
				<div>
					<input id="id_home" type="button" class="btn btn-default" onclick="go_home()" value="홈">
					<input id="id_join" type="button" class="btn btn-default" value="회원가입">			
				</div>
			
				<div id="id_div_mem_find">
					<input id="id_searchId" type="button" class="btn btn-default" value="아이디 찾기">
					<input id="id_searchPw" type="button" class="btn btn-default" value="비밀번호 찾기">
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp" %>
		
	</div>
</html>
