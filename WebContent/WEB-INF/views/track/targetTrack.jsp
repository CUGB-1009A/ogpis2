<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../init.jsp"%>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var dojoConfig = {
		packages : [ {
			name : "myDojo",
			location : "/ogpis2/js/arcgis"
		} ]
	};
</script>

<!-- 加载ArcGIS API  -->
<script type="text/javascript" src="/arcgis/library/3.9/3.9/init.js"></script>
<link rel="stylesheet" type="text/css"
	href="/arcgis/library/3.9/3.9/esri/css/esri.css"></link>
<!-- 加载自定义ArcGIS API  -->
<script type="text/javascript" src="../js/arcgis/globalFunction.js"></script>
<script type="text/javascript" src="../js/arcgis/globalVariable.js"></script>
<script type="text/javascript" src="../js/arcgis/initPage.js"></script>
<!-- 加载自定义样式 -->
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
</head>
<body>
	<div style="width: 100%; height: 100%">
		<div id="tab1" class="easyui-tabs" style="width: 100%; height: auto;"
			data-options="border:false">
			<div title="查询统计">
				<div class="padding">
					<div class="inline-block">
						<label id="field1">油气田名称:</label> <select id="field1Value"
							class="select">
							<option>公司1</option>
							<option>公司2</option>
							<option>公司3</option>
						</select>
					</div>
					<div class="inline-block">
						<label id="field2">年度:</label> <select id="field2Value"
							class="select">
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
						</select>
					</div>
					<div class="inline-block">
						<label id="field3">指标:</label> <select id="field3Value"
							class="select">
							<option>石油储量</option>
							<option>石油产量</option>
							<option>天然气储量</option>
							<option>天然气产量</option>
						</select>
					</div>
					<div class="inline-block">
						<button class="select" onclick="queryTest();">查询</button>
					</div>
					<!-- <div class="inline-block">
						<button class="select" onclick="recQuery();">框选</button>
					</div>
					<div class="inline-block">
						<button class="select" onclick="render();">渲染</button>
					</div> -->
				</div>
			</div>
			<div title="警戒设置" closable="true">
				<div class="padding">
					<div class="inline-block">
						<label id="field1">警戒条件1:</label> <select id="field1Value"
							class="select">
							<option>条件1</option>
							<option>条件2</option>
							<option>条件3</option>
						</select>
					</div>
					<div class="inline-block">
						<label id="field2">警戒条件2:</label> <select id="field2Value"
							class="select">
							<option>条件1</option>
							<option>条件2</option>
							<option>条件3</option>
						</select>
					</div>
					<div class="inline-block">
						<label id="field3">警戒条件3:</label> <select id="field3Value"
							class="select">
							<option>条件1</option>
							<option>条件2</option>
							<option>条件3</option>
						</select>
					</div>
					<div class="inline-block">
						<button class="select" onclick="render();">渲染</button>
					</div>
				</div>
			</div>
		</div>
		<div id="tt" class="easyui-tabs" style="width: 80%; height: auto;"
			data-options="fit:true,tabPosition:'right',headerWidth:50,">
			<div title="地图">
				<div style="width: 100%; height: 88%;">
					<div style="width: 100%; height: 100%; position: relative;">
						<div id="map" data-options="fit:true,region:'center',border:false"
							onContextMenu="mapContextMenu('#contextMenu')"></div>
						<div class="easyui-draggable"
							data-options="handle:'#contextMenu',onDrag:onDrag"
							style="position: absolute; display: none">
							<div id="contextMenu" class="contextMenu">
								<div>
									<input type="checkbox" value="#mapToolDiv" /> <label>工具条</label>
								</div>
								<div>
									<input type="checkbox" value=".mapInfoPanel" /> <label>信息板</label>
								</div>
							</div>
						</div>
						<div class="easyui-draggable"
							data-options="handle:'#mapToolDiv',onDrag:onDrag"
							style="position: absolute; display: none">
							<div id="mapToolDiv" class="mapToolDiv">
								<div class="mapToolDiv-item-start">
									<div id="zoomPan" title="漫游" onclick="ZoomPan(mapManager);"></div>
								</div>
								<div class="mapToolDiv-item">
									<div id="zoomIn" title="放大" onClick="ZoomIn(mapManager);"></div>
								</div>
								<div class="mapToolDiv-item">
									<div id="zoomOut" title="缩小" onClick="ZoomOut(mapManager);"></div>
								</div>
								<div class="mapToolDiv-item">
									<div id="selectPlygon" title="框选" onClick="recQuery();"></div>
								</div>
								<div class="mapToolDiv-item-end">
									<div id="zoomHome" title="全图" onClick="Home(mapManager);"></div>
								</div>
							</div>
						</div>
						<div style="display: none">
							<div class="mapInfoPanel">
								<div class="layers">
									<div class="mapInfo-title">
										<label>图层</label>
									</div>
									<div id="layers"></div>
								</div>
								<div class="legend">
									<div class="mapInfo-title">
										<label>图例</label>
									</div>
									<div id="legend" style="width: auto"></div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<img style="width: 100%; padding-bottom: 80px"
							src="../js/arcgis/map.png" /> <img
							style="width: 100%; padding-bottom: 80px"
							src="../js/arcgis/map2.png" /> <img
							style="width: 100%; padding-bottom: 80px"
							src="../js/arcgis/map3.png" /> <img
							style="width: 100%; padding-bottom: 80px"
							src="../js/arcgis/map4.png" /> <img
							style="width: 100%; padding-bottom: 80px"
							src="../js/arcgis/map5.png" />
					</div>
				</div>
			</div>
			<div title="图表" class="easyui-layout"
				style="width: 100%; min-width: 800px; height: 100%;">
				<div data-options="region:'west',split:true"
					style="width: 30%; max-width: 600px;">
					<table id="table" class="easyui-datagrid"
						data-options="fit:true,url:'../track/json',fitColumns:true,singleSelect:true">
						<thead>
							<tr>
								<th data-options="field:'Country'">Country</th>
								<th data-options="field:'OrderID'">OrderID</th>
								<th data-options="field:'CustomerID'">CustomerID</th>
								<th data-options="field:'OrderDate'">OrderDate</th>
							</tr>
						</thead>
						<tbody id="data">
							<tr>
								<td>001</td>
								<td>name1</td>
								<td>2323</td>
							</tr>
							<tr>
								<td>002</td>
								<td>name2</td>
								<td>4612</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="border" data-options="region:'center'">
					<div id="test" style="width:80%;height:400px"></div>
				</div>
				<!-- <div class="toolBar" style="width: 100%; height: auto">
					<div class="float-right">
						<div class="inline-block margin padding-lr border-2">
							<a id="btn" href="#" class="lable">保存图片</a>
						</div>
						<div class="inline-block margin padding-lr border-2">
							<a id="btn" href="#" class="lable">保存图片</a>
						</div>
						<div class="inline-block margin padding-lr border-2">
							<a id="btn" href="#" class="lable">保存图片</a>
						</div>
						<div class="inline-block margin padding-lr border-2">
							<a id="btn" href="#" class="lable">保存图片</a>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function queryTest() {
		var options = {
			url : "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer",
			layerId : 0,
			sql : "FID < 900 and FID > 890"
		}
		queryTask(mapManager, options);
	}
	function recQuery() {
		require([ "esri/toolbars/draw" ], function(Draw) {
			mapManager.drawToolBar.activate(Draw.RECTANGLE);
		})
	}
	function render() {
		initRender(mapManager);
	}
	$(function() {
		$("#tt").tabs({
			onSelect : function(title) {
				console.log(title);
				if (title == "图表")
					$.parser.parse(document)
			}
		})
	})
	
	var option = {
	        		 title: { 
	        					 text: '规模跟踪',
	        					 left:'center'
	        				 },
	        		 tooltip: {
	        			 		 trigger: 'axis'
	        		 },
	        		
	        		 xAxis : [
	        			        {
	        			            type : 'category',
	        			            boundaryGap : false,
	        			            name:"年份",
	        			            data : [2001,2002,2003,2004,2005,2006]
	        			        }
	        			    ],
	        			    yAxis : [
	        					        {
	        					            type : 'value',
	        					            name:'万吨'
	        					        }
	        					    ],
	        		 series: [
	        			          {
	        					     type: 'line',
	        					     name:'历史数据',
	        					     data: [23256,34529,28549,40453,31678,48156]
	        			          }
	        		          ]
	        		}
var myChart = echarts.init(document.getElementById("test"));
myChart.setOption(option);
</script>
</html>