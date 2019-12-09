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
<title></title>
<style>
#id_divLogin {				 
	height: auto;
	width: 100%;
	border: 3px solid black;
}
</style>
</head>
<body>
	<div style="text-align: center" id="id_divLogin">
		<img id="id_logo" src="img/Happy.png"><br> <input
			id="id_id" type="text" value="아이디" style="text-align: center"><br>
		<input id="id_pw" type="text" value="비밀번호" style="text-align: center"><br>
		<input id="id_btn" type="text" value="로그인" style="text-align: center"><br>
		<img id="id_event" src="img/Happy.png"><br> <input
			id="id_home" type="button" value="홈"> <input id="id_searchId"
			type="button" value="아이디 찾기"> <input id="id_searchPw"
			type="button" value="비밀번호 찾기"> <input id="id_join"
			type="button" value="회원가입">
	</div>

	<script>
		var v_id = document.getElementById("id_id");
		var v_pw = document.getElementById("id_pw");
		var v_loginBtn = document.getElementById("id_btn");
		var v_logo = document.getElementById("id_logo");

		v_loginBtn.style.backgroundColor = "skyblue"; // 로그인 텍스트박스 컬러

		
		
		v_logo.onclick = function() {						// 로고눌렀을시 홈으로 이동?
			document.location.href = "index.jsp";
		}

		v_id.onclick = function() {						// 텍스트박스 눌렀을 시 내용 비워주기
			v_id.value = null;
			// if(v_id = null) {
			//     v_id.value = "아이디";

			
			// }
		}
		v_pw.onclick = function() {						// 텍스트박스 눌렀을 시 내용 비워주기
			v_pw.value = null;
			// if() {

			// }
		}
		v_loginBtn.onclick = function() {				// 로그인 버튼 눌렀을 시 화면 이동
			document.location.href = "index.jsp";
		}
		
		
		
	</script>
</html>
