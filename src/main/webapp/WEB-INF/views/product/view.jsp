<%@page import="org.zerock.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main {

}
.viewpage_wrap {
margin: 0 auto;
position : relative;
width : 70%;
min-width : 1000px;
height : 50vw;
min-height : 700px;
overflow : visible;
}

.info_wrap{
position : relative;
width : 50%;
height : 100%;
font-size : 1rem;
float : left;
}

.info_wrap div {
	left : 5%;
}

.memberinfo {
	font-size : 1.0em;
	color : #6c757d;
	width : 95%;
	height : 5%;
	padding-bottom: 1%;
	position : absolute;
	border-bottom : 1px solid #E4E4E4;
}
.title {
	text-align : left;
	font-weight : 600;
	font-size : 1.4em;
	height : 10%;
	top : 9%;	
	position : absolute;
	width : 95%;
	padding-top : 1%;
	padding-bottom : 1%;
	border-bottom : 1px solid #E4E4E4;
}
.startPrice {
	padding-top : 1%;
	height : 8%;
	top : 25%;
	position : absolute;
	width : 95%;
	color : #343a40;
	font-size : 1.1em;
	font-weight : 500;
}
.currentPrice {
	height : 8%;
	top : 33%;
	position : absolute;
	width : 95%;
	color : #343a40;
	font-size : 1.1em;
	font-weight : 500;
}

.bid_unit{
height : 8%;
top : 40%;
position : absolute;
width : 95%;
color : #343a40;
color : #343a40;
	font-size : 1.1em;
	font-weight : 500;
	padding-bottom : 1%;
	border-bottom : 1px solid #E4E4E4;

}

.remainDate{
	height : 10%;
	top : 54%;
	position : absolute;
	width : 95%;
	font-size : 1.4em;
	font-weight : 700;
	padding-bottom : 1%;
	border-bottom : 1px solid #E4E4E4;
}
.bidTotal{
	top : 70%;
	height : 30%;
	position : absolute;
	width : 95%;
}

#bidCheck{
	font-size : 1.3em;
	text-align : center;
	width : 100%;
	border-top : none;
	border-left : none;
	border-right : none;
	border-bottom : 3px solid;

}
.bidTextBoxWrap{
	position : absolute;
	width : 95%;
	height : 50%;
	top : 12%;
}

.bidTextBoxUp{
	font-size : 1.5em;
	margin-left : 2%;
	width : 5%;
	height : 100%;
	float : left;
	cursor : pointer;
}
.bidTextBoxDown{
	font-size : 1.5em;
	width : 5%;
	height : 100%;
	left : 75%;
	float : left;	
	cursor : pointer;
}
.bidTextBox{

	width : 50%;
	height : 100%;
	left : 50%;
	float : left;
}

.bidButton {
	border-radius: 10px;
	text-align : center;
	line-height : 230%;
	background-color : black;
	color : white;
	font-size : 1.3em;
	font-weight : 600;
	position : absolute;
	width : 60%;
	height : 35%;
	top : 55%;
	cursor : pointer;
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
   border-radius: 20px;
}

.piclist_wrap {
width : 100%;
height : 100%;
}

.viewpage_wrap_top {
width : 100%;
height : 60%;
position : absolute;
top : 3%;
padding-top : 1%;
padding-bottom : 1%;
border-top: solid	 1px #E4E4E4;
border-bottom: solid	 1px #E4E4E4;
}
.viewpage_wrap_bottom {
width : 100%;
height : 40%;
position : absolute;
top :65%;

}
.piclist_hidden {
	float : left;
	width: 50%;
	height: 100%;
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

.desc_wrap {
  height : 100%;
  clear:both;
  padding-top : 2%;
}
.desc_title {
 font-size : 1.3em;
 
 
	font-weight : 600;
	padding-bottom : 2%;
	border-bottom : 1px solid #E4E4E4;
	
}

.desc {
	margin-top : 2%;
	padding-bottom : 2%;
	border-bottom : 1px solid #E4E4E4;
	
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
// 시작시, 슬라이드위한
$(document).ready( function() {
	
	// 슬라이드
	var first = $('.piclist_wrap').children('img:eq(0)');
	first.attr('id','index');
	$("#index").css("opacity",1);
	

});


var imgLen = ${piccount}-1;

//사진 다음버튼
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


}

// 사진 이전버튼
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
	
}

