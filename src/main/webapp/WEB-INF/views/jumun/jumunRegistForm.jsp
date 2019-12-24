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
<title>주문</title>
<style type="text/css">
.addr_area,.payment_area,.mem_area{
	margin-top: 8%;
}
.addr_area > div{
	margin-top: 15px;
}
.preview_image > img{
	width: 80%;
	height: 100px;

}
.page-header > h4{
	margin-top: 0px;
	margin-bottom: 3px;
}
.page-header {
	margin-top: 0;
}
.main_area{
	min-height: 70vh;
}


</style>
</head>
<!-- 기본 -->
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area col-sm-12">
			<h1>주문</h1>
			<hr>		
			<form:form id="payment_form" action="${pageContext.request.contextPath}/jumun/jumunProcess" method="post">
				<table class="table table-striped">
					<c:forEach var="jumun" items="${jumun_list}" varStatus="i">
						<tr>
							<td>
								<div class="col-sm-2 preview_image">
									<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${jumun.jl_image_name}">
								</div>
								<div class="col-sm-7 name_area">
									<!-- 상품 번호 -->
									<input type="hidden" value="${jumun.jl_prod_no}" name="items[${i.index}].jl_prod_no">
									<div class="page-header" style="margin-bottom: 5px;">
										<h4>
											${jumun.jl_prod_name}
										</h4>
									</div>
									<div class="qty_area col-sm-12" >
										<!-- 상품 수량 -->
										<input type="hidden" value="${jumun.jl_prod_qty}" name="items[${i.index}].jl_prod_qty">
										<h5 id="id_price_area">선택수량 : ${jumun.jl_prod_qty}</h5>
										
									</div>
									
								</div>
								<div class="col-sm-3 price_area">
									<h3 class="total_pp"> ${jumun.jl_prod_qty * jumun.jl_prod_price}</h3>
									<input type="hidden" value="${jumun.jl_prod_qty * jumun.jl_prod_price}" name="items[${i.index}].jl_prod_price" class="prod_price">
									<br>
								</div>
							</td>
						</tr>			
					</c:forEach>
					<tr>
						<td>
							<div class="col-sm-12" style="text-align: right;">
								<h3 id="id_total_price"></h3>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="col-sm-12">
					<hr>
				</div>
				
				<!-- 사용자 정보 -->
				<div class="col-sm-12 mem_area">
					<h3>주문자 정보</h3>
					<input type="hidden" value="${LOGIN_INFO}" name="jumun_mem">
					
					<table class="table table-striped">
						<colgroup>
							<col width="15%"/>
							<col/>
						</colgroup>
						<tr>
							<th>
								ID :
							</th>
							<td>
								<input type="text" class="form-control" value="${memVO.mem_id}" readonly="readonly">
							</td>
						</tr>
						
						<tr>
							<th>
								주문자 이름:
							</th>
							<td>
								<input type="text" class="form-control" value="${memVO.mem_name}" readonly="readonly">
							</td>
						</tr>
						
						<tr>
							<th>
								주문자 전화번호:
							</th>
							<td>
								<input type="text" class="form-control" value="${memVO.mem_hp}" readonly="readonly">
							</td>
						</tr>
						
						<tr>
							<th>
								주문자 주소:
							</th>
							<td>
								<div class="col-sm-7" style="padding-left: 0">
									<input type="text" class="form-control" value="${memVO.mem_addr}" id="id_addr_copy" readonly="readonly">
								</div>
								<div class="col-sm-5" style="text-align: right; padding-right: 0">
									<input type="button" class="btn btn-default" value="회원 주소 배송지로 사용하기" onclick="addr_copy()">
								</div>
							</td>
						</tr>
						
					</table>
				</div>
				
				<div class="col-sm-12">
					<hr>
				</div>
				
				<!-- 주소정보 -->

				
				<div class="col-sm-12 addr_area">
					<h5>( * )은 필수입니다!</h5> 
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sample4_postcode" name="jumun_post_code" placeholder="*우편번호">			
					</div>
					<div class="col-sm-3" style="text-align: right;">
						<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default"  value="우편번호 찾기">
					</div>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="sample4_roadAddress" name="jumun_addr" placeholder="*도로명주소">
					</div>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소">
					</div>	
					<span id="guide" style="color:#999;display:none"></span>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="sample4_detailAddress" name="jumun_addr_det" placeholder="상세주소">
					</div>
					
					<div class="col-sm-6">
						<input type="text" class="form-control" id="sample4_extraAddress"  name="jumun_addr_ref" placeholder="참고항목">
					</div>
				</div>
				
				<div class="col-sm-12">
					<hr>
				</div>
				
			</form:form>
				<div class="col-sm-12 payment_area">
					<h3>결제 정보</h3>
					<table class="table table-condensed">
						<colgroup>
							<col width="15%"/>
							<col/>
						</colgroup>
						<tr>
							<th>
								총 상품 가격 : 
							</th>
							<td class="total_price">
							</td>
						</tr>
						<tr>
							<th>
								배송비 : 
							</th>
							<td>
								2,500원
							</td>
						</tr>
						<tr>
							<th>
								총 결제 금액 :
							</th>
							<td id="total_pppp">
							</td>
						</tr>
						<tr>
							<th>
								결제방법 : 
							</th>
							<td>
								<label for="samsung">삼성페이</label><input type="radio" name="payment_way" id="samsung" value="samsung">
								&nbsp;
								<label for="card">신용카드</label><input type="radio" checked="checked" name="payment_way" id="card" value="card">
								&nbsp;
								<label for="trans">실시간계좌이체</label><input type="radio" name="payment_way" id="trans" value="trans">
								&nbsp;
								<label for="vbank">가상계좌</label><input type="radio" name="payment_way" id="vbank" value="vbank">
								&nbsp;
								<label for="phone">소액결제</label><input type="radio" name="payment_way" id="phone" value="phone">	
							</td>
						</tr>				
					</table>
				
			
					<div class="col-sm-12" style="text-align: center; margin-top: 50px;">
						<a class="btn btn-warning" href="javascript:history.back()">뒤로가기</a>
						<input type="button" class="btn btn-success" value="결제하기" onclick="required_check()">
					</div>
				</div>
		
			
			
			
			
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">

	
	var arr_price = document.getElementsByClassName("prod_price");
	var total = 0;
	for(var i = 0; i<arr_price.length; i++){
		total += parseInt($(arr_price[i]).val());
	}
	$("#id_total_price").html("총 상품 가격 : "+numberWithCommas(total));
	$(".total_price").html(numberWithCommas(total) +"원");
	$("#total_pppp").html(numberWithCommas(total+2500)+"원");
	
	var aa = $(".total_pp");
	
	for(var i =0; i<aa.length; i++){
		$(aa[i]).html(numberWithCommas($(aa[i]).html())+ " 원");	
	}
