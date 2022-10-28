<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}
#modal .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}
#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal .title h2 {
	display: inline;
}
#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
</style>
<link rel="stylesheet" href="../css/cus_product.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 text-style">
				<h3>상품 리스트</h3>
				<div id="list_center_top_sort">
					<button class="btn-sort" onClick="SortPriceHigh()">높은가격순</button>
					<button class="btn-sort" onClick="SortPriceLow()">낮은가격순</button>
					<button class="btn-sort" onClick="SortNew()">최신순</button>
				</div>
				<div class="panel-heading">
					Board List Page
					<button id='regBtn' type="button"
						onclick="location.href='register'">Register New Board</button>
				</div>
				<!-- /.panel-heading -->
				<div class="col-md-4 col-sm-12 t-margin">
					<div class="product" style="width: 100%;">
						<div class="product-list">
							<table border="1">
								<c:forEach items="${list}" var="product">
									<a href="#" class="product"></a>
									<div class="product img">
										<img src="/resources/img/iphone13pink.png" href="product/view?product_id" width="200px">
		
									</div>
									<div class="productnumb">번호 :${product.product_id} </div>
									<div class="title">제목: ${product.title}</div>
									<div class="description">설명: ${product.description}</div>
									<div class="start_price">시작가: ${product.start_price}원</div>
									<div class="current_price">현재가: ${product.current_price}원</div>
								</c:forEach>
							</table>
							<button id="btn-modal">모달 창 열기 버튼</button>
							<div id="modal" class="modal-overlay">
								<div class="modal-window">
									<div class="title">
										<h2>모달</h2>
									</div>
									<div class="close-area">X</div>
									<div class="content">
										<p>가나다라마바사 아자차카타파하</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
const modal = document.getElementById("modal")
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})
</script>