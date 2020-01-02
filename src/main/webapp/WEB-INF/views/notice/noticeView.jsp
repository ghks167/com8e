<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form' %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<%@include file='/WEB-INF/inc/common_header.jsp'%>
<title>공지보기</title>
<style type='text/css'>
.main_area{
	padding: 0 10% 0 10%;
	background-color: #F6F6F6;
	border-radius: 15px /15px;
}
.content_area{
	min-height: 70vh;
	background-color: #EAEAEA;
}
.title_area{
	margin-top: 5px;
	margin-bottom: 0;
}
.info_area{
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 15px/15px;
	background-color: white;
	border: #BDBDBD solid 2px; 
}
.reply_area{
	margin-top: 25px;
}
.reply_list_area{
	background-color: #F6F6F6;
	min-height: 40px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-radius:  30px 30px 30px 30px/ 30px 30px 30px 30px;
	
}
.recomend_area{
	background-color: white;
	margin-top: 10px;
	margin-bottom: 10px;
}
.text_over{
	word-break:break-all;
}

</style>
</head>
<!-- 기본 -->
<body>
	<%@include file='/WEB-INF/inc/common_top_menu.jsp'%>
	<div class='container'>
		<div class='main_area col-sm-12'>
		<h1>공지 보기</h1>
		<a href='${pageContext.request.contextPath}/notice/noticeList'><button type='button' class='btn btn-sm btn-warning'><span class='glyphicon glyphicon-th-list' aria-hidden='true'></span>&nbsp;&nbsp;목록으로</button></a>
		</div>
		<hr>
		<div class='main_area col-sm-12'>

			<div class='col-sm-12 info_area'>
				<div class='col-sm-3 info'><h4>${board.bo_mem}</h4></div> 
				<div class='col-sm-3 info'><h4>${board.bo_date}</h4></div>
				<div class='col-sm-3 info'><h4>조회 : ${board.bo_hit}</h4></div>
				<div class='col-sm-3 info'><h4>댓글 : [${board.bo_re_cnt}]</h4></div>
			</div> 
		
			<div class='col-sm-12 title_area well well-sm'>
				<h4 id ='id_bo_title'>${board.bo_title}</h4>
			</div>
			
			<div class='col-sm-12 content_area well well-sm'>
				${board.bo_content}
			</div>
			

			<div class="col-sm-12" style="text-align: right; margin-bottom: 50px;">
					<a class="btn btn-default" href="${pageContext.request.contextPath}/notice/noticeEdit?bo_no=${board.bo_no}">수정하기</a>
				</div>
		</div>
		<div class='reply_area col-sm-12'>
			<div class='form-group'>
				<form action='#' id='id_reply_form'>
					<input type='hidden' value='${board.bo_no}' name='re_bo_no'>
					<input type='hidden' value='${LOGIN_INFO}' name='re_mem'>
					<div class='col-sm-11'>
					
	    				<h4><label for='inputReply'>댓글 <font color="tomato">[${board.bo_re_cnt}]</font></label></h4>
	    			</div>
	    			<div class='col-sm-1' style='margin-bottom: 10px; text-align: right;'>
	    				<input type='button' id='reply_submit_btn' class='btn btn-default' value='등록'>
	    			</div>
	    			<textarea class='form-control' rows='2' id='inputReply' name='re_content'></textarea>
    			</form>
  			</div>
  			
  			
		</div>
		
		
		<%@include file='/WEB-INF/inc/common_footer.jsp'%>
	</div>
</body>
<script type='text/javascript'>
	$('#reply_submit_btn').on('click',function(){
		if('${LOGIN_INFO}' == ''){
			location.href = '${pageContext.request.contextPath}/login/loginForm';
		}
		
		var param = $('#id_reply_form').serialize();
		$.ajax({
			type: 'post',
			url: '<c:url value='/reply/replyRegist'/>',
			data: param,
			dataType: 'json',
			success: function (data) {
				console.log(data);
				if (data.result) {
					alert(data.msg);
					location.reload();
				} else {
					alert(data.msg);
				}
			}
		}); //ajax
	});
	
	$(document).ready(function() {
		pa = 're_bo_no=${board.bo_no}';
		$.ajax({
			type: 'post',
			url: '<c:url value='/reply/replyList'/>',
			data: pa,
			success: function (data) {
				$('#reply').html(data);
			}
		})
	});
	
	function f_comment_set(aa) {
		if('${LOGIN_INFO}' == ''){
			location.href = '${pageContext.request.contextPath}/login/loginForm';
		}
		
		$('#id_comment').remove();
		var stag = "<div id='id_comment'><div class='col-sm-1'>&#8618;</div><div class='col-sm-9 cc'><input type='text' class='form-control' id='id_comment_content''></div><div class='col-sm-2'><input type='button' onclick='f_comment_insert(this)' class='btn btn-primary btn-xs' style='margin-top: 6px;' value='등록'></div></div>";
		$(aa).closest('.reply_list_area').append(stag);
		
	}
	
	function f_comment_insert(aa) {
		
		var re_parent_no = $(aa).closest('.reply_list_area').data("re_no");
		var re_content = $("#id_comment_content").val();
		console.log(re_content);
		
		pa = {	
				"re_bo_no":${board.bo_no},
				"re_parent_no":re_parent_no,
				"re_content":re_content,
				"re_mem":"${LOGIN_INFO}"
			};
		console.log(pa);
		
		$.ajax({
			type: 'post',
			url: "<c:url value='/reply/commentRegist'/>",
			data: pa,
			dataType: 'json',
			success: function (data) {
				console.log(data);
				if (data.result) {
					alert(data.msg);
					location.reload();
				} else {
					alert(data.msg);
				}
			}
		});
		
		
		
	}

	
	
	
	
	

</script>
</html>