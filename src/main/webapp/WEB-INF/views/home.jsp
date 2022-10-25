<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script type="text/javascript">
</script>

<script type="text/JavaScript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15c59b7950a1cd48ee2327181cd84295"></script>

<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width: 800px; height: 600px;"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		
	});
	function success({coords}) {
        var latitude = coords.latitude;   // 위도
        var longitude = coords.longitude; // 경도
        
        var latInput = $("input[name='latitude']").val(latitude);
        var longInput = $("input[name='longitude']").val(longitude);

    	var container = document.getElementById('map');
    	var options = {
    		center : new kakao.maps.LatLng(latitude, longitude),	
    		level : 3
    	};
    	var map = new kakao.maps.Map(container, options);
    	
    	var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 

    	// 마커를 생성합니다
    	var marker = new kakao.maps.Marker({
    	    position: markerPosition
    	});

    	// 마커가 지도 위에 표시되도록 설정합니다
    	marker.setMap(map);
	}
	function getUserLocation() {
        if (!navigator.geolocation) {
            throw "위치 정보가 지원되지 않습니다.";
        }
        navigator.geolocation.getCurrentPosition(success);
    }
    getUserLocation();
	</script>
	<div>
		<form action="/gps/data" id="GPS" method="POST">
			<input type="hidden" name="latitude" value="${latitude}">
			<input type="hidden" name="longitude" value="${longitude}">
			<button type="submit">전송</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>