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
	min-width : 900px;
	min-height : 900px;
}


.update_top_wrap{
	width : 100%;
	height : 15%;	
	margin : 0 auto;
	font-weight: 700;
	font-size : 32px;
	color : #575757;

}

.update_top_wrap p{
	margin : 0 auto;
	text-align : center;
	padding-top : 5%;
}

.update_center_wrap {
	width : 100%;
	height : 85%;
}
.update_center_wrap_form {
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
.submit_box {
	width : 100%;
	height : 15%;
}

.input_box_title {
	width : 20%;
	height : 100%;
	float : left;
}

.input_box_des{
	width : 50%;
	height : 100%;
	float : left;
}

.input_box_title p{
	font-size: 18px;
    font-weight: 700;
    padding-top :50px;
    padding-bottom : 20px;
    margin : 0px;
}

.input_box1 .input_box_des input, .input_box3 .input_box_des input{
	margin-top : 30px;
	font-size: 15px;
	width : 100%;
	height : 50%;
	border-style : none;
	border-bottom: 1px solid #e1e1e1;
	
}

.input_box2 .input_box_des input,.input_box4 .input_box_des input,.input_box5 .input_box_des input{
	margin-top : 30px;
	font-size: 15px;
	width : 100%;
	height : 50%;
	border-style : none;
	border-bottom: 1px solid #e1e1e1;
	
}

.input_box1 .input_box_des input:focus, .input_box3 .input_box_des input:focus{
	outline : none;
}

.input_box2 .input_box_des input:focus,.input_box4 .input_box_des input:focus,.input_box5 .input_box_des input:focus{
	outline : none;
	transition: all .25s ease;
	border-bottom : 3px solid #FF9614;
}




.submit_box{
	width : 50%;
	height : 20%;
	margin: 0 auto;
}
.update_submit_button{
	background-color : #FD9001;
	width : 100%;
	height : 50%;
	margin-top : 5%;
	font-size : 18px;
	font-weight: 700;
	color : white;
	border : 1px solid #EEE;
}

.input_box_x{
	width : 10%;
	height : 100%;
	float : left;
	padding-left : 20px;
	line-height : 130px;
	color : red;
}

</style>
<meta charset="UTF-8">
<title>회원정보 변경</title>
</head>
<body>
<main>
	<div class = "update_top_wrap">
		<p>회원 정보 변경</p>
	</div>
	
	<div class = "update_center_wrap">
		<form action="updateb" method="post" class = "update_center_wrap_form">
			<div class="input_box1">
				<div class = "input_box_title"><p>이름</p></div>
				<div class = "input_box_des"><input class = "readonly_box" type="text" name="name" value = "${mVo.name}" readonly ></div>	
				<div class = "input_box_x">변경 불가</div>	
			</div>
			<div class="input_box2">
				<div class = "input_box_title"><p>휴대폰</p></div>
				<div class = "input_box_des"><input type="tel" name="phone" required value = "${mVo.phone}" placeholder="예: 010-1107-1107" class = "update_box"></div>		
			</div>
			<div class="input_box3">
				<div class = "input_box_title"><p>아이디</p></div>
				<div class = "input_box_des"><input type="text" name="user_id" value = "${mVo.user_id}" readonly class = "readonly_box"></div>
				<div class = "input_box_x">변경 불가</div>			
			</div>
			<div class="input_box4">
				<div class = "input_box_title"><p>생년월일</p></div>
				<div class = "input_box_des"><input type="text" name="birth" value = "${mVo.birth}" placeholder="예: 2022-11-07" required class = "update_box"></div>		
			</div>
			<div class="input_box5">
				<div class = "input_box_title"><p>비밀번호</p></div>
				<div class = "input_box_des"><input type="password" name="pw" value = "${mVo.pw}" required class = "update_box"></div>		
			</div>
			<div class="submit_box">
				<button type="submit" class= "update_submit_button">변경 완료</button>
			</div>
		</form>
	</div>

	
		

	<c:if test="${!empty update_message}">
		<script>
			alert("${update_message}")
		</script>
	</c:if>
</main>
</body>
</html>