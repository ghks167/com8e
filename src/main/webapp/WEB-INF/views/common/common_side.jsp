<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% String mem_id = (String)session.getAttribute("LOGIN_INFO"); 
	request.setAttribute("mem_id", mem_id);
	%>


<style>

.preview_image > img{
	width: 80%;
	height: 100px;

}

.page-header {
	margin-top: 0;
}
.main_area{
	min-height: 70vh;
}

.navi {     position: fixed; 
			  right: 50%; 
			  top: 180px; 
			  margin-right: -720px; 
			  text-align:center; 
			  width: 120px; 
			  }
			  
.cart {	
			  border-radius: 15px /15px;
			  text-align:center ;
			  background-color:#EAEAEA ;
			  position: fixed; 
			  right: 50%; 
			  top: 340px;
			  margin-right: -720px; 
			  text-align:center;
			  width: 120px; 
			  height: 580px;
			  overflow: auto;
		}

.advertise1 { position: fixed; 
			  left: 10%; 
			  top: 540px; 
			  margin-right: -720px; 
			  text-align:center; 
			  width: 120px; 
			  }

.advertise2 { position: fixed; 
			  left: 10%; 
			  top: 180px; 
			  margin-right: -720px; 
			  text-align:center; 
			  width: 120px; }
			  
 .up{		   width: auto; height: auto;
   				max-width: 50px;
    			max-height: 50px;
 				}
 				
 .down{	  width: auto; height: auto;
    		max-width: 50px;
 			 max-height: 50px;
 				}
			  
img{
		border-radius: 10px 10px 10px 10px/ 10px 10px 10px 10px;
	}

 

</style>	
		
<div class="navi">
<img id="id_up" class="up" src="${pageContext.request.contextPath}/images/up.png"> <br><br><br>
<img id="id_down" class="down" src="${pageContext.request.contextPath}/images/down.png"> 
</div>

	
<div class="advertise1"><a href="http://www.inven.co.kr/board/ryzen/5068/262"><img src="${pageContext.request.contextPath}/images/advertise1.jpg"/></a></div>:

<div class="advertise2"><a href="http://www.inven.co.kr/board/ryzen/5068/262"><img src="${pageContext.request.contextPath}/images/advertise2.jpg"/></a></div>:

<div class="cart" id="cart" >
	<h5><a href='${pageContext.request.contextPath}/cart/cartList'>장바구니 이동</a></h5>
	<h4>내 장바구니</h4>
	<hr>
	<table class='table table-striped' id="tb_cart">
	
	</table>
</div>


<script type="text/javascript">

document.getElementById("id_up").onclick = function(){
	
	$('html, body').animate({
	      scrollTop: 0
	    }, 1000)
}

document.getElementById("id_down").onclick = function() {
		
	$('html, body').animate({
			scrollTop : ( $(document).height() )
			}, 1000)

}

$(document).ready(function() {
	
	$.ajax({
		type: 'post',
		url: '<c:url value="/common/common_side"/>',
		success: function (data) {
	/* 		console.log(data);
			console.log(data[0].main_image_name);
			console.log(data[0].prod.prod_name);  */
			console.log(data);
		 	var v_mem = "d";
			v_mem = "${mem_id}" 
			console.log(v_mem);
			if(v_mem == ''){
				$("#cart").html("장바구니는 로그인 이후에 사용하실 수 있습니다.");
			}
			else if(v_mem!=''){
				if(data[0]==null){
					$("#cart").html("장바구니가 비어있습니다.");
				}
				else if(data[0]!=null){
					for(var i=0; i<data.length; i++){
						$("#tb_cart").html(function(idx, oldHtml) {
							var newHtml = "<tr><td>"+
							  "<img class='img-thumbnail' alt=''"+
						  	  "src='${pageContext.request.contextPath}/upload/PROD_MAIN/"+data[i].main_image_name+"'>"+
							  "<h5><a href='${pageContext.request.contextPath}/prod/prodView?prod_no="+data[i].prod.prod_no+"'>"+data[i].prod.prod_name+"</a></h5></tr></td>"+
							  "<tr><td><h5><small>"+data[i].prod.prod_type+"</small></h5></div>"+
							  "<h5 id='id_price_area'>선택수량 :<small>"+data[i].cart_qty+"</small></h5></tr></td>"+
							  "<tr><td><h5 class='price'>"+data[i].cart_qty * data[i].prod.prod_price+" 원</h5>"+
							  "<h5>"+data[i].prod.prod_com+"</h5><hr></tr></td>";
	
							return oldHtml + newHtml;
						})
					}
				}
			}
/* 			console.log(data[0].cart_mem)
 */		}
	}); //ajax
	
});

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var price_arr = document.getElementsByClassName("price");

for (var i = 0; i < price_arr.length; i++) {
	$(price_arr[i]).html(numberWithCommas($(price_arr[i]).html())+"원 ");
}


</script>