</script>

<!--주소 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        
        
        
        }).open(); 
    }
</script>


<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

function f_payment() {	
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	var payment_info = {
			pay_method : $("input[name = 'payment_way']:checked").val(),
			amount : total + 2500,
			buyer_email : '${LOGIN_INFO}@com8e.com',
			buyer_name : '${LOGIN_INFO}',
			buyer_tel : '010-0000-0000',
			buyer_addr :$("input[name = 'jumun_addr']").val(),
			buyer_postcode : $("input[name = 'jumun_post_code']").val()
			
	};
	
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : payment_info.pay_method,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:com8e',
	    amount : payment_info.amount,
	    buyer_email : payment_info.buyer_email,
	    buyer_name : payment_info.buyer_name,
	    buyer_tel : payment_info.buyer_tel,
	    buyer_addr :  payment_info.buyer_addr,
	    buyer_postcode :  payment_info.buyer_postcode,
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( !rsp.success ) {
	    	$("#payment_form").submit();
	    }
	    alert('결제 성공');
	});
	
}
function required_check() {
	var post_code = $("input[name = 'jumun_post_code']").val();
	var addr = $("input[name = 'jumun_addr']").val();
	
	if(post_code == "" || addr == ""){
		alert("주소를 확인하세요");
		
	}else {
		f_payment();
	}
	
	
	
	
}
function addr_copy() {
	$("#sample4_roadAddress").val($("#id_addr_copy").val());
}



</script>


</html>