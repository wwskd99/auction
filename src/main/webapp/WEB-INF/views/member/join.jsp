<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main{
	width : 70%;
	height : 60vw;
	margin : 0 auto;
}


p { 
	margin: 0 auto;
	position:relative;
	width:80%; 
	height:80%; 
}

p input { 
	box-sizing:border-box; 
	padding:50px 0 0; 
	width:100%; 
	height:100%; 
	border:0 none; 
	color:#595f63; 
	outline:none; 
}

placeholder {
	color:#595f63; 
}

p label { 
	position:absolute; 
	left:0%; 
	bottom:0; 
	width:100%; 
	height:100%; 
	border-bottom:1px solid #FF9614; 
	text-align:left; 
	pointer-events:none; 
}

p label:after { 
	content:""; 
	position:absolute; 
	left:0; 
	bottom:-1px; 
	width:0; 
	height:100%; 
	border-bottom:3px solid #FF9614;
	transition:all .3s ease; 
}

p label span { 
	position:absolute; 
	left:0; 
	bottom:5px; 
	transition:all .3s ease; 
}

p input:focus + label span, 
p input:valid + label span { 
	transform:translateY(-200%); 
	font-size:1.0rem; 
	color:#FF9614; 
}  
p input:focus + label::after,
p input:valid + label::after { 
	width:100%; 
	transform:translateX(0); 
}


.join_wrap{
	min-width : 600px;
	min-height : 700px;
	width : 100%;
	height : 100%;
	margin : 0 auto;
}

.join_top_wrap{
	width : 70%;
	height : 10%;
	margin : 0 auto;
	font-weight: 700;
	font-size : 32px;
	color : #575757;
}
.join_top_wrap p{
	margin : 0 auto;
	text-align : center;
	padding-top : 5%;
}
.join_center_wrap{
	width : 100%;
	height : 80%;
	color : #666;
}

.join_center_form{
	width : 100%;
	height : 100%;
}
.input_box1 {
	width : 100%;
	height : 15%;
}
.input_box2 {
	width : 100%;
	height : 15%;
}
.input_box3 {
	width : 100%;
	height : 15%;
}

.input_box4 {
	width : 100%;
	height : 15%;
}
.input_box5 {
	width : 100%;
	height : 15%;
}
.submit_box{
	width : 50%;
	height : 20%;
	margin: 0 auto;
}
.join_submit_button{
	background-color : #FD9001;
	width : 100%;
	height : 50%;
	margin-top : 5%;
	font-size : 18px;
	font-weight: 700;
	color : white;
	border : 1px solid #EEE;
}
</style>
<meta charset="EUC-KR">
<title>회원 가입</title>
</head>
<body>
<main>

	<div class = "join_wrap">
		<div class = "join_top_wrap">
			<p>회원 가입</p>
		</div>
		<div class = "join_center_wrap">
			<form action="joinb" method="post" class= "join_center_form">
				<div class="input_box1">
					<p>
						<input type="text" name="user_id" required>
						<label for="user_id"><span>아이디</span></label>
					</p>
				</div>
				<div class="input_box2">
					<p>
						<input type="password" name="pw" required>
						<label for="pw"><span>비밀번호</span></label>
					</p>
				</div>
				<div class="input_box3">
					<p>
						<input type="text" name="name" required>
						<label for="name"><span>이름 (띄어쓰기 없이 입력하세요)</span></label>
					</p>
				</div>
				<div class="input_box4">
					<p>
						<input type="tel" name="phone" required>
						<label for="phone"><span>전화번호 (예: 010-1107-1107)</span></label>
					</p>
				</div>
				<div class="input_box5">
					<p>
						<input type="text" name="birth" required>
						<label for="birth"><span>생년월일 (예: 2022-11-07)</span></label>
					</p>
				</div>
				<div class="submit_box">
					<button type="submit" class= "join_submit_button">가입 완료</button>
				</div>
			</form>
		</div>
	</div>

	<c:if test="${!empty join_message}">
		<script>
			alert("${join_message}")
		</script>
	</c:if> 

	
</main>	
</body>
</html>