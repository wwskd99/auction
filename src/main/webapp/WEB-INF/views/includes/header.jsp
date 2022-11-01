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
 width : 100vw;
 
}

header {
position : fixed;
z-index : 3;
width : 100vw;
height : 70px;
min-width : 1000px;
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

width : 25%;
float : left;
color : #ff6f0f;

}

.chat_list{

width : 25%;
float : left;

}

.header_wrap a {
cursor : pointer;
}

.myPage_list_dropDown{
	position : relative;
	 display : inline-block;
	 width : 30%;
	float : right;
	
	 
}

.dropDown_list{
	z-index : 5;
	position : absolute;
	display : none;
	background-color : white;
	min-width : 300px;
}

.dropDown_list a{
	display : block;
	background-color : white;

}

.myPage_list_dropDown:hover .dropDown_list {
  display: block;
}


</style>




<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$( function(){
	$( '.logo_image_div' ).on("click", function() {
		window.location.href='../main';
	});
});


$(function () {
	var didScroll;
    var lastScrollTop = 0;
    var delta = 5; // 이벤트를 발생시킬 스크롤의 이동 범위
    var navbarHeight = $("header").outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250); // 스크롤이 멈춘 후 동작이 실행되기 까지의 딜레이

    function hasScrolled() {
        var st = $(this).scrollTop(); // 현재 window의 scrollTop 값

        // delta로 설정한 값보다 많이 스크롤 되어야 실행된다.
        if(Math.abs(lastScrollTop - st) <= delta)
            return;

        if (st > lastScrollTop && st > navbarHeight){
            // 스크롤을 내렸을 때
            $("header").slideUp("fast"); // header 숨기기
        } else {
            // 스크롤을 올렸을 때
            if(st + $(window).height() < $(document).height()) {
                $("header").slideDown("fast"); // header 보이기
            }
        }

        lastScrollTop = st; // 현재 멈춘 위치를 기준점으로 재설정
    }
})
</script>
<meta charset="UTF-8">
<title>${productView.title}</title>
</head>
<header>
<div class = "header_wrap">
	<div class = "logo">
		<div class = "logo_image_div"><a>로고크기이미지</a></div>
	</div>
	<div class = "product_list"><a href="/product/list">중고 거래</a></div>
	<div class = "chat_list"><a>채팅</a></div>
	<div class = "myPage_list_dropDown">
		<a class = "myPage_a">마이페이지</a>
			<div class = "dropDown_list">
				<div><a>로그인</a></div>
				<div><a>회원가입</a></div>
			</div>
	</div>

</div>
</header>
</html>