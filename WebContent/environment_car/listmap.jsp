<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>

</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbe730b25e58d27f83029a15154fa8af&autoload=false&libraries=services"></script>
<script>
daum.maps.load(function() {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var positions = [];
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch("${addr}", function(result, status) {
	
		 // 정상적으로 검색이 완료됐으면 
	    if (status === daum.maps.services.Status.OK) {
	
	       var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
		     //마커 이미지 
		     var imageSrc = "battery.png"
		     var imageSize = new daum.maps.Size(24, 35);
		     var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		
		     //마커를 생성합니다
		     var marker = new daum.maps.Marker({
		    			 map: map,
		    			 position: coords,
		    			 image : markerImage
		     });
	
	   		//마커가 지도 위에 표시되도록 설정합니다
	    	 marker.setMap(map);
	
	       // 인포윈도우로 장소에 대한 설명을 표시합니다
	       var infowindow = new daum.maps.InfoWindow({
	           content: '<div style="width:150px;text-align:center;padding:6px 0;">${charge_name}</div>'
	       });
	       infowindow.open(map, marker);
	
	       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	       map.setCenter(coords);
	   }  
	}); 
});	
</script>
</body>
</html>