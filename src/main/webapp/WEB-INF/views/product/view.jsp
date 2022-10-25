<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>

.viewpage_wrap {
position : relative;
left : 20%;
margin-top : 5%;
width : 60vw;
height : 100vw;
}

.info_wrap{
position : absolute;
width : 45%;
height : 30%;
left : 55%;
}

.info_wrap div {
	margin : 2%;
}

.piclist_img {
	position: absolute;
	width: 100%;
	height : 100%;
	-webkit-transition: opacity 1s ease-in-out;
      -moz-transition: opacity 1s ease-in-out;
      -o-transition: opacity 1s ease-in-out;
      transition: opacity 1s ease-in-out;
      opacity: 0;
      -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
      filter: alpha(opacity=0);
}

.piclist_wrap {

}
.piclist_hidden {
	float : left;
	width: 50%;
	height: 30%;
	overflow: hidden;
	position : relative;
}

.page-nav {
  width: 100%;
  color: white;
  top: 40%;
  position: absolute;
  z-index: 2;
  font-size: 60px;
}

.page-nav .prev {
  float: left;
  cursor : pointer;
  color : white;
}

.page-nav .next {
  float: right;
  cursor : pointer;
  color : white;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready( function() {
	var first = $('.piclist_wrap').children('img:eq(0)');
	first.attr('id','index');
	$("#index").css("opacity",1);
});

var imgLen = ${piccount}-1;


function next() {
	var imgLen = ${piccount}-1;
	var index = $("#index").index();
	
	if(index != imgLen){
		var next = index + 1;
	}else{
		var next = 0;
	}
	
	$("#index").css("opacity",0);
	document.querySelector('#index').removeAttribute('id');
	
	nextImg = $(".piclist_wrap").children().eq(next);
	nextImg.attr('id','index');
	$("#index").css("opacity",1);


};

function prev() {
	var imgLen = ${piccount}-1;
	var index = $("#index").index();
	
	if(index != 0){	
		var prev = index -1;
	}else{
		var prev = imgLen;
	}
	
	
	$("#index").css("opacity",0);
	document.querySelector('#index').removeAttribute('id');
	
	nextImg = $(".piclist_wrap").children().eq(prev);
	nextImg.attr('id','index');
	$("#index").css("opacity",1);
	
};


</script>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div class = "viewpage_wrap">
	<div class="piclist_hidden">
		<div class="piclist_wrap">
			<c:forEach items="${piclist}" var="pic">
				
					<img class="piclist_img" src="../../resources/img/${pic.picture_path}/${pic.picture_name}">
				
			</c:forEach>
		</div>

		<div class="page-nav">
			<a onclick ="prev()" class ="prev"> < </a>
			<a onclick ="next()" class="next"> > </a>
		</div>
	</div>
	
	<div class = "info_wrap">
		<div class ="memberinfo">${productView.user_id}님의 경매 횟수</div>
		<div class = "title"><H1>${productView.title}</H1></div>
		<div class = "startPrice"><h2>${productView.start_price}</h2></div>
		<div class = "currentPrice"><h2>${productView.current_price}</h2></div>
		<div class = "remaining_time">${productView.date}남은시간체킹</div>
	</div>
	
	</div>
</body>
</html>