//남은시간 함수
function remainTime() {
	
	var currentDate = new Date();
	var regDate = new Date(${regDate});
	var endDate = new Date(${regDate});
	endDate.setDate(endDate.getDate() + 3);
	
	var currentTime = currentDate.getTime();
	var endTime = endDate.getTime();
	
	if(currentTime < endTime){
		
		var sec = parseInt(endTime - currentTime) / 1000;  
		var day = parseInt(sec/60/60/24);
		sec = sec - day*60*60*24;
		var hour = parseInt(sec/60/60);
		sec = sec - hour*60*60;
		var min = parseInt(sec/60);
		sec = parseInt(sec - min*60);
		
		var sDay = String(day);
		var sHour = String(hour);
		var sMin = String(min);
		var sSec = String(sec);
		
		var remainTime = '남은시간 : ' + sDay + '일 ' + sHour + '시간 ' + sMin + '분 ' + sSec + '초';
		
		$(".remainTime").html(remainTime);
		
		}else{
			
			clearInterval(interval);
			createChat();	
			
			var mVo = "<%=(String)session.getAttribute("sessionUser")%>";
			var currentUser = "";
			$.ajax({
		  	 	url : "currentPriceUserId", 
		   		type : 'POST', 
		     	data : {'product_id':product_id},
		     	dataType : 'text', 
		     	success : function(data) {
		     		currentUser = data;
		     	}, 
		   		error : function(xhr, status) {
		 			
		   		}
			})
			
		
			if (mVo == currentUser || mVo == "${ProductView.user_id}"){
				
				$(".bidButton").text("채팅방 들어가기");
				$(".bidButton").attr('class','joinChat');
				$( '.joinChat' ).css("text-align","center")
					.css("border-radius","10px")
					.css("line-height" , "230%")
					.css("background-color" , "black")
					.css("color" , "white")
					.css("font-size" , "1.3em")
					.css("font-weight" , "600")
					.css("position" , "absolute")
					.css("width" , "60%")
					.css("height" , "35%")
					.css("top" , "55%")
					.css("cursor", "pointer");
		
			}
	
	}
}




function createChat() {
	var roomName = "${productView.title}";
	var product_id = ${productView.product_id};
	var seller = "${productView.user_id}";
	var buyer = "";
	
	$.ajax({
  	 	url : "currentPriceUserId", 
   		type : 'POST', 
     	data : {'product_id':product_id},
     	dataType : 'text', 
     	success : function(data) {
     		buyer = data;
     		
     	//	inner ajax
     		$.ajax({
     	  	 	url : "/chatting/createRoom.json", 
     	   		type : 'POST', 
     	     	data : {'product_id':product_id, 'buyer' : buyer, 'seller' : seller , 'roomName' : roomName}, 
     	     	success : function(data) {
     	     		alert("성공");
     	   	 	}, 
     	   		error : function(xhr, status) {
     	    		
     	   		}
     		});
  		// inner ajax
  		
  		
   	 	}, 
   		error : function(xhr, status) {
 			
   		}
	})
}

