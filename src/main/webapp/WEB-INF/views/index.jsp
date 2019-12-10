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
<title>com8e</title>
</head>


<body style="background-color: lightgray">
	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<%@include file="/WEB-INF/inc/common_main_search.jsp" %>
		<div class="introduce">
			<div class="introduce_list">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a>com8e.com</a></li>
					<li role="presentation" ><a href="#">상품분류</a></li>
					<li role="presentation" ><a href="#">공지사항</a></li>
					<li role="presentation" ><a href="#">게시판</a></li>
				</ul>
			</div>
			<div class="introduce_view">
				<img alt="" src="${pageContext.request.contextPath}/images/background.jpg" style="height: 100%; width: 100%;">
			</div>
		</div>
		
		<div class="category">
		</div>
		
		<div class="main_product">
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp" %>
	</div>
</body>
</html>

