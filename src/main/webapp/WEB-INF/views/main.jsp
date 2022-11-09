<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
main {
background-color : white;
width : 100vw;
min-width : 1000px;
height : 40vw;
min-height :500px;
}

.main_wrap {
width : 70%;
height : 100%;
position : relative;
margin:0 auto;
}

.main_img_wrap {
width : 100%;
height : 100%;
position : relative;
top : 0%;
margin:0 auto;
float : left;

}

.main_img_wrap img{
position : absolute;
width : 100%;
height : 100%;
}

.main_text_wrap {
height : 100%;
width : 50%;
float : left;
position : relative;

}

.main_text_big_div{
position : absolute;
top : 20%;
font-size : 40px;
font-weight : 1000;
width : 100%;
height : 10%;
text-align: center;
}


.main_text_small_div{
position : absolute;
font-size : 25px;
top : 50%;
width : 100%;
height : 10%;
text-align: center;
}

</style>
<meta charset="EUC-KR">
<title>3RD 중고 마켓</title>
</head>
<body>
	<main>
		<div class = "main_wrap">
			<div class = "main_img_wrap">
				<img src = "../resources/img/main/auction2.jpg">
			</div>
			</div>
		
	</main>
	<script type="text/javascript">
		<c:if test="${not empty message}">
			alert("${message}");
		</c:if>
	</script>
</body>
</html>