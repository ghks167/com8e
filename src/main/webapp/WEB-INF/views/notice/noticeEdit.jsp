<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>공지 수정</title>
<style type="text/css">
.main_area{
	padding: 0 10% 0 10%;

}

.title_area{
	height: 5vh;
}
.content_area{
	height: 420px;
	
}

</style>
</head>
<!-- 기본 -->
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<h1>공지 수정</h1>	
		<hr>
		<div class="main_area">
			<form:form commandName="board" method="post" action="noticeModify?no_bo_no=${board.no_bo_no}">
				<div class="form-group title_area">
					<label for="inputTitle" class="col-sm-2 control-label">제목 : </label>
					<div class="col-sm-10">
						<form:input path="no_bo_title" cssClass="form-control" id="inputTitle" placeholder="title" value="${board.no_bo_title}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">작성자 : </label>
					<div class="col-sm-10">
						<form:input path="no_bo_mem" cssClass="form-control"  readonly="true"/>
					</div>
				</div>
				
				
				<div class="form-group content_area">
					<label for="inputContent" class="col-sm-12 control-label">내용 </label>
					<div class="col-sm-12">
						<form:textarea path="no_bo_content" cssClass="form-control" id="inputContent" rows="15" placeholder="content" value="${board.no_bo_content}"/>
					</div>
				</div>
				
				<div class="col-sm-12">
					<input type="submit" class="btn btn-success" value="수정완료">
					<a href="${pageContext.request.contextPath}/notice/noticeView?no_bo_no=${board.no_bo_no}"><input type="button" class="btn btn-warning" value="뒤로가기"></a>		
				</div>
			</form:form>
			
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>