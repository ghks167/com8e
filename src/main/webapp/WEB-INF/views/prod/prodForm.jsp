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
<style type="text/css">
.main_form_area {
	height: 80vh;
	padding: 0 5% 0 5%;
}

.margining {
	margin-bottom: 80px;
}

.margininglabel {
	padding-bottom: 88px;
	text-align: right;
}
.img_wrap > img {
		width: 200px;
		height: 200px;
}
</style>
<title>상품등록</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_form_area">
			<h1>상품등록</h1>	
			<hr>
			<form:form commandName="prod" method="POST" action="${pageContext.request.contextPath}/prod/prodRegist"  cssClass="form-horizontal" enctype="multipart/form-data">

				<div class="form-group">
					<label for="input_prod_name" class="col-sm-2 control-label">상품 이름 : </label>
					<div class="col-sm-10">
						<form:input path="prod_name" id="input_prod_name" cssClass="form-control" placeholder="Product_Name" />						
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-2" style="height: 50vh;">
						<label for="input_prod_price" class="control-label margininglabel">&emsp;&emsp;&emsp;상품가격 : </label><br> 
						<label for="input_prod_type"class="control-label margininglabel">&emsp;&emsp;&emsp;상품분류 : </label><br> 
						<label for="input_prod_qty" class="control-label margininglabel">&emsp;&emsp;&emsp;상품수량 : </label><br>
						<label for="input_prod_com" class="control-label margininglabel">&emsp;&emsp;&emsp;&emsp;제조사 : </label><br>
					</div>

					<div class="col-sm-4">
						<form:input path="prod_price" id="input_prod_price"
							cssClass="form-control margining" placeholder="Product_price" />
						<form:select path="prod_type" cssClass="form-control margining" id="input_prod_type">
							<option value="">- - - - - - - - - - - - - - - -</option>
							<form:options items="${prodTypeList}" itemValue="prod_type"
								itemLabel="prod_type"></form:options>
						</form:select>
						<form:input path="prod_qty" id="input_prod_qty"
							cssClass="form-control margining" placeholder="Product_qty" />
							
						<form:input path="prod_com" id="input_prod_com"
							cssClass="form-control margining" placeholder="Product_com" />
					</div>



					<div class="col-sm-2">
						<label for="ex_filename" class="control-label">메인이미지 : </label>
					</div>
					<div class="col-sm-4">
						<div class="filebox">
							<input class="upload-name" value="파일선택" id="fileName" disabled="disabled"> 
							<label for="ex_filename">선택</label>
							<input type="file" id="ex_filename" name="prod_main_image" class="upload-hidden file_input_image_hidden">
						</div>
					</div>


					<div class="col-sm-2">
						<label for="ex_filename2" class="control-label">상세이미지 : </label>
					</div>
					<div class="col-sm-4">
						<div class="filebox">
							<input class="upload-name" value="파일선택" id="fileName2" disabled="disabled"> 
							<label for="ex_filename2">선택</label>
							<input type="file" id="ex_filename2" name="prod_info_image" class="upload-hidden file_input_info_hidden">
						</div>
					</div>
					
					
					<div class="img_wrap col-sm-3">
						<h4>메인이미지</h4>
						<img id="img1" />
					</div>

					<div class="img_wrap col-sm-3">
						<h4>상세이미지</h4>
						<img id="img2" />
					</div>
					
				</div>
				<div class="col-sm -10" style="float: right;">
					<a href="prodList" class="btn btn-sm btn-default">등록취소</a>
					<button type="submit" class="btn btn-sm btn-success">등록하기</button>
				</div>
			</form:form>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
	
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
			if($("#input_prod_qty").val() == 0){
				$("#input_prod_qty").val("");
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
</body>
</html>