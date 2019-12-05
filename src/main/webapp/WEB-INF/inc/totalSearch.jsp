<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
#div_total_search {
	/* font-size : 1em;             */
	border: 2px solid red;
	line-height: 55px;
	height: 125px;
	display: inline-flexbox
}

</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.2/css/bootstrap.css"
	rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.2/js/bootstrap.js"></script>
</head>
<body>
	<div class="bg-info" id="div_total_search">
		<table style="margin: auto; margin-top: 1.5%;">
			<tr>
				<td colspan="">[[[[로고]]]]&nbsp;&nbsp;</td>
				<td colspan="">COM8E.COM&nbsp;&nbsp;</td>
				<td><input type="text" style="width: 800px; height: 50px;"></td>
				<td>&nbsp;
					<button type="button" class="btn btn-success">Search</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>