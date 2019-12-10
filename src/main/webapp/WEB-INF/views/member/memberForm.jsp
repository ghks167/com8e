<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/WEB-INF/inc/common_header.jsp"%>
   	<title></title>
   	<style type="text/css">
   		#id_submit_btn{
   			float: right;
   		
   		}
   	
   	
   	</style>
  </head>
<body>
    <div class="container">
    	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
    	<h3>회원가입</h3>
    	<hr>
    	<div class="cls_div_main_form row">
    		<form:form action="memberRegist" commandName="member">
    			<table class="table table-striped">
    				
    				<tr>
    					<th>
    						아이디 :
    					</th>
    					<td>
    						 <form:input path="mem_id"/>
    					</td>
    					
    					<th>
    						비밀번호 :
    					</th>
    					<td>
    						 <form:password path="mem_pass"/>
    					</td>
    				</tr>
    				
    				
    				<tr>
    					<th>
    						이름 :
    					</th>
    					<td>
    						 <form:input path="mem_name"/>	
    					</td>
    				</tr>
    				
    				<tr>
    					<th>
    						주민번호 :
    					</th>
    					<td>
    						 <form:input path="mem_regno1"/> - <form:input path="mem_regno2"/>
    					</td>
    					<th>
    						전화번호 :
    					</th>
    					<td>
    						<form:input path="mem_hp"/>
    					</td>
    				</tr>
    				
    				<tr>
    					<th>
    						생년월일 : 
    					</th>
    					<td>
    						<input type="date" name="mem_bir">
    					</td>
    				</tr>
    				
    				<tr>
    					<th>
    						주소 :
    					</th>
    					<td>
    						<form:input path="mem_addr"/>
    					</td>
    				</tr>
    			</table>
    			<a href="${pageContext.request.contextPath}/" class="btn btn-default">홈으로</a>
   				<input type="submit" id="id_submit_btn" class="btn btn-success" value="회원가입"/>
    		</form:form>
    	</div>	
    	<%@include file="/WEB-INF/inc/common_footer.jsp" %>
    </div>
  </body>
 
 <script type="text/javascript">
 	
 	
 </script>

</html>