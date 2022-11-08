<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
main{
	width : 70%;
	height : 50vw;
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



.login_wrap {
	min-width : 600px;
	min-height : 700px;
	width : 50%;
	height : 70%;
	margin : 0 auto;
}

/*top*/
.login_top {
	width : 50%;
	height : 20%;
	margin : 0 auto;
	font-weight: 700;
	font-size : 32px;
	color : #575757;
}

.login_top p{
	margin : 0 auto;
	text-align : center;
	margin-top : 20%;
	padding-top : 20%;
}


/*center*/
.login_center{
	width : 100%;
	height : 60%;
	color : #666;
}
.input_box1{
	width : 100%;
	height : 30%;
}
.input_box2{
	width : 100%;
	height : 30%;
}

.login_center_form{
	width : 100%;
	height : 100%;
}

/*center*/
.login_bottom{

	width : 80%;
	height : 20%;
	margin:0 auto;
}
.login_bottom button{
	background-color : #FD9001;
	width : 100%;
	height : 100%;
	margin-top : 5%;
	font-size : 18px;
	font-weight: 700;
	color : white;
	border : 1px solid #EEE;
}

</style>
<meta charset="utf-8">
<title>로그인</title>
</head>

<body>
<main>
	<div class="login_wrap">
		<div class = "login_top"><p>회원 로그인</p>
		</div>
		<div class = "login_center">
		<form action="loginb" method="post" class = "login_center_form">
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
			<div class ="login_bottom">
				<button type="submit">로그인</button>
			</div>
		</form>
		</div>
		<c:if test="${!empty login_message}">
			<script>
				alert("${login_message}")
			</script>
		</c:if>
	</div>
</main>	
</body>
</html>