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
.main_area{
	height: 80vw;

}

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
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area">
			<h1>${prod.prod_name}</h1>	
			<hr>
			
			<div class="col-sm-6 main_image">
				<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/d5b370f4-a3fb-4c39-9659-88516b7a930f">	
			</div>
			<div class="col-sm-6">
				<table class="table">
					<tr>
						<td><h4>상품명 : &nbsp;&nbsp; ${prod.prod_name}</h4></td>
					</tr>
				</table>
		
		
			
				
			
			
			</div>
		<hr>	
			
		
		
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>