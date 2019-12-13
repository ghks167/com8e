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
			<form:form commandName="prod" method="POST" action="${pageContext.request.contextPath}/prod/prodModify" cssClass="form-horizontal" enctype="multipart/form-data">
			
			<div class="col-sm-6 main_image">
				<img id="img1"class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name }">
			</div>
			<h1>상품 수정</h1>
			<div class="col-sm-6 main_info">
				<table class="table">
					<tr>
						<td>
							<div class="col-sm-3"><h4><label for="id_prod_name" class="control-label">상품명 : </label></h4></div>
						    <div class="col-sm-9"><form:input path="prod_name" type="text" id="id_prod_name" cssClass="form-control" value="${prod.prod_name}"/></div>
						</td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_type" class="control-label">분류 :</label></h4></div><div class="col-sm-9">
						<form:select id="id_prod_type" path="prod_type" cssClass="form-control margining">
							<option value="">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</option>
							<form:options items="${prodTypeList}" itemValue="prod_type" itemLabel="prod_type"></form:options>
						</form:select></div></td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_com" class="control-label">제조사 :</label></h4></div><div class="col-sm-9"><form:input path="prod_com" type="text" id="id_prod_com" cssClass="form-control" value="${prod.prod_com}"/></div></td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_qty" class="control-label">상품수량 :</label></h4></div><div class="col-sm-9"><form:input path="prod_qty" type="number" id="id_prod_qty" cssClass="form-control" value="${prod.prod_qty}"/></div></td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_price" class="control-label">가격 : </label></h4></div><div class="col-sm-9"><form:input path="prod_price" type="text" id="id_prod_price" cssClass="form-control" value="${prod.prod_price}"/></div></td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_price" class="control-label">상품이미지 : </label></h4></div><div class="filebox col-sm-9">
							<input class="upload-name" value="파일선택" id="fileName" disabled="disabled"> 
							<label for="ex_filename">선택</label>
							<input type="file" id="ex_filename" name="prod_main_image" class="upload-hidden file_input_image_hidden"></div></td>
					</tr>
					<tr>
						<td><div class="col-sm-3"><h4><label for="id_prod_price" class="control-label">상품설명 : </label></h4></div><div class="filebox col-sm-9">
							<input class="upload-name" value="파일선택" id="fileName2" disabled="disabled"> 
							<label for="ex_filename2">선택</label>
							<input type="file" id="ex_filename2" name="prod_info_image" class="upload-hidden file_input_info_hidden"></div></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><a href="prodView?prod_no=${prod.prod_no}" class="btn btn-sm btn-danger"> 수정취소</a>
					<button type="submit" class="btn btn-sm btn-success">수정완료</button></td>
					</tr>
				</table>	
			</div>
			<br>
			<h2> &nbsp;</h2>
			<hr>
			
			<div class="col-sm-12 info_image">
				<img id="img2" class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_INFO/${prod.map.PROD_I.image_file_name }">	
			</div>
			</form:form>	
		</div>
		
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
	<script type="text/javascript">
	
		$(document).ready(function(){
			var fileTarget = $('.filebox .upload-hidden');
			fileTarget.on('change', function(){// 값이 변경되면 
				if(window.FileReader){ // modern browser 
					var filename = $(this)[0].files[0].name; } else { 
						// old IE 
						var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
						} // 추출한 파일명 삽입 
						$(this).siblings('.upload-name').val(filename); }); 
			
			
			if($("#input_prod_price").val() == 0){
				$("#input_prod_price").val("");
			}
			if($("#input_prod_pty").val() == 0){
				$("#input_prod_pty").val("");
			}
			
			
			
			}); 
		
		var v_sel_file;
		
		$(document).ready(function(){
			$(".file_input_image_hidden").on("change",handleImgFileSelect);
		});
		
		function handleImgFileSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function (f) {
				if(!f.type.match("image.*")){
					alert("이미지 파일이 아닙니다.");
					$("#ex_filename").val("");
					$("#fileName").val("파일선택");
					
					return;
				}
				
				v_sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e){
					$("#img1").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
				});
			}
		
		$(document).ready(function(){
			$(".file_input_info_hidden").on("change",handleInfoFileSelect);
		});
		
		function handleInfoFileSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function (f) {
				if(!f.type.match("image.*")){
					alert("이미지 파일이 아닙니다.");
					$("#ex_filename2").val("");
					$("#fileName2").val("파일선택");
					
					return;
				}
				
				var reader = new FileReader();
				reader.onload = function(e){
					$("#img2").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
				});
			}
	</script>
</html>