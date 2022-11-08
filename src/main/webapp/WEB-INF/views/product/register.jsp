<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<style>
p { 
	margin: 0 auto;
	position:relative;
	width:80%; 
	height:80%; 
}

p input { 
	box-sizing:border-box; 
	padding:20px 0 0; 
	width:100%; 
	height:100%; 
	border:0 none; 
	color:#595f63; 
	outline:none; 
}

placeholder {
	color:#595f63; 
}

p textarea{
	box-sizing:border-box; 
	padding:20px 0 0; 
	width:100%; 
	height:100%; 
	border:0 none; 
	color:#595f63; 
	outline:none; 
	resize: none;
}

p label { 
	position:absolute; 
	left:0%; 
	bottom:0; 
	width:100%; 
	height:100%; 
	border-bottom:1px solid #000; 
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
	transform:translateY(-150%); 
	font-size:1.0rem; 
	color:#FF9614; 
}  
p input:focus + label::after,
p input:valid + label::after { 
	width:100%; 
	transform:translateX(0); 
}

p textarea:focus + label span, 
p textarea:valid + label span { 
	transform:translateY(-150%); 
	font-size:1.0rem; 
	color:#FF9614;
}  
p textarea:focus + label::after,
p textarea:valid + label::after { 
	width:100%; 
	transform:translateX(0); 
}

main{
width : 100%;
height : 50vw;
}

.main_wrap {
	margin:0 auto;
	width: 70%;
	height : 100%;

}

.register_wrap{
	margin:0 auto;
	width : 70%;
	height : 100%;
	
	position : relative;
}

.product_title{
	width : 100%;
	height: 10%;
	position : absolute;
	top : 5%;
}

.product_start_price{
	width : 100%;
	height: 10%;
	position : absolute;
	top : 20%;
}
.product_description{
	width : 100%;
	height: 40%;

	position : absolute;
	top : 30%;
}
.product_piclist{
	width : 100%;
	height: 15%;
	position : absolute;
	top : 70%;
}

.product_regist_submit{
	width : 100%;
	height : 15%;

	position : absolute;
	top : 85%;
}

.product_regist_form{
	width : 100%;
	height : 100%;
	position : absolute;
}



.imgs_form_input{
	position : absolute;
	left : 10%;
	top : 40%;
}

.imgs_submit{
	position : absolute;
	right : 5%;
	background-color : #FD9001;
	border-radius : 0.25em;
	color : white;
	width : 20%;
	height : 30%;
	text-align : center;
	line-height : 200%;
	cursor : pointer;
	top : 40%;

}

.piclist_div{
	margin-top : 1%;
	margin-left : 10%;
}

.product_5km_check_text{
	position : absolute;
	top : 40%;
	left : 10%;
}

.product_regist_button{
	position : absolute;
	top : 40%;
	right : 5%;
	background-color : #FD6E01;
	width : 20%;
	height : 30%;
	text-align : center;
	line-height : 200%;
	color : white;
	border-radius : 0.25em ;
	border : 1px solid #FD6E01;
}

.product_regist_reset{
	position : absolute;
	left : 50%;
	top : 40%;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready( function() {
	
	// 슬라이드
	var loginUser = "<%=session.getAttribute("sessionUser")%>";
	if(loginUser == "null"){
		alert("잘못된 접근입니다. 로그인을 해주세요.")
		window.location.href='../member/login';
	}
	

});

function success(position){
	var latitude = "<input type = 'hidden' name = 'latitude' value = '" + position.coords.latitude + "'>";
	var longitude = "<input type = 'hidden' name = 'longitude' value = '" + position.coords.longitude + "'>";
	

	$(".product_regist_form").append(latitude);
	$(".product_regist_form").append(longitude);
	
}

function getUserLocation() {
    if (!navigator.geolocation) {
        throw "위치 정보가 지원되지 않습니다.";
    }
    navigator.geolocation.getCurrentPosition(success);
}

getUserLocation();





function imgs_submit(){
	var formData = new FormData();
	var inputFile = $("input[name='uploadImgs']");
	var files = inputFile[0].files;
	for (var i = 0; i < files.length; i++) {
		formData.append("uploadImgs", files[i]);
	}
	

	$.ajax({
		processData : false,
		contentType: false,
		url : '/upload/uploadImages',
		data : formData,
		type : 'POST',
		dataType : 'json', 
		success : function(result) { 
			
			for(var i=0; i < result.length; i++){
				var obj = result[i];
				var a = "<input id = 'img_upload' type='hidden' value='"+obj.picture_name + "' name = 'productPic[" + i + "].picture_name'>";
				var b = "<input type='hidden' value='"+obj.picture_path + "' name = 'productPic[" + i + "].picture_path'>";
				$(".product_regist_form").append(a);
				$(".product_regist_form").append(b);
			}
			
			alert("이미지 등록 완료");

		}
	});
}

function checkForm(){

	
	var start_price = document.getElementById("start_price_input").value;
	if((start_price%1000) != 0){
		
		alert("1,000원 단위 이상으로 입력해 주십시오.");
		
		return false;
		
	} else{
		
		return true;
	}
	
	
}

		
</script>
<meta charset="EUC-KR">
<title>경매 등록</title>
</head>
<body>
<main>

	<div class = "main_wrap">
		<div class = "register_wrap">
			<form class = "product_regist_form" method = "post" action ="../product/register" name = "registproduct" onsubmit="return checkForm()">
			<div class = "product_title">
				<p>
					<input class = "product_title_input" type = "text" name="title" autocomplete="off" required>
					<label for = "title"><span>게시글 제목</span></label>
				</p>
			</div>
			<div class = "product_start_price">
				<p>
					<input type = "text" id = "start_price_input" name="start_price" autocomplete="off" required>
					<label for = "start_price"><span>시작가</span></label>
				</p>
			</div>
					
			<div class = "product_description">
				<p>
					<textarea name="description" autocomplete="off" placeholder = "상품의 상세한 상태를 입력해주세요"></textarea>
					<label for = "description"></label>
				</p>
			</div>	
			
			
			<div class = "product_regist_submit">
	
				<button class = "product_regist_button" type ="submit">게시글 업로드</button>
				<div class = "product_5km_check_text">
					<input class = "product_5km_check" type="checkbox" name = "neighborhood" value ="YES">
					5km 이내 동네 직거래	
				</div>
			</div>
			<input type = "hidden" name ="user_id" value ="${loginUser}">
			</form>
				<div class = "product_piclist">
					<div class = "piclist_div"> 이미지</div>
					<form class = "img_form" action ="../upload/uploadImages" method = "post" enctype="multipart/form-data">
						<div><input class = "imgs_form_input" type = "file" name = "uploadImgs" multiple required></div>
						<div class ="imgs_submit" onclick = "imgs_submit()">이미지 등록</div>
					</form>
				</div>
		</div>	
		
	</div>
</main>
</body>
</html>
