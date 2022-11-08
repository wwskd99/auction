<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Chatting</title>
<style>
main {
	min-width: 500px;
	width: 70%;
	margin: 0 auto;
	height: 35vw;
	min-height: 800px;
}

/* 1-1 */
.chatting_top_wrapper {
	width: 100%;
	height: 10%;
	position: relative;
	background: #FFBF2C;
}

.chatting_center_wrapper {
	width: 100%;
	background-color: #FFF2AB;
	overflow: auto;
	height: 100%;
	position: relative;
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

.chatting_center_wrapper::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

/*1-1-1 */
.roomName_wrap {
	position: absolute;
	left: 10%;
	top: 25%;
	color: #F6EEDC;
	font-size: 1.8rem;
	max-width: 70%;
}

.complete_wrap {
	position: absolute;
	right: 5%;
	top: 30%;
}

#btn-modal {
	border: none;
	background: #94918A;
	width: 80px;
	height: 40px;
	color: white;
	border-radius: 10px;
	cursor: pointer;
}

/* 2-1 */
.chatting_me_box_wrap {
	display: flex;
	justify-content: flex-end;
	width: 100%;
	margin-bottom: 20px;
	margin-top: 20px;
}

.chatting_others_box_wrap {
	display: flex;
	justify-content: flex-front;
	width: 100%;
	margin-bottom: 20px;
	margin-top: 20px;
}

/*2-1-1 */
.user_icon_div {
	position: relative;
	overflow: hidden;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin: 5px;
	margin-right: 20px;
	margin-left: 20px;
}

.others_chat {
	width: 100px;
	height: 30px;
}

.user_icon_img {
	width: 70px;
	height: 70px;
	position: absolute;
	background: white;
	left: 50%;
	top: -20%;
	transform: translateX(-50%);
}

.chatting_me_box {
	max-width: 80%;
	border-radius: 10px;
	background: #F7DF66;
	display: inline-block;
	margin-right: 20px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 1.1rem;
}

.chatting_others_box {
	display: flex;
	flex-direction: column;
}

.others_chat_chat {
	max-width: 80%;
	border-radius: 10px;
	background: white;
	display: inline-block;
	margin-right: 20px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 1.1rem;
}

.chatting_me_box_date{
	
}

.chatting_me_box_date p{
 margin-top : 37px;
 font-size : 0.8rem;
 margin-right : 10px;
 margin-bottom : 0px;
}


.chatting_others_box_date{
	margin-bottom : 0px;
	margin-top : 55px;
	font-size : 0.8rem;
}

/*2-2*/
.input_msg {
	width: 100%;
	display: flex;
	justify-content: center;
	bottom: 15px;
	position : absolute;
}

.input_msg div {
	padding: 10px;
}

.input_msg_center {
	width: 70%;
	height: 30px;
	display: flex;
	justify-content: center;
}

.input_msg_bottom {
	width: 15%;
	height: 30px;
	display: flex;
	justify-content: center;
}

.input_msg_center input {
	width: 100%;
	height: 25px;
}

.input_msg_bottom_button {
	width: 100%;
	height: 25px;
}

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
	background: #FFBB00;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: 0px;
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

#modal2.modal-overlay2 {
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

#modal2 .modal-window {
	background: #FFBB00;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: 0px;
	padding: 10px;
}

#modal2 .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal2 .title h2 {
	display: inline;
}

#modal2 .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal2 .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

.info_img {

	width: 50%;
	height: 50%;
	
}
</style>
</head>

