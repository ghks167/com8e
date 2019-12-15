<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>글보기</title>
<style type="text/css">
.main_area{
	padding: 0 10% 0 10%;
	background-color: #F6F6F6;
	border-radius: 15px /15px;
}
.content_area{
	min-height: 70vh;
}
.title_area{
	margin-top: 20px;
	margin-bottom: 0;
}
.info_area{
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 15px/15px;
	background-color: white;
}




</style>
</head>
<!-- 기본 -->
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<h1>글보기</h1>	
		<hr>
		<div class="main_area col-sm-12">
			
			
			<div class="col-sm-12 title_area well well-sm">
				<h4>${board.bo_title}</h4>
			</div>
			
			<div class="col-sm-12 info_area">
				<div class="col-sm-3 info">
					글쓴이 : ${board.bo_mem}
				</div>
				<div class="col-sm-3 info">
					작성일 : ${board.bo_date}
				</div>
				
				<div class="col-sm-6">
					<a class="btn btn-default">수정하기</a>
				</div>
			</div>
			<div class="col-sm-12 content_area well well-sm">
				${board.bo_content}
			</div>
			
			
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>