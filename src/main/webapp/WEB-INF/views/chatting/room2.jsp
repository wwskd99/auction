<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<style>
.wrap{
	width:100%;
    height:100%;
  
}

.chat-wrap {
    margin: 0 auto;
    width: fit-content;
    height: auto;
}

.title {
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 30px;
	margin-top : 30px;
}


.chat-container {
	padding: 25px;
	margin-left: -27px;
	margin-top: -30px;
	overflow: hidden;
}

.chat-info{
	width: 30vw;
	border-bottom: 4px solid #ffd700;
   padding: 0px;

}

.chat-info:hover{
	background: #ffe0c7;
}

.chats-img-info{
	float: left;
	
}

.chats-img {
	width: 70px;
	height: auto;
	border-radius: 93px;
}

.info{
    display: inline-block;
    margin-left: 20px;
}


ul {
	padding-left: 0;
	list-style: none;
	margin-top: 0;
	color: gray;
}

.chat-id{
	font-size: large;
    font-weight: bold;
    color:black;
    padding: 5px;
    letter-spacing: 0.5px;
}

.chat-time{
	
}






</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
	<div class="wrap">
		<div class="chat-wrap">
			<div class="title">
				<h3>채팅</h3>
			</div>
			<div class="chat-container">
				<c:forEach items="${room}" var="ro" varStatus="status">
					<div class="chat-info" onclick="goRoom(${ro.room_id}, '${ro.roomName}', '${sessionScope.userid}')">		
						<div class="chats-img-info">
							<img class="chats-img" src="../../resources/img/icon.jpg">	
						</div>			
							<div class="info">
							<ul>
								<li class="chat-id">
								<c:choose>
								<c:when test="${sessionScope.userid==ro.buyer}">
									${ro.seller}
								</c:when>
								<c:otherwise>
									${ro.buyer}
								</c:otherwise>
								</c:choose>
								</li>				
										
								<c:choose>
									<c:when test="${empty room_chat[status.index].chat}">
										<li class="chat-log"> 채팅 시작하기
										</li>
									</c:when>
									<c:otherwise>
									<li class="chat-log"> 
										${room_chat[status.index].chat}
										</li>
										<li><fmt:formatDate pattern="yyyy년 MM월 dd일 a  h시 mm분" value="${room_chat[status.index].chat_date}"/> </li>
									</c:otherwise>
								</c:choose>
							</ul>
							</div>
					</div>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	

function goRoom(number, name, user){
	location.href="/chatting/moveChating?roomName="+name+"&"+"room_id="+number + "&" + "user_id=" + user;
}


</script>
</html>