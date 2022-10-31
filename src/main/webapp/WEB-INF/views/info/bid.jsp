<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입찰 내역</title>
</head>
<body>
	<div>
		<table>
			<c:forEach items="${BidList}" var="list">
				<div class="bid_id">번호 : ${list.bid_id}</div>
				<div class="bid_date">입찰 날짜: ${list.bid_date}</div>
				<div class="current_price">입찰가: ${list.current_price}원</div>
				<div class="product_id">제품번호: ${list.product_id}</div>
				<br>
			</c:forEach>
		</table>
	</div>
</body>
</html>