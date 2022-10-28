<%@page import="org.zerock.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

body{

margin : 0 auto;
padding-top : 70px;
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

main{
 width : 100%;
 
}

header {
position : fixed;
z-index : 3;
width : 100vw;
height : 70px;
min-width : 900px;
font-weight: 700;
font-size: 1.1rem;
color : #393a40;
background-color : white;
transition: top 0.01s ease-in-out;
margin-top : -70px;
}

.header_wrap{

margin : 0 auto;
width : 70%;
height : 100%;

}


.header_wrap div{
line-height : 70px;
text-align : center;
height : 70px;

}



.logo{

width : 20%;
float : left;

}

.product_list{

width : 30%;
float : left;
color : #ff6f0f;

}

.chat_list{

width : 30%;
float : left;

}

.header_wrap a {
cursor : pointer;
}

.myPage_list_dropDown{
	position : relative;
	 display : inline-block;
	 width : 20%;
	float : right;
		
}

.dropDown_list{
	z-index : 5;
	position : absolute;
	display : none;
	background-color : white;
	width : 100%;

}

.dropDown_list a{
	display : block;
	background-color : white;

}
.dropDown_list a:hover{
background-color : #ececec;
}

.myPage_list_dropDown:hover .dropDown_list {
  display: block;
 
}

.dropDown_list div{
	width : 100%;
}

</style>




<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function () {
$(window).scroll(function(){
	  $('header').css('left', 0-$(this).scrollLeft());
	});
});	

$( function(){
	$( '.logo_image_click' ).on("click", function() {
		window.location.href='../main';
	});
	
	$( '.product_list_click' ).on("click", function() {
		window.location.href='../product/list';
	});
	
	$( '.chat_list_click' ).on("click", function() {
		window.location.href='../chatting/room';
	});
	$( '.myPage_login_click' ).on("click", function() {
		window.location.href='../member/login';
	});
	
	$( '.myPage_join_click' ).on("click", function() {
		window.location.href='../member/join';
	});
	
	$( '.myPage_bid_click' ).on("click", function() {
		window.location.href='../info/bid';
	});
	$( '.myPage_resign_click' ).on("click", function() {
		window.location.href='../member/resign';
	});
	
	
});


$(function () {
	var didScroll;
    var lastScrollTop = 0;
    var delta = 5; 
    var navbarHeight = $("header").outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250); 

    function hasScrolled() {
        var st = $(this).scrollTop(); 

        
        if(Math.abs(lastScrollTop - st) <= delta)
            return;

        if (st > lastScrollTop && st > navbarHeight){
          
            $("header").slideUp("fast");
        } else {
           
            if(st + $(window).height() < $(document).height()) {
                $("header").slideDown("fast"); 
            }
        }

        lastScrollTop = st;
    }
})

$(document).ready( function() {
	var mVo = "<%=(MemberVO)session.getAttribute("sessionMember")%>";
	if(mVo == "null"){
		 $(".chat_list").hide();
	}
	
	
	if(mVo != "null"){
		$(".myPage_login").attr('id','myPage_logout');
		document.querySelector('.myPage_login').removeAttribute('class');
		$(".myPage_login_click").text("로그아웃");
		$(".myPage_login_click").attr('id','myPage_logout_click');
		document.querySelector('.myPage_login_click').removeAttribute('class');
		
		$(".myPage_join").attr('id','myPage_update');
		document.querySelector('.myPage_join').removeAttribute('class');
		$(".myPage_join_click").text("회원 정보 수정");
		$(".myPage_join_click").attr('id','myPage_update_click');
		document.querySelector('.myPage_join_click').removeAttribute('class');
		
		$('#myPage_update').css('background-color', 'white');
		
		$( '#myPage_logout_click' ).on("click", function() {
			window.location.href='../member/logout';
		});
		
		$( '#myPage_update_click' ).on("click", function() {
			window.location.href='../member/update';
		});
	
	}else{
		$("#total_bid_list").hide();
		$("#myPage_resign").hide();
	}
});




</script>

<meta charset="UTF-8">
</head>
<header>
<div class = "header_wrap">
	<div class = "logo">
		<div class = "logo_image_div"><a class = "logo_image_click"><img src = "../../resources/img/main/logo.png" alt ="ㅇㅇ"></a></div>
	</div>
	<div class = "product_list"><a class = "product_list_click">중고 거래</a></div>
	<div class = "chat_list"><a class = "chat_list_click">채팅</a></div>
	<div class = "myPage_list_dropDown">
		<a class = "myPage_a">마이페이지</a>
			<div class = "dropDown_list">
				<div class = "myPage_login"><a class = "myPage_login_click">로그인</a></div>
				<div class = "myPage_join"><a class = "myPage_join_click">회원 가입</a></div>
				<div id = "total_bid_list"><a class = "myPage_bid_click">통합 경매 내역</a></div>
				<div id = "myPage_resign"><a class = "myPage_resign_click">회원 탈퇴</a></div>
			</div>
	</div>

</div>
</header>
</html>