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

.list_container {
	width: 100%;
	height: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	padding-right: 15px;
}

.list_row {
	width: 100%;
	height: auto%;
	overflow: hidden;
	display: flex;
}

.search-box {
	height: 40px;
	width: 400px;
	border: 1px solid #FFE302;
	background: #fffff;
	margin-bottom: 10px;
}

input{
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.btn-square{
	width: 50px;
	height: 40px;
	border: 0px;
	background: #ff8c00;
	outline: none;
	float: right;
	color: #ffffff;
}

.btn-sort{
	float: right;
}

.pro_list_wrap {
	width: 19vw;
	height: auto;
	float: left;
	border: 1px solid #eee;
}

.pro_img {
	width: 100%;
	height: auto;
	border-radius: 5px;
	vertical-align: middle;
	border-style: none;
}

.pic_list {
	
}

.pro_list {
	width: 100%;
	float: left;
	list-style: none;
	padding-top: 15px;
	font-size: 16px;
	margin-top: 0;
	transition: all 300ms ease-in-out;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<main>
		<div class="list_continer">
			<div class="list_row">
				<div class="search-box">
					<form action="/product/searchList" id="searchForm" method="get">
						<input type="text" placeholder="Search" name="keyword" />
						<button type="submit" class="btn-square">검색</button>
					</form>
				</div>
				<div class="btn-sort">
					<button type="button" style="float: right;" onClick="SortDistance()">5km이내</button>
					<button type="button" onClick="SortPrice()">가격순</button>
					<button type="button" onClick="SortNew()">최신순</button>
				</div>
			</div>
			<div class="pro_wrap">
				<c:forEach items="${list}" var="product">
					<div class="pro_list_wrap">
						<div class="pic_list">
							<a href="view?product_id=${product.product_id}"> <img
								class="pro_img" src="../../resources/img/iphone13pink.png">
							</a>
						</div>
						<div class="pro_list">
							<div class="title">제목: ${product.title}</div>
							<div class="description">설명: ${product.description}</div>
							<div class="start_price">시작가: ${product.start_price}원</div>
							<div class="current_price">현재가: ${product.current_price}원</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
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

	var sortprice = function(url) {

		$.ajax({
			type : 'get',
			url : "/product/price" + type,
		})
	}
</script>