// 남은 시작시 + 반복
$(document).ready( function() {
	var currentDate = new Date();
	var regDate = new Date(${regDate});
	var endDate = new Date(${regDate});
	endDate.setDate(endDate.getDate() + 3);
	
	var currentTime = currentDate.getTime();
	var endTime = endDate.getTime();
	
	// 마감X
	if(currentTime < endTime){
		
		//타이머 스타트, 인터벌
		remainTime();
		var interval = setInterval(remainTime,1000);
		
		//세션
		var mVo = "<%=(MemberVO)session.getAttribute("sessionMember")%>";
		
		//로그인 x시	
		if(mVo == "null"){
			 $(".bidButton").text("로그인 후 이용해주세요");
			 $(".bidButton").attr('class','requestLogin');
			 
				$( '.requestLogin' ).css("text-align","center")
				.css("border-radius","10px")
				.css("line-height" , "230%")
				.css("background-color" , "black")
				.css("color" , "white")
				.css("font-size" , "1.3em")
				.css("font-weight" , "600")
				.css("position" , "absolute")
				.css("width" , "60%")
				.css("height" , "35%")
				.css("top" , "55%")
				.css("cursor", "pointer");
		}
		
	// 마감 O
	} else {
		
		var mVo = "<%=(String)session.getAttribute("sessionUser")%>";
		if (mVo == "${currentPriceUser}" || mVo == "${ProductView.user_id}"){
			
			$(".bidButton").text("채팅방 들어가기");
			$(".bidButton").attr('class','joinChat');
			$( '.joinChat' ).css("text-align","center")
				.css("border-radius","10px")
				.css("line-height" , "230%")
				.css("background-color" , "black")
				.css("color" , "white")
				.css("font-size" , "1.3em")
				.css("font-weight" , "600")
				.css("position" , "absolute")
				.css("width" , "60%")
				.css("height" , "35%")
				.css("top" , "55%")
				.css("cursor", "pointer");
		} else {
			
			$(".bidButton").text("마감");
			$(".bidButton").attr('class','notMatch');
			$( '.notMatch' ).css("text-align","center")
				.css("border-radius","10px")
				.css("line-height" , "230%")
				.css("background-color" , "black")
				.css("color" , "white")
				.css("font-size" , "1.3em")
				.css("font-weight" , "600")
				.css("position" , "absolute")
				.css("width" , "60%")
				.css("height" , "35%")
				.css("top" , "55%")
				.css("cursor", "pointer");
			
		}
	}
	
});

$( function(){
	$(".joinChat").on("click", function(){
		
		window.location.href='../chatting/room';
		
	});
});

$( function(){
	$( '.requestLogin' ).on("click", function() {
		window.location.href='../member/login';
	});
});


