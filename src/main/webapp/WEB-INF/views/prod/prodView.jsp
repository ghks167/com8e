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
<title>타이틀 입력</title>

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

<script type="text/javascript">
$(document).ready(
	function() {
	// 전체 체크박스 클릭
	$("#id_prod_check_all").click(
		function() {
			$("input[type=checkbox][name=pr_nos]").prop(
					"checked", $(this).prop("checked"));
			}); // 전체 체크박스 클릭
});
</script>




<body>
<div class="container">

	<%@include file="/WEB-INF/inc/common_top_menu.jsp" %>
	<br><br><br><br>
	
	<div class="panel panel-default">	
		<div class="panel-body form-horizontal">
			<form  action="prodView" >
			
			<div class="form-group">		
				<label class="col-sm-2  control-label">구분</label>
				<div class="col-sm-3">
					<select  name="searchType"  class="form-control input-sm" >
						<option value="">-- 전체 -- </option>
						
					</select>
				</div>
			</div>
				<label class="col-sm-2  control-label">제조사</label>
				<div class="col-sm-3">
			     	 <select  name="searchType"  class="form-control input-sm" >
			     	 		<option value="">-- 전체 -- </option>								
			     	 	<%-- <c:forEach var="" items="">
									
						</c:forEach>	 --%>
			     	 </select>
			    </div> 
			
			
			<div class="form-group">
			<label class="col-sm-2  control-label">검색어</label>
				<div class="col-sm-3">
			     	<input type="text" class="form-control  input-sm"> 
			    </div> 
		
			</div>	
		
			<div>
				<div class="pull-left" >			
					<button type="button" class="btn btn-sm btn-default" onclick="fn_search_reset()">
						<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
						&nbsp;&nbsp;초기화
					</button>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-sm btn-primary" >
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
						&nbsp;&nbsp;검 색
					</button>
				</div>
			</div>	
		</form>
	  </div>		
	</div>





	<div class="panel panel-default">	
	<br>
	<div class="pull-left col-sm-8">
		<div class="col-sm-2">
			<select name="" class="form-control input-sm">
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</select>
		</div>
		<button type="button" class="btn btn-sm btn-default"
			onclick="fn_screen_size_change()">선택</button>
	</div>
	<div class="pull-right">
		<button id="id_check_delete" class="btn btn-default btn-sm">
			선택글 삭제
		</button>
		<a href="boardForm.do" class="btn btn-primary btn-sm">
		 글 작성
		</a>
	</div>
	<br>




	<form:form commandName="prod" action="" method="post"
		enctype="multipart/form-data">
		<table class="table table-striped table-bordered table-ellipsis">
			<colgroup>
				<col width="4%" />
				<col width="10%" />
				<col width="15%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<th class="text-center"><input type="checkbox" id="id_prod_check_all" > </th>
				<th>   No		</th>
				<th> 상품명		</th>
				<th> 제조사		</th>
				<th> 가격		</th>
				<th> 수량		</th>
				<th> 상품 분류	</th>
				<th> 상품 등록일	</th>
			</thead>
			<tbody>
				<c:forEach var="prod" items="${prodList}">
					<tr>
						<td><input type="checkbox" name="pr_nos"> </td>
		 		 		<td>${prod.prod_no}</td>
						<td>${prod.prod_com}</td>
						<td>${prod.prod_price}</td>
						<td>${prod.prod_name}</td>
						<td>${prod.prod_qty}</td>
						<td>${prod.prod_type}</td>
						<td>${prod.prod_date}</td> 
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</form:form>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	</div>

</body>
</html>