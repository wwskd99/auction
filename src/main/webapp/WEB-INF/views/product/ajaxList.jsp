<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pro_wrap" id="item">
				<c:forEach items="${list}" var="product" varStatus = "status">
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
							
							 <c:when test="${not empty picList[status.index].picture_name}"><img class="pro_img" src="/productUpload/${picList[status.index].picture_name}"></c:when>
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
					
						<!-- pro buy -->
					</div>
					<!-- list wrap -->
				</c:forEach>
			</div>