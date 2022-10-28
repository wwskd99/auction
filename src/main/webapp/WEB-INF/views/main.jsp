<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main {
background-color : #FFF1CD;
width : 100vw;
min-width : 900px;
height : 40vw;
}

.main_wrap {
width : 70%;
height : 100%;
position : relative;
margin:0 auto;
}

.main_img_wrap {
width : 50%;
height : 80%;
position : relative;
top : 10%;
margin:0 auto;
float : left;

}

.main_img_wrap img{
position : absolute;
width : 100%;
height : 100%;
}

.main_text_wrap {
height : 100%;
width : 50%;
float : left;
position : relative;

}

.main_text_big_div{
position : absolute;
top : 20%;
font-size : 40px;
font-weight : 1000;
width : 100%;
height : 10%;
text-align: center;
}


.main_text_small_div{
position : absolute;
font-size : 25px;
top : 50%;
width : 100%;
height : 10%;
text-align: center;
}

</style>
<meta charset="EUC-KR">
<title>3RD 중고 마켓</title>
</head>
<body>
	<main>
		<div class = "main_wrap">
			<div class = "main_img_wrap">
			<img src = "../resources/img/main/bid_icon.png">
			</div>
			<div class = "main_text_wrap">
			<div class = "main_text_big_div"><a class = "main_text_big">3rd Market</a></div>
			<div class = "main_text_small_div"><a class = "main_text_small">중고 경매 사이트</a></div>
			</div>
		</div>
	</main>
</body>
</html>