<%@page import="org.zerock.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>

.viewpage_wrap {
position : relative;
left : 20%;
width : 70%;
min-width : 1000px;
height : 100vw;
min-height : 1000px;
}

.info_wrap{
position : absolute;
width : 50%;
height : 50%;
left : 50%;
font-size : 1rem;
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

.desc_wrap {
  clear:both;
  padding-top : 5%;
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
	
	var mVo = "<%=(MemberVO)session.getAttribute("sessionMember")%>";
	console.log(mVo);
	
	if(mVo == "null"){
		 $(".bidButton").text("로그인 후 이용해주세요");
		 $(".bidButton").attr('class','requestLogin');
	}
	
});

$( function(){
	$( '.requestLogin' ).on("click", function() {
		window.location.href='../member/login';
	});
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
	endDate.setDate(endDate.getDate() + 30);
	
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
		
	}
	
}

// 남은 시작시 + 반복
$(document).ready( function() {
	remainTime();
});
setInterval(remainTime,1000);


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

		if(sessionUser != user){
					
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
	
	 $(".bid_unit").text("호가단위 : " + bid_unit);
});
</script>


<meta charset="UTF-8">
<title>${productView.title}</title>
</head>
<body>
	<main>
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
		<div class = "title">${productView.title}</div>
		<div class = "startPrice">시작 가격 : ${productView.start_price}</div>
		<div class = "currentPrice"><h2 id = "currentPriceH2">현재 가격 : ${productView.current_price}</h2></div>
		<div class = "bid_unit"></div>
		<div class = "remainDate"><h3 class = "remainTime"></h3></div>
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
	
	<div class = "desc_wrap">
		<div class = "desc">${productView.description}</div>
	</div>
	</div>
	</main>
</body>
</html>