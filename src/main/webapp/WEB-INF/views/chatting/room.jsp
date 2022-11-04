<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Room</title>
<style>
* {
	margin: 0;
	padding: 10px 25px;
}

body {
	
}

.container {
	width: max-content;
	margin: 0 auto;
	padding: 25px
}

.container h1 {
	text-align: left;
	display: flex;
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 30px;
}

.roomContainer {
	font-size: 20px;
	text-shadow: -1px -1px 1px rgb(0 0 0/ 10%);
	background-color: #ffffff;
	width: 500px;
	height: 90vh;
	overflow: auto;
	border: 0;
}

.roomList {
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	margin: auto;
	max-width: 600px;
	padding: 5px;
	width: 100%;
	box-shadow: 0 5px 10px rgb(0 0 0/ 10%);
	animation: float 5s infinite;
	margin-top: 15px;
}

.roomList th {
	border: 1px solid #FFBB00;
	background-color: #fff;
	color: #FFBB00;
	border-bottom: 4px solid #ffe223;
	font-size: 23px;
	font-weight: 100;
	padding: 19px;
	text-align: left;
	text-shadow: 0 1px 1px rgb(0 0 0/ 10%);
	vertical-align: middle;
}

.roomList td {
	border: 1px solid #FFBB00;
	background-color: #fff;
	text-align: left;
	color: #FFBB00;
}

tr:hover td {
  background:#ffd700;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}

td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

.roomList .num {
	width: 75px;
	text-align: center;
}

.roomList .room {
	width: 350px;
}

.roomList .go {
	width: 71px;
	text-align: center;
}

button {

    background-color: #FFBB00;
    font-size: 14px;
    color: white;
    border: 1px solid #fff136;
    border-radius: 9px;
    padding: 3px;
    margin: 0px;
    font-weight: 500;
}

.inputTable th {
	padding: 5px;
}

.inputTable input {
	width: 330px;
	height: 25px;
}

.nav{
	transform: translateY(80px);
    animation: showNavBar 0.5s ease-out forwards;
    animation-delay: 0.5s;
}

.nav .nav_list{
	display: flex;
    justify-content: space-between;
}

.nav_list .nav_list_product{
	font-size: 20px;
    position: relative;
}

.nav {
    position: fixed;
    background-color: #fcfcfc;
    width: 100%;
    padding: 20px 40px;
    left: 0px;
    bottom: 0px;
    border-top: 1px solid #f7f7f7;
}

.far{
	font-family: "Font Awesome 5 Free";
}
.fa-user:before {
    content: "\f007";
}
</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function() {
		getRoom();
		createRoom();
	}

	function getRoom() {
		commonAjax('/chatting/getRoom.json?user_id=${sessionScope.userid}', "",
				'post', function(result) {
					createChatingRoom(result);
				});
	}

	function createRoom() {
		$("#createRoom").click(
				function() {
					var msg = {
						roomName : $('#roomName').val(),
						product_id : $('#product_id').val(),
						buyer : $('#buyer').val(),
						seller : $('#seller').val()
					};

					commonAjax('/chatting/createRoom.json', msg, 'post',
							function(result) {
								createChatingRoom(result);
							});

					$("#roomName").val("");
				});
	}

	function goRoom(number, name, user) {
		location.href = "/chatting/moveChating?roomName=" + name + "&"
				+ "room_id=" + number + "&" + "user_id=" + user;
	}

	function createChatingRoom(res) {
		if (res != null) {
			var tag = "<div><div class='num'>번호</div><div class='room'>방 이름</div><th class='go'></th></div>";
			res
					.forEach(function(d, idx) {
						var rn = d.roomName.trim();
						var room_id = d.room_id;
						var user_id = '${sessionScope.userid}';
						tag +=  "<div class='num'>"
								+ (idx + 1)
								+ "</div>"
								+ "<div class='room'>"
								+ rn
								+ "</div>"
								+ "<div class='go'><button type='button' onclick='goRoom(\""
								+ room_id + "\", \"" + rn + "\", \"" + user_id
								+ "\")'>참여</button></td>";
					});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType) {
		$.ajax({
			url : url,
			data : parameter,
			type : type,
			contentType : contentType != null ? contentType
					: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(res) {
				calbak(res);
			},
			error : function(err) {
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
<main>
	<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<div id="roomList" class="roomList"></div>
		</div>
	</div>
</main>
<nav class="nav">
	<ul class="nav_list">
		<li class="nav_list_product">
		<a href="/product/list" class="nav_list_link">
			<i class="far fa-user">
			</i>
		</a>
	</ul>
</nav>
</body>
</html>