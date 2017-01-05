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
<!-- 加载bootstrap -->
<script type="text/javascript" src="../js/arcgis/bootstrap.js"></script>
<link type="text/css" rel="stylesheet"
	href="../js/arcgis/css/bootstrap.css">
<!-- <script type="text/javascript"
	src="../js/arcgis/bootstrap-select.min.js"></script> -->
</head>
<html>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<!-- <div data-options="region:'north',split:true"
			style="width: 100%; height: 50%;">
			<div id="chart1" style="width: 700px; height: 220px"></div>
		</div> -->
		<div id="myCarousel" class="carousel slide"
			data-options="region:'center'" style="border:0">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active" data-options="onResize:panelResize">
					<div id="chart21" style="width: 700px; height: 220px"></div>
				</div>
				<div class="item" data-options="onResize:panelResize">
					<div id="chart22" style="width: 700px; height: 220px"></div>
				</div>
				<div class="item" data-options="onResize:panelResize">
					<div id="chart23" style="width: 700px; height: 220px"></div>
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
		var option2 = {
			title : {
				text : '指标跟踪',
				left : 'center'
			},
			tooltip : {
				trigger : 'axis'
			},

			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				name : "年份",
				data : [ 2001, 2002, 2003, 2004, 2005, 2006 ]
			} ],
			yAxis : [ {
				type : 'value',
				name : '万吨'
			} ],
			series : [ {
				type : 'line',
				name : '历史数据',
				data : [ 1215, 8545, 5442, 78854, 4564, 4788 ]
			} ]
		}
		/* var myChart12 = echarts.init(document.getElementById("chart1"));
		option2.title.text = "规划完成情况";
		myChart12.setOption(option2); */
		var myChart221 = echarts.init(document.getElementById("chart21"));
		option2.title.text = "石油产量";
		myChart221.setOption(option2);
		document.getElementById("chart21").chart=myChart221;
		var myChart222 = echarts.init(document.getElementById("chart22"));
		option2.title.text = "天然气产量";
		myChart222.setOption(option2);
		document.getElementById("chart22").chart=myChart222;
		var myChart223 = echarts.init(document.getElementById("chart23"));
		option2.title.text = "煤层气产量";
		myChart223.setOption(option2);
		document.getElementById("chart23").chart=myChart223;
		window.onload = function() {
			$(".carousel").carousel({
				interval : 3000
			});
		}
		function panelResize(width,height) {
			$(this).children("div")[0].style.width=width-20;
			$(this).children("div")[0].style.height=height-20;
			$(this).children("div")[0].chart.resize();
		};
		//函数参数为dom元素
		var resizeWorldMapContainer = function (chartDiv,chartDiv) {
			chartDiv.style.width = chartDiv.style.width;
			chartDiv.style.height = chartDiv.style.height;
		};
		$(window).resize(function(){
			width=window.innerWidth;
			height=window.innerHeight;
			document.getElementById("chart21").style.width=width-20;
			document.getElementById("chart21").style.height=height-20;
			document.getElementById("chart21").chart.resize();
			document.getElementById("chart22").style.width=width-20;
			document.getElementById("chart22").style.height=height-20;
			document.getElementById("chart22").chart.resize();
			document.getElementById("chart23").style.width=width-20;
			document.getElementById("chart23").style.height=height-20;
			document.getElementById("chart23").chart.resize();
			});
	</script>
</body>
</html>