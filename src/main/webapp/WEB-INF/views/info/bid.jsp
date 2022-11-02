<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
main {
width : 70%;
height : 70vw;
margin: 0 auto;
position : relative;
min-width :900px;
min-height : 650px;
}

/* 1 */
.total_bid_reg_wrap{
	width : 100%;
	height : 100%;
	position:absolute;
	overflow : visible;
	border : 1px solid #E4E4E4;
}

/* 2 */
.total_end_wrap{
	height : 30%;
}
.total_bid_wrap{
	height : 40%;
}

.total_reg_wrap{
	height : 30%;
}

.total_end_wrap, .total_bid_wrap, .total_reg_wrap{
	width : 100%;
	font-size : 1.0rem;
	text-align : center;
	border : 1px solid #E4E4E4;
	overflow : visible;
}

/* 3-1 */
.total_bid_list_wrap_des{
	height : 14%;

}
.total_reg_list_wrap_des{
	height : 18%;
}

.total_end_list_wrap_des{
	height : 18%;
}

.total_bid_list_wrap_des, .total_reg_list_wrap_des, .total_end_list_wrap_des{
	width : 100%;	
	border-bottom : 1px solid #E4E4E4;
	line-height : 250%;
	font-size : 1.1rem;
	background : #FFEFD5;
	color : #FF9614;
}


/* 3-2 */
.total_end_list_wrap_des2{
	height : 15%;
}
.total_bid_list_wrap_des2{
	height : 12%;
}
.total_reg_list_wrap_des2{
	height : 15%;
}

.total_end_list_wrap_des2, .total_bid_list_wrap_des2, .total_reg_list_wrap_des2{
	width : 100%;
	border-bottom : 1px solid #E4E4E4;
	background : #FDF5E6;
	color : #969696;
	font-size : 1.0rem;
	line-height : 250%;
	
}


/* 3-2-1 */
.total_bid_list_wrap_des2_title{
width : 20%;

}
.total_bid_list_wrap_des2_bid{
width : 30%;

}
.total_bid_list_wrap_des2_date{
width : 20%;

}
.total_bid_list_wrap_des2_etc{
width : 30%;

}
.total_bid_list_wrap_des2 div{
float : left; 
height : 20%;
}

/* 3-2-2 */
.total_reg_list_wrap_des2_title{
width : 20%;

}
.total_reg_list_wrap_des2_bid{
width : 30%;

}
.total_reg_list_wrap_des2_date{
width : 20%;

}
.total_reg_list_wrap_des2_del{
width : 30%;

}
.total_reg_list_wrap_des2 div{
float : left; 
height : 20%;
}

/* 3-2-3 */

.total_end_list_wrap_des2_title{
width : 20%;

}
.total_end_list_wrap_des2_bid{
width : 30%;

}
.total_end_list_wrap_des2_date{
width : 20%;

}
.total_end_list_wrap_des2_phone{
width : 30%;

}
.total_end_list_wrap_des2 div{
float : left; 
height : 20%;
}


/* 3-3 */
.total_bid_list_wrap{

}

.total_reg_list_wrap{

}

.total_end_list_wrap{

}

.total_bid_list_wrap, .total_reg_list_wrap, .total_end_list_wrap{
	width : 100%;
	height : 70%;
	overflow : visible;
}


/* 3-3-1 */
.bid_date{
	width : 20%;
}
.current_price{
	width : 30%;
}

.product_title{
	width : 20%;
}

.bid_etc{
	width : 30%;
}
.bid_date, .current_price, .product_title, .bid_etc{
	float : left;
	height : 14%;
	line-height : 250%;

}


/* 3-3-2 */
.product_title_reg{
	width : 20%;

}
.current_price_reg{
	width : 30%;

}
.regist_date{
	width : 20%;

}
.delete_product{
	width : 30%;

}

.product_title_reg, .current_price_reg, .regist_date, .delete_product{
	float : left;
	height : 18%;
	line-height : 250%;
}


/* 3-3-3 */

.awd_title{
	width : 20%;
}
.awd_price{
	width : 30%;
}
.awd_date{
	width : 20%;
}
.awd_phone{
	width : 30%;
}

.awd_title, .awd_price, .awd_date, .awd_phone{
	float : left;
	height : 18%;
	line-height : 250%;

}













/* 모달 */
.modal_box {

 
}

.modal_box {
  position: fixed;
  top: 0%;
  left: 0%;
  width :100vw;
  height : 100vw;
  background: rgba(0, 0, 0, 0.2);
  z-index : 10;
 
}

.modal_content {
  position : fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width : 500px;
  height : 300px;
  background : #FDF5E6;
  font-size: 24px;
  font-weight: bold;
  border-radius : 10px;
  text-align : center;
}

.modal_text{
	color : #FFAA28;
	line-height : 240px;
	width : 100%;
	height : 80%;
	border-radius : 2px;
	border-bottom : 1px solid #EEEEE;
}
.modal_confirm_yes{
	width : 49%;
	height : 20%;
	float : left;
	line-height : 60px;
	border-right : 1px solid #E4E4E4;
	color : #323232;
}
.modal_confirm_no{
	width : 50%;
	height : 20%;
	float : left;
	line-height : 60px;
	color : #5a5a5a;
}

.modal_box2 {
  position: fixed;
  top: 0%;
  left: 0%;
  width :100vw;
  height : 100vw;
  background: rgba(0, 0, 0, 0.2);
  z-index : 15;
 
}

