<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.body {
	
}

.list_container {
	width: 100%;
	height: 100%;
	background: #000;
	position: relative;
}

#list_button {
	display: block;
	text-align: right;
	margin: .25rem;
	padding: .5rem 1rem;
	text-decoration: none;
	font-weight: bold;
	color: white;
}

.pro_wrap {
	display: inline-block;
	margin: 0 auto;
	transition: all 300ms ease-in-out;
}

.pro_list {
	width: 25%;
	height: 80%;
	float: left;
	border: 1px solid #eee;
	padding: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
	<main>
		<div class="list_continer">
			<div class="list_top_wrap">
				<div class="col-12 text-style">
					<h3>상품 리스트</h3>
					<!-- 검색 -->
					<nav class="navbar navbar-light bg-light">
						<div class="container-fluid">
							<form action="/product/searchList" id="searchForm" method="get">
								<div class="serach_input">
									<input type="text" name="keyword" />
									<button class="btn seach_btn">Search</button>
								</div>
							</form>
							<div class="d-flex" id="list_button">
								<button class="btn-sort" onClick="SortDistance()">5km이내</button>
								<button class="btn-sort" onClick="SortPrice()">가격순</button>
								<button class="btn-sort" onClick="SortNew()">최신순</button>
							</div>
						</div>
					</nav>
					<div class="panel-heading">
						<button id='regBtn' type="button"
							onclick="location.href='register'">새 상품 등록</button>
					</div>
					<!--  -->
					<div class="pro_wrap">
						<div class="product">
							<c:forEach items="${list}" var="product">
								<div class="pic_list_wrap">
									<a href="view?product_id=${product.product_id}"> 
										<img src="../../resources/img/${pic.picture_path}/${pic.picture_name}">
									</a>
								</div>
								<div class="pro_list">
									<div class="product_id">번호: ${product.product_id}</div>
									<div class="title">제목: ${product.title}</div>
									<div class="description">설명: ${product.description}</div>
									<div class="start_price">시작가: ${product.start_price}원</div>
									<div class="current_price">현재가: ${product.current_price}원</div>
									<button class="buy" type="button"
										onclick="location.href='view?product_id=${product.product_id}';">
										입찰하기</button>
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
				</div>
			</div>
		</div>
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