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
<title>com8e</title>
<style type="text/css">

.category_list{
	margin-top: 35px;
}
#introduce_img{
	width: 100%;
	height: 20vh;
} 

</style>
</head>
<body style="background-color: lightgray">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_main_search.jsp" %>
		
		<div class="introduce col-sm-12" >
			<div class="introduce_list col-sm-4">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a>com8e.com</a></li>
					<li role="presentation" id="prod_category"><a href="${pageContext.request.contextPath}/prod/prodList">상품분류</a></li>
					<li role="presentation" id="prod_board" ><a href="${pageContext.request.contextPath}/prod/prodForm">공지사항</a></li>
					<li role="presentation" id="prod_notice" ><a href="${pageContext.request.contextPath}/board/boardList">게시판</a></li>
				</ul>
			</div>
			<div class="introduce_view col-sm-8" padding-top: 20px;">
				<div class="col-sm-12" id="view_area">
					<img id="introduce_img" class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/images/aaaaaa.JPG">
				</div>
			</div>
		</div>
		<div class="main_product col-sm-12" style="background-color: #F6F6F6;  border-radius: 10px; padding-top: 20px;">	
		
		 <c:forEach items="${prodMainLable}" var="divNum" >
			<label>${divNum.prod_type}</label>
			<div class="row">
				<c:forEach items="${prodMainthreeList}" var="mainThreeView">
					<c:if test="${divNum.prod_type eq mainThreeView.prod_type}">
			  			<div class="col-sm-3" style="text-align: center; "> 	
							<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name}"><br>
			  		
			  				${mainThreeView.prod_name}
			  			 

			  				<hr>
			  		</div>
			  		</c:if>
			  		
			  </c:forEach>
			</div>
			</c:forEach>
				  
		
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp" %>
	</div>   
</body>

<script type="text/javascript">
	
	$("#prod_category").on("mouseover",function(){
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/indexInclude/category.jsp", 
		    success: function(data){ 
		      $("#view_area").html(data); 
		    } 
		}); 
	});
	
	
	$("#prod_board").on("mouseover",function(){
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/indexInclude/board.jsp", 
		    success: function(data){ 
		      $("#view_area").html(data); 
		    } 
		}); 
	});
	
	$("#prod_notice").on("mouseover",function(){
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/indexInclude/notice.jsp", 
		    success: function(data){ 
		      $("#view_area").html(data); 
		    } 
		}); 
	});




</script>
</html>