.modal_content2 {
  position : fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width : 500px;
  height : 300px;
  background : #FDF5E6;
  font-size: 24px;
  font-weight: bold;
  border-radius : 10px;
  text-align : center;
}

.modal_text2{
	color : #FFAA28;
	line-height : 240px;
	width : 100%;
	height : 80%;
	border-radius : 2px;
	border-bottom : 1px solid #EEEEE;
}
.modal_confirm_yes2{
	width : 100%;
	height : 20%;
	line-height : 60px;
	color : #323232;
}





</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


var product_id;

$( function(){
	
	$(".delete_product").on("click", function(){
		
		var modal = document.querySelector(".modal_wrapper");
		modal.style.display = "flex";
		product_id = $(this).children(".prolist_proid").val();
		
		
		
	});
	
		
	$(".modal_confirm_yes").on("click", function(){
		
		
		$.ajax({
	  	 	url : "/product/productDelete", 
	   		type : 'POST', 
	     	data : {'product_id': product_id },
	     	dataType : "text", 
	     	success : function(data) {
	     	
	     		$(".modal_text2").text(data);
	     		
	     		var modal = document.querySelector(".modal_wrapper");
	    		modal.style.display = "none";
	     		
	     		var modal2 = document.querySelector(".modal_wrapper2");
	    		modal2.style.display = "flex";
	     		
	     		
	    		
	     	}, 
	   		error : function(xhr, status) {
	 			alert("실패");
	   		}
		})
		
	});
	
	$(".modal_confirm_no").on("click", function(){
		
		var modal = document.querySelector(".modal_wrapper");
		modal.style.display = "none";
	
	});
	
	$(".modal_confirm_yes2").on("click", function(){
		
		var modal = document.querySelector(".modal_wrapper2");
		modal.style.display = "none";
		
		var user_id = "<%=session.getAttribute("sessionUser")%>";
		
		location.reload();
	
	});
});

</script>
<meta charset="UTF-8">
<title>입찰 내역</title>
</head>
<body>
<main>
	<div class = "total_bid_reg_wrap">
		<div class = "total_bid_wrap">
			<div class = "total_bid_list_wrap_des">입찰 내역</div>
			<div class = "total_bid_list_wrap_des2">
				<div class = "total_bid_list_wrap_des2_title">경매 이름</div>
				<div class = "total_bid_list_wrap_des2_bid">입찰가</div>
				<div class = "total_bid_list_wrap_des2_date">입찰일</div>
				<div class = "total_bid_list_wrap_des2_etc">입찰 상황</div>
			</div>
			<div class = "total_bid_list_wrap">
			<c:forEach items="${BidList}" var="list" varStatus="status">
				<div class="product_title">${BidListTitle[status.index]}</div>
				<div class="current_price">${list.current_price}원</div>
				<div class="bid_date">${BidListDate[status.index]}</div>
				<div class = "bid_etc">${BidListEtc[status.index]}</div>
			</c:forEach>
			</div>
		</div>
		<div class = "total_reg_wrap">
			<div class = "total_reg_list_wrap_des">등록 내역</div>
				<div class = "total_reg_list_wrap_des2">
				<div class = "total_reg_list_wrap_des2_title">경매 이름</div>
				<div class = "total_reg_list_wrap_des2_bid">현재가</div>
				<div class = "total_reg_list_wrap_des2_date">등록일</div>
				<div class = "total_reg_list_wrap_des2_del"></div>
			</div>
			<div class = "total_reg_list_wrap">
			<c:forEach items="${productList}" var="proList" varStatus = "status">
			
				<div class = "product_title_reg">${proList.title}</div>
				<div class = "current_price_reg">${proList.current_price}원</div>
				<div class = "regist_date">${RegListDate[status.index]}</div>
				<div class = "delete_product">삭제<input class = "prolist_proid" type ="hidden" value="${proList.product_id}"></div>
				
			</c:forEach>		
			</div>
		</div>	
		<div class = "total_end_wrap">
			<div class = "total_end_list_wrap_des">낙찰 내역</div>
				<div class = "total_end_list_wrap_des2">
					<div class = "total_end_list_wrap_des2_title">경매 이름</div>
					<div class = "total_end_list_wrap_des2_bid">낙찰</div>
					<div class = "total_end_list_wrap_des2_date">낙찰일</div>
					<div class = "total_end_list_wrap_des2_phone">판매자 전화번호</div>
				</div>
			
			<c:forEach items="${AwardList}" var="awaList" varStatus = "status">
				<div class = "awd_title">${awaList.title}</div>
				<div class = "awd_price">${awaList.current_price}원</div>
				<div class = "awd_date">${AwardDate[status.index]}</div>
				<div class = "awd_phone">${AwardNum[status.index]}</div>
				
			</c:forEach>		
			</div>
		</div>	
	</div>
	
	
	
	<!-- 모달 -->
		<div class="modal_wrapper" style="display:none;" >
      		<div class="modal_box">
      			 <div class="modal_content">
      			 	<div class = "modal_text">정말 삭제 하시겠습니까?</div>
      			 	<div class = "modal_confirm_yes">예</div>
      			 	<div class = "modal_confirm_no">아니오</div>
      			 </div>
     		</div>
   		</div>
   		
   		<div class="modal_wrapper2" style="display:none;" >
      		<div class="modal_box2">
      			 <div class="modal_content2">
      			 	<div class = "modal_text2"></div>
      			 		<div class = "modal_confirm_yes2">확인</div>
      			 </div>
     		</div>
   		</div>
</main>
		

</body>
	
</html>