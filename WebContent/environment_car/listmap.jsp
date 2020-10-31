<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>�ּҷ� ��� ǥ���ϱ�</title>

</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbe730b25e58d27f83029a15154fa8af&autoload=false&libraries=services"></script>
<script>
daum.maps.load(function() {
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = { 
		    center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		    level: 3 // ������ Ȯ�� ����
		};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	
	//���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
	var geocoder = new daum.maps.services.Geocoder();
	var positions = [];
	
	// �ּҷ� ��ǥ�� �˻��մϴ�
	geocoder.addressSearch("${addr}", function(result, status) {
	
		 // ���������� �˻��� �Ϸ������ 
	    if (status === daum.maps.services.Status.OK) {
	
	       var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
		     //��Ŀ �̹��� 
		     var imageSrc = "battery.png"
		     var imageSize = new daum.maps.Size(24, 35);
		     var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		
		     //��Ŀ�� �����մϴ�
		     var marker = new daum.maps.Marker({
		    			 map: map,
		    			 position: coords,
		    			 image : markerImage
		     });
	
	   		//��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
	    	 marker.setMap(map);
	
	       // ����������� ��ҿ� ���� ������ ǥ���մϴ�
	       var infowindow = new daum.maps.InfoWindow({
	           content: '<div style="width:150px;text-align:center;padding:6px 0;">${charge_name}</div>'
	       });
	       infowindow.open(map, marker);
	
	       // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
	       map.setCenter(coords);
	   }  
	}); 
});	
</script>
</body>
</html>