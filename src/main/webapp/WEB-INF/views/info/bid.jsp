<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
a { 
 text-decoration: none;
 color: black; 
 font:bold 12px tahoma;
 }
a:visited { text-decoration: none; }
a:hover { text-decoration: none; }
a:focus { text-decoration: none; }
a:hover, a:active { text-decoration: none; }

.bid_list_ul div:hover , .reg_list_ul div:hover, .awd_list_ul div:hover{
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
}


main {
width : 70%;
height : 80vw;
margin: 0 auto;
position : relative;
min-width :900px;
min-height : 1000px;
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
	height : 33%;
}
.total_bid_wrap{
	height : 33%;
}

.total_reg_wrap{
	height : 33%;
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
	height : 14%;
}

.total_end_list_wrap_des{
	height : 14%;
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
	height : 11%;
}
.total_bid_list_wrap_des2{
	height : 11%;
}
.total_reg_list_wrap_des2{
	height : 11%;
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
.total_bid_list_wrap_des2_proid{
width : 15%;
}
.total_bid_list_wrap_des2_title{
width : 20%;

}
.total_bid_list_wrap_des2_bid{
width : 25%;

}
.total_bid_list_wrap_des2_date{
width : 20%;

}
.total_bid_list_wrap_des2_etc{
width : 20%;

}
.total_bid_list_wrap_des2 div{
float : left; 
height : 20%;
}

/* 3-2-2 */
.total_reg_list_wrap_des2_proid{
width : 15%;
}
.total_reg_list_wrap_des2_title{
width : 20%;

}
.total_reg_list_wrap_des2_bid{
width : 25%;

}
.total_reg_list_wrap_des2_date{
width : 20%;

}
.total_reg_list_wrap_des2_del{
width : 20%;

}
.total_reg_list_wrap_des2 div{
float : left; 
height : 20%;
}

/* 3-2-3 */
.total_end_list_wrap_des2_proid{
width : 15%;
}
.total_end_list_wrap_des2_title{
width : 20%;

}
.total_end_list_wrap_des2_bid{
width : 25%;

}
.total_end_list_wrap_des2_date{
width : 20%;

}
.total_end_list_wrap_des2_phone{
width : 20%;

}
.total_end_list_wrap_des2 div{
float : left; 
height : 20%;
}


/* 3-3 */
.total_bid_list_wrap{
	height : 65%;
}

.total_reg_list_wrap{
	height : 65%;
}

.total_end_list_wrap{
	height : 65%;
}

.total_bid_list_wrap, .total_reg_list_wrap, .total_end_list_wrap{
	width : 100%;
	
}


/* 3-3-1 */
.product_id{
	width: 15%;
}
.bid_date{
	width : 20%;
}
.current_price{
	width : 25%;
}

.product_title{
	width : 20%;
}

.bid_etc{
	width : 20%;
}
.bid_date, .current_price, .product_title, .bid_etc, .product_id{
	float : left;
	height : 20%;
	line-height : 250%;

}


/* 3-3-2 */

.product_id_reg{
	width : 15%;
}
.product_title_reg{
	width : 20%;

}
.current_price_reg{
	width : 25%;

}
.regist_date{
	width : 20%;

}
.delete_product{
	width : 20%;
	
}
.delete_product div{
	width : 50%;
	cursor : pointer;
	background : black;
	margin : 0 auto;
	border-radius : 10px;
	color : white;
	cursor : pointer;
	height : 70%;
}

.product_title_reg, .current_price_reg, .regist_date, .delete_product, .product_id_reg{
	float : left;
	height : 20%;
	line-height : 230%;
}


/* 3-3-3 */
.awd_proid{
	width : 15%;
}
.awd_title{
	width : 20%;
}
.awd_price{
	width : 25%;
}
.awd_date{
	width : 20%;
}
.awd_phone{
	width : 20%;
}

.awd_title, .awd_price, .awd_date, .awd_phone,.awd_proid{
	float : left;
	height : 20%;
	line-height : 230%;

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


/*페이징*/
.bid_list_ul{

}

.reg_list_ul{

}
.awd_list_ul{
	
}

.bid_list_ul, .reg_list_ul, .awd_list_ul{
	width : 100%;
	height : 9%;
	display : flex;
	justify-content:flex-end;
}

.bid_list_ul div{
	height : 100%;
	width : 5%;
	background : #FFF6E1;
	border:1px solid #eee;
}

.reg_list_ul div{
	height : 100%;
	width : 5%;
	background : #FFF6E1;
	border:1px solid #eee;
}

.awd_list_ul div{
	height : 100%;
	width : 5%;
	background : #FFF6E1;
	border:1px solid #eee;
}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


var product_id;

$( function(){
	
	$(".delete_product_div").on("click", function(){
		
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
				<div class = "total_bid_list_wrap_des2_proid">경매 번호</div>
				<div class = "total_bid_list_wrap_des2_title">경매 이름</div>
				<div class = "total_bid_list_wrap_des2_bid">입찰가</div>
				<div class = "total_bid_list_wrap_des2_date">입찰일</div>
				<div class = "total_bid_list_wrap_des2_etc">입찰 상황</div>
			</div>
			<div class = "total_bid_list_wrap">
			<c:forEach items="${BidList}" var="list" varStatus="status">
				<div class = "product_id">${list.product_id}번</div>
				<div class="product_title">${BidListTitle[status.index]}</div>
				<div class="current_price">${list.current_price}원</div>
				<div class="bid_date">${BidListDate[status.index]}</div>
				<div class = "bid_etc">${BidListEtc[status.index]}</div>
			</c:forEach>
		</div>
			
	<div class="bid_list_ul">
    	<c:if test="${BidListPage.prev}">
   			<div>
      			<a href='<c:url value="/info/bid?bid_page=${BidListPage.startPage-1}&amp;reg_page=${reh_page_model}&awd_page=${awd_page_model}"/>'>pre</a>
   			</div>
   		</c:if>
  		<c:forEach begin="${BidListPage.startPage}" end="${BidListPage.endPage}" var="pageNum">
   			 <div>
        		<a href='<c:url value="/info/bid?bid_page=${pageNum}&amp;reg_page=${reg_page_model}&awd_page=${awd_page_model}"/>'>${pageNum}</a>
  			 </div>
  		</c:forEach>
   		<c:if test="${BidListPage.next && BidListPage.endPage > 0}">
   			<div>
        <a href='<c:url value="/info/bid?bid_page=${BidListPage.endPage+1}&amp;reg_page=${reg_page_model}&awd_page=${awd_page_model}"/>'>next</a>
    		</div>
    	</c:if>
	</div>	
			
		</div>
		<div class = "total_reg_wrap">
			<div class = "total_reg_list_wrap_des">등록 내역</div>
				<div class = "total_reg_list_wrap_des2">
					<div class = "total_reg_list_wrap_des2_proid">경매 번호</div>
					<div class = "total_reg_list_wrap_des2_title">경매 이름</div>
					<div class = "total_reg_list_wrap_des2_bid">현재가</div>
					<div class = "total_reg_list_wrap_des2_date">등록일</div>
					<div class = "total_reg_list_wrap_des2_del"></div>
			</div>
			<div class = "total_reg_list_wrap">
			<c:forEach items="${productList}" var="proList" varStatus = "status">
				<div class = "product_id_reg">${proList.product_id}번</div>
				<div class = "product_title_reg">${proList.title}</div>
				<div class = "current_price_reg">${proList.current_price}원</div>
				<div class = "regist_date">${RegListDate[status.index]}</div>
				<div class = "delete_product"><div class ="delete_product_div">삭제<input class = "prolist_proid" type ="hidden" value="${proList.product_id}"></div></div>
				
			</c:forEach>
			
		</div>
		
			
			<!--  페이징  -->
	<div class="reg_list_ul">
    	<c:if test="${productListPage.prev}">
   			<div>
      			<a href='<c:url value="/info/bid?bid_page=${bid_page_model}&amp;reg_page=${productListPage.startPage-1}&awd_page=${awd_page_model}"/>'>pre</a>
   			</div>
   		</c:if>
  		<c:forEach begin="${productListPage.startPage}" end="${productListPage.endPage}" var="pageNum">
   			 <div>
        		<a href='<c:url value="/info/bid?bid_page=${bid_page_model}&amp;reg_page=${pageNum}&awd_page=${awd_page_model}"/>'>${pageNum}</a>
  			 </div>
  		</c:forEach>
   		<c:if test="${productListPage.next && productListPage.endPage > 0}">
   			<div>
        <a href='<c:url value="/info/bid?bid_page=${bid_page_model}&amp;reg_page=${productListPage.endPage+1}&awd_page=${awd_page_model}"/>'>next</a>
    		</div>
    	</c:if>
	</div>
		</div>	
		<div class = "total_end_wrap">
			<div class = "total_end_list_wrap_des">낙찰 내역</div>
				<div class = "total_end_list_wrap_des2">
					<div class = "total_end_list_wrap_des2_proid">경매 번호</div>
					<div class = "total_end_list_wrap_des2_title">경매 이름</div>
					<div class = "total_end_list_wrap_des2_bid">낙찰</div>
					<div class = "total_end_list_wrap_des2_date">낙찰일</div>
					<div class = "total_end_list_wrap_des2_phone">판매자 전화번호</div>
				</div>
			<div class = "total_end_list_wrap">
				<c:forEach items="${AwardList2}" var="awaList" varStatus = "status">
					<div class = "awd_proid">${awaList.product_id}</div>
					<div class = "awd_title">${awaList.title}</div>
					<div class = "awd_price">${awaList.current_price}원</div>
					<div class = "awd_date">${AwardDate2[status.index]}</div>
					<div class = "awd_phone">${AwardNum2[status.index]}</div>
				</c:forEach>
			</div>
		<div class="awd_list_ul">
    		<c:if test="${AwdListPage.prev}">
   				<div>
      				<a href='<c:url value="/info/bid?bid_page=${bid_page_model}&amp;reg_page=${reg_page_model}&awd_page=${AwdListPage.startPage-1}"/>'>pre</a>
   				</div>
   			</c:if>
  			<c:forEach begin="${AwardListPage.startPage}" end="${AwardListPage.endPage}" var="pageNum">
   				<div>
        			<a href='<c:url value="/info/bid?bid_page=${pageNum}&amp;reg_page=${reg_page_model}&awd_page=${awd_page_model}"/>'>${pageNum}</a>
  				</div>
  			</c:forEach>
   			<c:if test="${AwdListPage.next && AwdListPage.endPage > 0}">
   			<div>
       			<a href='<c:url value="/info/bid?bid_page=${bid_page_model}&amp;reg_page=${reg_page_model}&awd_page=${AwdListPage.endPage+1}"/>'>next</a>
    		</div>
    		</c:if>
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