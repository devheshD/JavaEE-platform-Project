<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style>
table {
	widtd: 100%;
	background-color: #f3f3f3;
	text-align: center;
	overflow: auto;
}
#spec tr th {
	text-align: center;
	vertical-align: middle;
	font-weight: 800;
	font-size: 20px;
	color: white;
}

.engine{
	background-color: #82ccdd;
}
.elec{
	background-color: #6a89cc;
}
.drive {
	background-color: #60a3bc;
}
.mileage{
	background-color: #4a69bd;
}
.mileageElec {
	background-color: #3c6382;
}
.size {
	background-color: #1e3799;
}
.cargo {
	background-color: #0a3d62;
}
.speed{
	background-color: #0c2461;
}
</style>
</head>
<body>
	<table class="table table-hover table-striped" id="spec">
		<tr>
			<th rowspan=8 class="col-xs-3 engine">엔진</th>
		</tr>
		<tr>
			<td class="col-xs-4">엔진형식</td>
			<td class="col-xs-5">${car_specvo.s1}</td>
		</tr>
		<tr>
			<td class="col-xs-4">연료</td>
			<td class="col-xs-5">${car_specvo.s2}</td>
		</tr>
		<tr>
			<td class="col-xs-4">배기량 (cc)</td>
			<td class="col-xs-5">${car_specvo.s3}</td>
		</tr>
		<tr>
			<td class="col-xs-4">최고출력 (ps/rpm)</td>
			<td class="col-xs-5">${car_specvo.s4}</td>
		</tr>
		<tr>
			<td class="col-xs-4">최대토크 (kg.m/rpm)</td>
			<td class="col-xs-5">${car_specvo.s5}</td>
		</tr>
		<tr>
			<td class="col-xs-4">공회전 제한장치</td>
			<td class="col-xs-5">${car_specvo.s6}</td>
		</tr>

		<tr>
			<td class="col-xs-4">친환경</td>
			<td class="col-xs-5">${car_specvo.s7}</td>
		</tr>

		<tr>
			<th rowspan=11 class="col-xs-2 elec">전기</th>
		</tr>
		<tr>
			<td class="col-xs-4">배터리 종류</td>
			<td class="col-xs-5">${car_specvo.s8}</td>
		</tr>
		<tr>
			<td class="col-xs-4">배터리 전압 (V)</td>
			<td class="col-xs-5">${car_specvo.s9}</td>
		</tr>
		<tr>
			<td class="col-xs-4">배터리 용량 (Ah)</td>
			<td class="col-xs-5">${car_specvo.s10}</td>
		</tr>
		<tr>
			<td class="col-xs-4">충전 용량 (kWh)</td>
			<td class="col-xs-5">${car_specvo.s11}</td>
		</tr>
		<tr>
			<td class="col-xs-4">모터 최고출력 (ps)</td>
			<td class="col-xs-5">${car_specvo.s12}</td>
		</tr>
		<tr>
			<td class="col-xs-4">모터 최대토크 (kg.m)</td>
			<td class="col-xs-5">${car_specvo.s13}</td>
		</tr>
		<tr>
			<td class="col-xs-4">충전방식 (완속)</td>
			<td class="col-xs-5">${car_specvo.s14}</td>

		</tr>
		<tr>
			<td class="col-xs-4">충전시간 (완속) (시간)</td>
			<td class="col-xs-5">${car_specvo.s15}</td>
		</tr>
		<tr>
			<td class="col-xs-4">충전방식 (급속)</td>
			<td class="col-xs-5">${car_specvo.s16}</td>
		</tr>
		<tr>
			<td class="col-xs-4">충전시간(급속)(분)</td>
			<td class="col-xs-5">${car_specvo.s17}</td>
		</tr>

		<tr>
			<th rowspan=11 class="col-xs-2 drive">구동</th>
		</tr>
		<tr>
			<td class="col-xs-4">굴림방식</td>
			<td class="col-xs-5">${car_specvo.s18}</td>
		</tr>
		<tr>
			<td class="col-xs-4">변속기</td>
			<td class="col-xs-5">${car_specvo.s19}</td>
		</tr>
		<tr>
			<td class="col-xs-4">서스펜션 (전)</td>
			<td class="col-xs-5">${car_specvo.s20}</td>
		</tr>
		<tr>
			<td class="col-xs-4">서스펜션 (후)</td>
			<td class="col-xs-5">${car_specvo.s21}</td>
		</tr>
		<tr>
			<td class="col-xs-4">브레이크 (전)</td>
			<td class="col-xs-5">${car_specvo.s22}</td>
		</tr>
		<tr>
			<td class="col-xs-4">브레이크 (후)</td>
			<td class="col-xs-5">${car_specvo.s23}</td>
		</tr>
		<tr>
			<td class="col-xs-4">타이어 (전)</td>
			<td class="col-xs-5">${car_specvo.s24}</td>

		</tr>
		<tr>
			<td class="col-xs-4">타이어 (후)</td>
			<td class="col-xs-5">${car_specvo.s25}</td>
		</tr>
		<tr>
			<td class="col-xs-4">휠 (전) (인치)</td>
			<td class="col-xs-5">${car_specvo.s26}</td>
		</tr>
		<tr>
			<td class="col-xs-4">휠 (후) (인치)</td>
			<td class="col-xs-5">${car_specvo.s27}</td>
		</tr>

		<tr>
			<th rowspan=6 class="col-xs-2 mileage">연비</th>
		</tr>
		<tr>
			<td class="col-xs-4">복합연비 (km/ℓ)</td>
			<td class="col-xs-5">${car_specvo.s28}</td>
		</tr>
		<tr>
			<td class="col-xs-4">도심연비 (km/ℓ)</td>
			<td class="col-xs-5">${car_specvo.s29}</td>
		</tr>
		<tr>
			<td class="col-xs-4">고속연비 (km/ℓ)</td>
			<td class="col-xs-5">${car_specvo.s30}</td>
		</tr>
		<tr>
			<td class="col-xs-4">CO₂ 배출 (g/km)</td>
			<td class="col-xs-5">${car_specvo.s31}</td>
		</tr>
		<tr>
			<td class="col-xs-4">에너지소비효율 (등급)</td>
			<td class="col-xs-5">${car_specvo.s32}</td>
		</tr>

		<tr>
			<th rowspan=5 class="col-xs-2 mileageElec">연비 (전기)</th>
		</tr>
		<tr>
			<td class="col-xs-4">복합연비 (전기) (km/kWh))</td>
			<td class="col-xs-5">${car_specvo.s33}</td>
		</tr>
		<tr>
			<td class="col-xs-4">도심연비 (전기) (km/kWh)</td>
			<td class="col-xs-5">${car_specvo.s34}</td>
		</tr>
		<tr>
			<td class="col-xs-4">고속연비 (전기) (km/kWh)</td>
			<td class="col-xs-5">${car_specvo.s35}</td>
		</tr>
		<tr>
			<td class="col-xs-4">항속거리 (km)</td>
			<td class="col-xs-5">${car_specvo.s36}</td>
		</tr>

		<tr>
			<th rowspan=12 class="col-xs-2 size">제원</th>
		</tr>
		<tr>
			<td class="col-xs-4">전장 (mm)</td>
			<td class="col-xs-5">${car_specvo.s37}</td>
		</tr>
		<tr>
			<td class="col-xs-4">전폭 (mm)</td>
			<td class="col-xs-5">${car_specvo.s38}</td>
		</tr>
		<tr>
			<td class="col-xs-4">전고 (mm)</td>
			<td class="col-xs-5">${car_specvo.s39}</td>
		</tr>
		<tr>
			<td class="col-xs-4">축거 (mm)</td>
			<td class="col-xs-5">${car_specvo.s40}</td>
		</tr>
		<tr>
			<td class="col-xs-4">윤거 (전) (mm)</td>
			<td class="col-xs-5">${car_specvo.s41}</td>
		</tr>
		<tr>
			<td class="col-xs-4">윤거 (후) (mm)</td>
			<td class="col-xs-5">${car_specvo.s42}</td>
		</tr>
		<tr>
			<td class="col-xs-4">오버행 (전) (mm)</td>
			<td class="col-xs-5">${car_specvo.s43}</td>
		</tr>
		<tr>
			<td class="col-xs-4">오버행 (후) (mm)</td>
			<td class="col-xs-5">${car_specvo.s44}</td>
		</tr>
		<tr>
			<td class="col-xs-4">승차정원</td>
			<td class="col-xs-5">${car_specvo.s45}</td>
		</tr>
		<tr>
			<td class="col-xs-4">공차중량 (kg)</td>
			<td class="col-xs-5">${car_specvo.s46}</td>
		</tr>
		<tr>
			<td class="col-xs-4">연료탱크 (ℓ)</td>
			<td class="col-xs-5">${car_specvo.s47}</td>
		</tr>

		<tr>
			<th rowspan=5 class="col-xs-2 cargo">적재함</th>
		</tr>
		<tr>
			<td class="col-xs-4">적재함 길이 (mm)</td>
			<td class="col-xs-5">${car_specvo.s48}</td>
		</tr>
		<tr>
			<td class="col-xs-4">적재함 넓이 (mm)</td>
			<td class="col-xs-5">${car_specvo.s49}</td>
		</tr>
		<tr>
			<td class="col-xs-4">적재함 높이 (mm)</td>
			<td class="col-xs-5">${car_specvo.s50}</td>
		</tr>
		<tr>
			<td class="col-xs-4">적재량 (kg)</td>
			<td class="col-xs-5">${car_specvo.s51}</td>
		</tr>
		
		<tr>
			<th rowspan=3 class="col-xs-2 speed">성능</th>
		</tr>
		<tr>
			<td class="col-xs-4">제로백 (초)</td>
			<td class="col-xs-5">${car_specvo.s52}</td>
		</tr>
		<tr>
			<td class="col-xs-4">최고속도 (km/h)</td>
			<td class="col-xs-5">${car_specvo.s53}</td>
		</tr>
	</table>
</body>
</html>