<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예전 채팅방 저장소</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.container {
	width: 500px;
	margin: 0 auto;
	padding: 25px
}

.container h1 {
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 20px;
}

.chating {
	background-color: #000;
	width: 500px;
	height: 500px;
	overflow: auto;
}

.chating .me {
	color: #F6F6F6;
	text-align: right;
}

.chating .others {
	color: #FFE400;
	text-align: left;
}

input {
	width: 330px;
	height: 25px;
}

#yourMsg {
	display: none;
}
</style>
</head>
<body>
	<div class="container">
		<h1>로그</h1>
		<div id="chating" class="chating">
			<div id="roomContainer" class="roomContainer">
				<table id="roomList" class="roomList">
					<tr>
						<td>
							<c:forEach var="log" items="${log}">
								<p class='others'>${log.user_id} : ${log.chat}</p>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>