// 텍스트박스 +버튼
$( function(){
	$(".bidTextBoxUp").on("click", function(){
		
		var bidTextBox = parseInt(document.getElementById('bidCheck').value);
		
		if (bidTextBox == 0){
			if(${productView.current_price == 0}){
				bidTextBox = ${productView.start_price};			
			} else {
				bidTextBox = ${productView.current_price};
			}
		}
		
		
		if(bidTextBox < 10000 && bidTextBox >= 1000){
			bidTextBox = bidTextBox + 100;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 50000 && bidTextBox >= 10000){
			bidTextBox = bidTextBox + 500;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 100000 && bidTextBox >= 50000){
			bidTextBox = bidTextBox + 1000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 500000 && bidTextBox >= 100000){
			bidTextBox = bidTextBox + 5000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 1000000 && bidTextBox >= 500000){
			bidTextBox = bidTextBox + 10000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else {
			bidTextBox = bidTextBox + 100000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		}	
	});
});


//텍스트박스 -버튼
$( function(){
	$(".bidTextBoxDown").on("click", function(){
		var bidTextBox = parseInt(document.getElementById('bidCheck').value);
		
		if (bidTextBox == 0){
			if(${productView.current_price == 0}){
				bidTextBox = ${productView.start_price};			
			} else {
				bidTextBox = ${productView.current_price};
			}
		}
		
		if(bidTextBox < 10000 && bidTextBox >= 1000){
			bidTextBox = bidTextBox - 100;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 50000 && bidTextBox >= 10000){
			bidTextBox = bidTextBox - 500;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 100000 && bidTextBox >= 50000){
			bidTextBox = bidTextBox - 1000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 500000 && bidTextBox >= 100000){
			bidTextBox = bidTextBox - 5000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else if (bidTextBox < 1000000 && bidTextBox >= 500000){
			bidTextBox = bidTextBox - 10000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		} else {
			bidTextBox = bidTextBox - 100000;
			document.getElementById('bidCheck').setAttribute('value',bidTextBox)
		}			
	});
});

// form ajax submit

$( function(){
	$(".bidButton").on("click", function(){
		var current_price = ${productView.current_price};
		var start_price = ${productView.start_price};
		var bid = parseInt(document.getElementById('bidCheck').value);		
	
		var sessionUser = "<%=session.getAttribute("sessionUser")%>";
		var user = "${currentPriceUser}";
		
		if(sessionUser == "${productView.user_id}"){
			
			alert("자신의 경매물품에는 입찰할 수 없습니다.");
			
		} else if (sessionUser != user) {
			
			if(bid <= start_price){
			
				alert ("입찰 가격이 경매 시작가보다 같거나 낮습니다. 더 높게 입찰해주세요");
			
			} else if(bid <= current_price) {
			
				alert ("입찰 가격이 현재 최고 입찰가보다 같거나 낮습니다. 더 높게 입찰해주세요");
			
			} else {
				var bid = parseInt(document.getElementById('bidCheck').value);
				var product_id = ${productView.product_id};
				$.ajax({
	         	   url : "currentPrice", 
	          	  type : 'POST', 
	            	data : {'current_price':bid, 'product_id':product_id},
	            	dataType : 'json',
	            	success : function(data) {
	            	//	var a = "현재 가격 : " + data;
	             	//   $("#currentPriceH2").text(a);
	              	  location.reload();
	          	  }, 
	          	  error : function(xhr, status) {
	           	    alert("에러");
	          	  }
	       	 });

			}
		
		}else if(sessionUser == user) {
			
			alert("이미 최상위 입찰자입니다.");			
			
		}

	});
});

$(document).ready( function bidUnit(){
	var bidTextBox = 0;
	var bid_unit = 0;
	if (bidTextBox == 0){
		if(${productView.current_price == 0}){
			bidTextBox = ${productView.start_price};			
		} else {
			bidTextBox = ${productView.current_price};
		}
	}
	
	if(bidTextBox < 10000 && bidTextBox >= 1000){
		bid_unit = 100;
	} else if (bidTextBox < 50000 && bidTextBox >= 10000){
		bid_unit = 500;
	} else if (bidTextBox < 100000 && bidTextBox >= 50000){
		bid_unit = 1000;
	} else if (bidTextBox < 500000 && bidTextBox >= 100000){
		bid_unit = 5000;
	} else if (bidTextBox < 1000000 && bidTextBox >= 500000){
		bid_unit = 10000;
	} else {
		bid_unit = 100000;
	}	
	
	 $(".bid_unit").text("호가단위 : " + bid_unit + "원");
});

</script>


<meta charset="UTF-8">
<title>${productView.title}</title>
</head>
<body>
	<main>
	<div class = "viewpage_wrap">
	
	<div class = "viewpage_wrap_top">
	<div class="piclist_hidden">
		<div class="piclist_wrap">
			<c:forEach items="${piclist}" var="pic">
				
					<img class="piclist_img" src="/productUpload/${pic.picture_name}">
				
			</c:forEach>
		</div>

		<div class="page-nav">
			<a onclick ="prev()" class ="prev"> < </a>
			<a onclick ="next()" class="next"> > </a>
		</div>
	</div>
	
	<div class = "info_wrap">
		<div class ="memberinfo">${productView.user_id}님의 경매 횟수</div>
		<div class = "title">${productView.title}</div>
		<div class = "startPrice">시작가 : ${productView.start_price}원</div>
		<div class = "currentPrice"><a id = "currentPriceH2">현재가 : ${productView.current_price}원</a></div>
		<div class = "bid_unit"></div>
		<div class = "remainDate"><a class = "remainTime"></a></div>
 		<div class = "bidTotal">
 			<div class = "bidTextBoxWrap">
 				<div class = "bidTextBoxDown">-</div>
 				<div class = "bidTextBox">
 					<form id = "bidSubmit">
 					<input id = "bidCheck" readonly value = "0">
 					</form>
 				</div>
 				<div class = "bidTextBoxUp">+</div>
 			</div>
 			<div class = "bidButton">입찰 하기</div>
 		</div>
	</div>
	</div>
	<div class = "viewpage_wrap_bottom">
	<div class = "desc_wrap">
		<div class = "desc_title"> 물품 정보 </div>
		<div class = "desc">${productView.description}</div>
	</div>
	</div>
	</div>
	</main>
</body>
</html>
