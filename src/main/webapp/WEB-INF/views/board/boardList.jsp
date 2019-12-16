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
<title>자유게시판</title>
<style type="text/css">
#id_title_tr > th{
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area">
		<h1>자유게시판</h1>	
			<form:form commandName="searchVO" action="${pageContext.request.contextPath}/board/boardList" method="post" id="id_list_form"></form:form>
			<hr>
			<div class="boardList_area col-sm-12">
				<table class="table table-striped">
					<colgroup>
						<col width="10%"/>
						<col width="40%"/>
						<col width="20%"/>
						<col width="10%"/>
						<col width="20%"/>
					</colgroup>
					<tr id="id_title_tr">
						<th>NO.</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성날짜</th>
					</tr>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td align="center">${board.bo_no}</td>
							<td><a href="${pageContext.request.contextPath}/board/boardView?bo_no=${board.bo_no}">${board.bo_title}&nbsp;&nbsp;<font color=tomato>[${board.bo_re_cnt}]</font></a></td>
							<td align="center">${board.bo_mem}</td>
							<td align="center">${board.bo_hit}</td>
							<td align="center">${board.bo_date}</td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
			<div class="boardList_bottom_area col-sm-12">
				<div class="col-sm-8">
					&nbsp;
				</div>
				<div class="col-sm-4">
					<a href="${pageContext.request.contextPath}/board/boardForm" class="btn btn-primary">글쓰기</a>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>