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
<title>${prod.prod_name}</title>
<style type="text/css">


.main_image {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}
.main_image > img {
	width: 400px;
	height: 400px;
}
.main_info{
	margin-top: 50px;

}
.info_image{
	margin-bottom: 50px;
}
.info_image > img {
	width: 100%;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area col-sm-12">
			<h1>${prod.prod_name}</h1>	
			<hr>
			
			<div class="col-sm-6 main_image">
				<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name }">
			</div>
			<div class="col-sm-6 main_info">
				<table class="table">
					<tr>
						<td><h4>상품명 : &nbsp;&nbsp; ${prod.prod_name}</h4></td>
					</tr>
					<tr>
						<td><h4>분류 : &nbsp;&nbsp; ${prod.prod_type}</h4></td>
					</tr>
					<tr>
						<td><h4>제조사 : &nbsp;&nbsp; ${prod.prod_com}</h4></td>
					</tr>
					<tr>
						<td><h4>잔여수량 : &nbsp;&nbsp; ${prod.prod_qty}</h4></td>
					</tr>
					<tr>
						<td><h2>가격 : &nbsp;&nbsp;&#8361;&nbsp; ${prod.prod_price}</h2></td>
					</tr>
				</table>	
			</div>
			<br>
			<h2> &nbsp;</h2>
			<hr>
			
			<div class="col-sm-12 info_image">
				<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_INFO/${prod.map.PROD_I.image_file_name }">	
			</div>	
		</div>
		
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>