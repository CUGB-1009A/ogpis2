<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 加载jQuery -->
<script type="text/javascript" src="../easyui-1.5/jquery.min.js"></script>
<!-- 加载easyUI -->
<link rel="stylesheet" type="text/css"
	href="../easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../easyui-1.5/themes/default/tabs.css">
<link rel="stylesheet" type="text/css"
	href="../easyui-1.5/themes/icon.css">
<script type="text/javascript" src="../easyui-1.5/jquery.easyui.min.js"></script>
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
					<div class="inline-block">
						<button class="select" onclick="recQuery();">框选</button>
					</div>
					<div class="inline-block">
						<button class="select" onclick="render();">渲染</button>
					</div>
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
						<button class="select" onclick="queryTest();">查询</button>
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
									<input type="checkbox" value="#mapToolDiv2" /> <label>工具条2</label>
								</div>
								<!-- <div>
									<div id="zoomPan" title="漫游" onclick="ZoomPan();"></div>
								</div>
								<div>
									<div id="zoomIn" title="放大" onClick="ZoomIn();"></div>
								</div>
								<div>
									<div id="zoomOut" title="缩小" onClick="ZoomOut();"></div>
								</div>
								<div>
									<div id="zoomHome" title="全图" onClick="Home();"></div>
								</div> -->
							</div>
						</div>
						<div class="easyui-draggable"
							data-options="handle:'#mapToolDiv',onDrag:onDrag"
							style="position: absolute; display: none">
							<div id="mapToolDiv" class="mapToolDiv">
								<div>
									<div id="zoomPan" title="漫游" onclick="ZoomPan(mapManager);"></div>
								</div>
								<div>
									<div id="zoomIn" title="放大" onClick="ZoomIn(mapManager);"></div>
								</div>
								<div>
									<div id="zoomOut" title="缩小" onClick="ZoomOut(mapManager);"></div>
								</div>
								<div>
									<div id="zoomHome" title="全图" onClick="Home(mapManager);"></div>
								</div>
							</div>
						</div>
						<div class="layers"
							style="position: absolute; right: 50px; top: 30px">
							<div class="layers-title">
								<label>图层</label>
							</div>
							<div id="layers"></div>
						</div>
						<div class="legend"
							style="position: absolute; left: 50px; bottom: 30px">
							<div class="legend-title">
								<label>图例</label>
							</div>
							<div id="legend" style="width: auto"></div>
						</div>
					</div>
					<div>
						<img  style="width:100%;padding-bottom:80px" src="../js/arcgis/map.png"/>
						<img  style="width:100%;padding-bottom:80px" src="../js/arcgis/map2.png"/>
						<img  style="width:100%;padding-bottom:80px" src="../js/arcgis/map3.png"/>
						<img  style="width:100%;padding-bottom:80px" src="../js/arcgis/map4.png"/>
						<img  style="width:100%;padding-bottom:80px" src="../js/arcgis/map5.png"/>
					</div>
					<!-- <div class="toolBar" style="width: 100%; height: auto">
						<div class="float-right" style="margin: 1px">
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
			<div title="图表"
				style="width: 100%; height: 100%; display: flex; flex-direction: row">
				<table id="table" class="easyui-datagrid"
					style="width: 20%; height: 100%"
					data-options="url:'../track/json',fitColumns:true,singleSelect:true">
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
				<div class="border" style="width: 80%">
					<div>test</div>
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

	})
</script>
</html>