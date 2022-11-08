<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main {
	width: 80vw;
	margin-left: auto;
	margin-right: auto;
}

body {
	font-family: "Muli", sans-serif;
	font-size: 15px;
	line-height: 1.75;
	margin: 0;
	text-align: left;
	background-color: #fff;
	font-weight: 400;
	color: #6c757d;
}

.list_container {
	width: 100%;
	padding-left: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.list_row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	margin-top: 15px;
}

.search-box {
	height: 40px;
	width: 400px;
	border: 1px solid #FFE302;
	background: #fffff;
	margin-bottom: 10px;
}

input {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.btn-square {
	width: 55px;
	height: 40px;
	border: 0px;
	background: #ff8c00;
	outline: none;
	color: #ffffff;
}

.btn-sort {
	float: right;
}

.sort_dis {
	width: auto;
	height: 42px;
	border: 0px;
	background: #ff8c00;
	outline: none;
	color: #ffffff;
}

.sort_price {
	width: auto;
	height: 42px;
	border: 0px;
	background: #ff8c00;
	outline: none;
	color: #ffffff;
}

.sort_new {
	width: auto;
	height: 42px;
	border: 0px;
	background: #ff8c00;
	outline: none;
	color: #ffffff;
}

.pro_wrap {
	justify-content: center !important;
}

.pro_list_wrap {
	position : relative;
	width: 19vw;
	height: auto;
	margin: 3px;
	float: left;
	border: 1px solid #eee;
	transition: all 300ms ease-in-out;
	background: #FFFFFF;

}

.pro_list_wrap:hover {
	background: #ffff49;
	color: #ff8c00;
}



.pro_img {
	width: 100%;
	height: auto;
	border-radius: 5px;
	vertical-align: middle;
	border-style: none;
}

.pic_list {
	flex: 0 0 50%;

}

ul {
	padding-left: 0;
	list-style: none;
	margin-top: 0;
	margin-bottom: 1rem;
}

.title {
	width: 100%;
	float: left;
	list-style: none;
	padding-top: 10px;
	font-size: 20px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.sp10 {
	border: 0;
	width: 1px;
	height: 10px;
	padding: 0;
	clear: both;
}

.start_price1 {
	width: auto;
	float: left;
	list-style: none;
	font-size: 1.0em;
}

.start_price2 {
	width: auto;
	float: right;
	list-style: none;
}

.sp1 {
	border: 0;
	width: 1px;
	height: 1px;
	padding: 0;
	clear: both;
}

.current_price1 {
	width: auto;
	float: left;
	list-style: none;
	font-size: 1.0em;
}

.current_price2 {
	width: auto;
	float: right;
	list-style: none;
}

.pro_buy {
	width: 100%;
}

.buy_btn {
	font-size: 1.0em;
	padding: 6px;
	border-radius: 20px;
	background: #ff8c00;
	border-color: #ff8c00 ! important;
	color: #fff;
	transition: all 0.2s ease-in-out;
	letter-spacing: .5px;
	border: 0.1rem solid transparent;
	text-decoration: none;
}

.buy_btn:hover {
	background: #fff;
	color: black;
}
.gps_icon_des{
	display : none;
	padding-left : 5px;
	font-size : 11px;
	font-weight : 800;
	position : absolute;
	left : 80%;
	top : 5%;
	width : 237px;
	height : 20px;
	z-index : 3;
	background : #FFBD25;
	border-radius : 20px;
	
	
}


.gps_icon{
	position : absolute;
	left : 87%;
	top : -5%;
	width : 30%;
	height : 15%;
	
	
}

.gps_icon_img {
	width : 80%; height : 65%;
	z-index : 5;
	cursor : pointer;
	position : absolute;
	
	
}

.gps_icon:hover + .gps_icon_des{
	display :flex;
	color : #656565;
	
	
}


</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(".gps_icon_img").hover(function(){
	$(".gps_icon_des").css("display","flex");
}, function(){
	$(".gps_icon_des").css("display","none");
});

</script>
</head>
<body>
	<main>
		<div class="list_container">
			<div class="list_row">
				<div class="search-box">
					<form action="/product/searchList" id="searchForm" method="get">
						<input type="text" placeholder="Search" name="keyword" />
						<button type="submit" class="btn-square">검색</button>
					</form>
				</div>
				<!-- search box -->
				<div class="btn-sort">
					<button class="sort_dis" type="button" onClick="distance()">5km이내</button>
					<button class="sort_price" id="price_desc" onClick="price_desc()">가격순</button>
					<button class="sort_new" type="button" onClick="pronew()">최신순</button>
				</div>
				<!-- sort -->
			</div>
			<!-- row -->
			
			<div class="pro_wrap" id="item">
				<c:forEach items="${list}" var="product">
					<div class="pro_list_wrap">
						<c:if test="${product.neighborhood eq 'YES'}">
							<div class = "gps_icon">
								<img class = "gps_icon_img" src = "../../resources/img/list/check.png">
							</div>
							<div class = "gps_icon_des">5KM 이내 동네거래를 선호하는 판매자입니다.</div>
						</c:if>
						<div class="pic_list">
							<a class = "pro_img_a" href="view?product_id=${product.product_id}">
							
							<c:choose>
							
							 <c:when test="${not empty pic.picture_name}"><img class="pro_img" src="/productUpload/${pic.picture_name}"></c:when>
							 <c:otherwise><img class="pro_img" src="../../resources/img/list/noImage.png"></c:otherwise>
							 							 
								
							</c:choose>
							
							</a>
						</div>
						<!-- pic -->
						<ul class="item-features list-unstyled">
							<li class="title"><c:out value="${product.title }" /></li>
						</ul>
						<div class="sp10"></div>
						<ul class="item-features list-unstyled">
							<li class="start_price1">시작가</li>
							<li class="start_price2">${product.start_price}원</li>
						</ul>
						<div class="sp1"></div>
						<ul class="item-features list-unstyled">
							<li class="current_price1">현재가</li>
							<li class="current_price2">${product.current_price}원</li>
						</ul>
						<div class="sp10"></div>
						<div class="pro_buy" align="center">
							<a href="view?product_id=${product.product_id}" class="buy_btn">응찰하기</a>
						</div>
						<br>
						<!-- pro buy -->
					</div>
					<!-- list wrap -->
				</c:forEach>
			</div>
			<!-- pro wrap -->
		</div>
		<!-- container -->
		<c:if test="${listcheck != 'empty'}">
		</c:if>
		<!-- 게시물 x -->
		<c:if test="${listcheck == 'empty'}">
			<div class="table_empty">검색결과가 없습니다.</div>
		</c:if>
	</main>
</body>
<script type="text/javascript">
var searchForm = $("#searchForm");
	// 검색버튼에  이벤트를 추가
	$("#searchForm button").on("click", function(e) {
		// 유효성 검사
		if (!searchForm.find("input[name='keyword']").val()) { // 키워드를 입력하지 않은 경우
			alert("키워드를 입력하세요.");
			return false; // 서버로 전송이 되지 않는다.
		}
		// 검색을 요청했으면 pageNum = 1로 변경한다.
	searchForm.find("input[name='pageNum']").val("1");
	searchForm.submit(); // 검색 요청을 한다.
});	
	
function price_desc(){

		$.ajax({
			type: 'get',
			url: '/product/price',
			data: "",
			success: function(data) {
				$('#item').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

function pronew(){

	$.ajax({
		url : "/product/new",
		type : "get",
		data : "",		
		success : function(data) {
			$("#item").html(data);			
		},
		error : function(request, status, error) {
			alert(error);
		}
	});
};

function distance(){
	var latitude;
	var longitude;
	if (!navigator.geolocation) {
        throw "위치 정보가 지원되지 않습니다.";
    }
    function success({coords}) {
    	latitude = coords.latitude;
    	longitude = coords.longitude;
    	
    	$.ajax({
    		url : "/product/5km",
    		type : "get",
    		data : {"latitude": latitude,
    				"longitude": longitude},
    		success : function(data){
    			$("#item").html(data);			
    		},
    		error : function(reqeust, status, error){
    			alert("error");
    		}
    	});
	}
    
    navigator.geolocation.getCurrentPosition(success);

};

</script>