<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main {

width : 70%;
height : 50vw;
margin: 0 auto;
min-width : 900px;
min-height : 900px;
}

.resign_wrap {
	width : 100%;
	height : 100%;
	
}

.resign_top_wrap {
	width : 100%;
	height : 5%;	
	margin : 0 auto;
	font-weight: 700;
	font-size : 32px;
	color : #575757;
}

.resign_top_wrap p{
	margin : 0 auto;
	text-align : center;
	padding-top : 15%;
}

.resign_center_wrap{
	width: 100%;
	height : 90%;
}
.center_wrap_des{
	width : 100%;
	height : 20%;
	margin : 0 auto;
	text-align : center;
	padding-top : 20%;
	font-size: 18px;
	font-weight: 700;
	color: #222;
	padding-bottom : 0px;
}
.input_box1{
	width : 100%;
	height : 25%;
}

.input_box_title{
	margin : 0 auto;
	width : 60%;
	height : 20%;
	font-size: 15px;
	    color: #888;
}
.input_box_des{
	margin : 0 auto;
	width : 60%;
	height : 30%;
	
}
.input_box_des input{
	width : 100%;
	height : 100%;	
	border-style : none;
	border-bottom: 1px solid #e1e1e1;
}
.input_box_des input:focus{
	outline : none;
	transition: all .25s ease;
	border-bottom : 3px solid #FF9614;
}
.input_box_des input:valid{

	border-bottom : 3px solid #FF9614;
}

.submit_box{
	width : 50%;
	height : 20%;
	margin: 0 auto;
}
.resign_submit_button{
	background-color : #FD9001;
	width : 100%;
	height : 50%;
	margin-top : 5%;
	font-size : 18px;
	font-weight: 700;
	color : white;
	border : 1px solid #EEE;
	text-align: center;
	line-height : 80px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$( function(){
	$( '.resign_submit_button' ).on("click", function() {
		var flag=confirm("정말로 탈퇴하시겠습니까?");
		if (flag){
			window.location.href='../member/resignb';
		}
	});
}
</script>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
</head>
<body>
<main>
	<div class = "resign_wrap">
		<div class = "resign_top_wrap">
			<p>회원 탈퇴</p>
		</div>
		<div class = "resign_center_wrap">
			<div class ="center_wrap_des">
				<p> ${mVo.user_id} 님 탈퇴 하시겠습니까?</p>
			</div>
			<div class="input_box1">
				<div class = "input_box_des"><input type="password" name="pw" required placeholder ="비밀번호"></div>		
			</div>
			<div class="submit_box">
				<div class= "resign_submit_button">회원 탈퇴</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>