<script type="text/javascript">
	
	var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chatting/chating/"+$("#room_id").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){

					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}

			
					
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						var room_id_ajax = "${room_id}";
						
						$.ajax({
							url : '/chatting/ajaxChatting',
							data : {'room_id':room_id_ajax},
							type : 'POST',
							success : function(result) { 
								
								$(".chating").html(result);
								let chating = document.getElementById("chatting_center_wrapper"); 
						   	 	chating.scrollTop = chating.scrollHeight;

							},
							error: function(){
								alert("실패");
							}
						});
					
						
						
					}else{
						var room_id_ajax = "${room_id}";
						
						$.ajax({
							url : '/chatting/ajaxChatting',
							data : {'room_id':room_id_ajax},
							type : 'POST',
							success : function(result) { 
								
								$(".chating").html(result);
								let chating = document.getElementById("chatting_center_wrapper"); 
						   	 	chating.scrollTop = chating.scrollHeight;

							},
							error: function(){
								alert("실패");
							}
						});
					}
					let chating = document.getElementById("chatting_center_wrapper"); 
			   	 	chating.scrollTop = chating.scrollHeight;	
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	$(document).ready(function() {
		var userName = '${sessionScope.userid}';
		if(userName == null || userName.trim() == ""){
			alert("로그인 후 사용해주세요.");
			location.href="/main";
		}else{
			wsOpen();
		}
	});


	function send() {
		var option ={
			type: "message",
			room_id: $("#room_id").val(),
			sessionId : $("#sessionId").val(),
			userName : "${sessionScope.userid}",
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}

	
	

    window.onload=function(){
    	let chating = document.getElementById("chatting_center_wrapper"); 
   	 	chating.scrollTop = chating.scrollHeight;
    };
</script>
<body>
<main>
	<div  class="chatting_top_wrapper">
		<div class = "roomName_wrap">${roomName}</div>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="room_id" value="${room_id}">

		<div class="complete_wrap">
			<button id="btn-modal">거래 완료</button>
		</div>

	</div>
		
		
	<div class ="chatting_center_wrapper" id="chatting_center_wrapper">
		<div id="chating" class="chating">
			<c:forEach var="chat" items="${chat_log}" varStatus = "status">
				<c:choose>
					<c:when test="${chat.user_id == sessionScope.userid}">
						<div class = "chatting_me_box_wrap">
							<div class = "chatting_me_box_date"><p>${chat_date[status.index]}</p></div>
							<div class = "chatting_me_box"><p class='me'>${chat.chat}</p></div>
						</div>
					</c:when>
					<c:otherwise>
					<div class = "chatting_others_box_wrap">
						<div class = "user_icon_div"><img class = "user_icon_img" src = "../../resources/img/chatting/user_icon.jpg"></div>
						<div class = "chatting_others_box">
							<div class = "others_chat">${chat.user_id}</div>
							<div class = "others_chat_chat"><p class='others'>${chat.chat}</p></div>				
						</div>
						<div class = "chatting_others_box_date"><p>${chat_date[status.index]}</p></div>
					</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="input_msg">
	
				
					<div class = "input_msg_center"><input id="chatting" placeholder="보내실 메시지를 입력하세요."></div>
					<div class = "input_msg_bottom"><button class = "input_msg_bottom_button" onclick="send()" id="sendBtn">보내기</button></div>
		</div>
	</div>
	<!-- 모달창 -->
		
		<div id="modal" class="modal-overlay">
			<div class="modal-window">
				<div class="close-area">×</div>
				<div class="title">
					<h2>평가창</h2><br>
					<h2>
						<c:choose>
							<c:when test="${buyer == sessionScope.userid}">
								상대방 ID : "${seller}"
							</c:when>
							<c:otherwise>
								상대방 ID : "${buyer}"
							</c:otherwise>
						</c:choose>
					</h2>
					<br><br>
				</div>
				<form method="get" action="/chatting/score">
					<input type="hidden" name="user_id" value="${sessionScope.userid}">
					<input type="hidden" name="product_id" value="${product_id}">
					<input type="hidden" name="room_id" value="${room_id}">
					<div>
						<input type="range" name="user_score" class="user_score" min="0" max="5" step="1">
						<h3>
							평점:<font id="slider_value_view">0</font>
						</h3>
						<br><br>
					</div>
					<div>
						<h3>간단한 이유:</h3>
						<textarea id="cause" name="cause" rows="15" cols="54"></textarea>
					</div>
					<br>
					<div>
						<input type="submit" value="제출">
					</div>
				</form>
			</div>
		</div>
	
		<div id="modal2" class="modal-overlay2">
			<div class="modal-window">
				<div class="close-area">×</div>
				<div>
					<p>아이디 : <c:choose>
							<c:when test="${seller == sessionScope.userid}">
					${buyer}
				</c:when>
							<c:otherwise>
					${seller}
				</c:otherwise>
						</c:choose></p>
					<p>이름 : ${member.name}</p>
					<p>
						평점 :
						<c:choose>
							<c:when test="${not empty info_msg}">
					${info_msg}
				</c:when>
							<c:otherwise>
					${average}
				</c:otherwise>
						</c:choose>
					</p>
					<p>
						사진 : <img class="info_img"
							src="/productUpload/${picture.picture_name}">
					</p>
					<p>
					</p>
				</div>
			</div>
		</div>
	
	
	</main>
</body>
<script type="text/javascript">
const modal = document.getElementById("modal")
function modalOn() {
    modal.style.display = "flex"
}
function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modalOn()
})
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
//        modalOff()	// 외부 클릭 시
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})

function ShowSliderValue(sVal){	
	var obValueView = document.getElementById("slider_value_view");	
	obValueView.innerHTML = sVal
}
var RangeSlider = function(){	
	var range = $('.user_score');    	
	range.on('input', function(){				
		ShowSliderValue(this.value);	
	});
};
	
RangeSlider();

$( function(){
	
	$(".user_icon_div").on("click", function(){
		
		var modal2 = document.querySelector(".modal-overlay2");
		modal2.style.display = "flex";				
	});
});

const modal2 = document.getElementById("modal2")
function modalOn2() {
    modal2.style.display = "flex"
}
function isModalOn2() {
    return modal2.style.display === "flex"
}
function modalOff2() {
    modal2.style.display = "none"
}
const closeBtn2 = modal2.querySelector(".close-area")
closeBtn2.addEventListener("click", e => {
	
    modalOff2()
})
modal2.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff2()	// 외부 클릭 시
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn2() && e.key === "Escape") {
        modalOff()
    }
})

</script>
</html>