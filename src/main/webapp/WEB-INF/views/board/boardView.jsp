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
	margin-top: 5px;
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
		<div class="main_area col-sm-12">
		<h1>글보기</h1>
		<a href="${pageContext.request.contextPath}/board/boardList"><button type="button" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;목록으로</button></a>
		</div>
		<hr>
		<div class="main_area col-sm-12">

			<div class="col-sm-12 info_area" style="background-color: #6699FF">
				<div class="col-sm-3 info"><h4>${board.bo_mem}</h4></div> 
				<div class="col-sm-3 info"><h4>${board.bo_date}</h4></div>
				<div class="col-sm-3 info"><h4>조회 : ${board.bo_hit}</h4></div>
				<div class="col-sm-3 info"><h4>댓글 : [${board.bo_re_cnt}]</h4></div>
			</div> 

			<div class="col-sm-12 title_area well well-sm">
				<h4 id ="id_bo_title">${board.bo_title}</h4>
			</div>
			
			<div class="col-sm-12 content_area well well-sm">
				${board.bo_content}
			</div>
			
			<div class="col-sm-6">
					<a class="btn btn-default" href="${pageContext.request.contextPath}/board/boardEdit?bo_no=${board.bo_no}">수정하기</a>
				</div>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
 document.getElementById("id_bo_title").innerHTML = ${board.bo_title}

</script>
</html>