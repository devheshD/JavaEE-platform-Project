<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Range Slider.js</title>
<link rel='stylesheet' href='http://www.justinaguilar.com/animations/css/animations.css'>
<link rel="stylesheet" href="css/style-slider.css">
</head>
<body>
	<!--https://andreruffert.github.io/rangeslider.js/-->
	<p style="padding: 5px; float: left;">초기 납입금</p>
	<output style="display: inline-block">3,825</output>
	<span style="padding-left: 20px;">만원</span>
	<br>
	<br>
	<input type="range" value="3825" step="25" min="0" max="10000">
	<small id="helper" class="slideRight">Slide to get started
		&#x2192;</small>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index-slider.js"></script>
</body>
</html>
