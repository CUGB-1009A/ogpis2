<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/init.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>油气资源规划信息系统</title>
<script type="text/javascript" src="../../js/arcgis/echartOptions.js"></script>
<!-- 加载bootstrap -->
<script type="text/javascript" src="../../js/arcgis/bootstrap.js"></script>
<link type="text/css" rel="stylesheet"
	href="../../js/arcgis/css/bootstrap.css">
<!-- <script type="text/javascript"
	src="../js/arcgis/bootstrap-select.min.js"></script> -->
</head>
<html>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<!-- <div data-options="region:'north',split:true"
			style="width: 100%; height: 50%;">
			<div id="chart1" style="width: 700px; height: 220px"></div>
		</div> -->
		<div id="myCarousel" class="carousel slide"
			data-options="region:'center',border:false">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<div id="chart21" class="echart"
						style="width: 700px; height: 220px"></div>
				</div>
				<div class="item">
					<div id="chart22" class="echart"
						style="width: 700px; height: 220px"></div>
				</div>
				<div class="item">
					<div id="chart23" class="echart"
						style="width: 700px; height: 220px"></div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;
			</a> <a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo; </a>
		</div>
		<!-- <div class="border" data-options="region:'center'"
		style="width: 100%; height: 50%;">
		<div id="chart2" style="width: 700px; height: 220px"></div>
	</div> -->
	</div>
	<script type="text/javascript">
		var options21 = setChartOption(options1, {
			title : "石油产量",
			xAxisData : [ 2011, 2012, 2013, 2014, 2015 ],
			yAxisName : "亿吨",
			yAxisData : [ 2.03, 2.07, 2.09, 2.11, 2.15 ]
		});
		options21.series[0].barWidth = 30;
		bindOptionToDiv("chart21", options21);

		var options22 = setChartOption(options1, {
			title : "天然气产量",
			xAxisData : [ 2011, 2012, 2013, 2014, 2015 ],
			yAxisName : "亿立方米",
			yAxisData : [ 1013.00, 1071.00, 1166.00, 1248.00, 1300 ]
		});
		options22.series[0].barWidth = 30;
		bindOptionToDiv("chart22", options22);

		var options23 = setChartOption(options1, {
			title : "煤层气产量",
			xAxisData : [ 2011, 2012, 2013, 2014, 2015 ],
			yAxisName : "亿立方米",
			yAxisData : [ 20.70, 25.73, 29.26, 36.90, 42.00 ]
		});
		options23.series[0].barWidth = 30;
		bindOptionToDiv("chart23", options23);
		
		$(window).resize(windowResize);
		window.onload = function() {
			windowResize();
			$(".carousel").carousel({
				interval : 3000
			});
		}
		
		function windowResize(array) {
			width = window.innerWidth;
			height = window.innerHeight;
			document.getElementById("chart21").style.width = width;
			document.getElementById("chart21").style.height = height - 2;
			echartResize("chart21");
			/* document.getElementById("chart21").chart.resize(); */
			document.getElementById("chart22").style.width = width;
			document.getElementById("chart22").style.height = height - 2;
			echartResize("chart22");
			/* document.getElementById("chart22").chart.resize(); */
			document.getElementById("chart23").style.width = width;
			document.getElementById("chart23").style.height = height - 2;
			echartResize("chart23");
			/* document.getElementById("chart23").chart.resize(); */
		}
	</script>
</body>
</html>