<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/init.jsp"%>
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
			location : "/ogpis2/arcgis"
		} ]
	};
</script>



<!-- 加载ArcGIS API  -->
<script type="text/javascript" src="/arcgis/library/3.9/3.9/init.js"></script>
<link rel="stylesheet" type="text/css"
	href="/arcgis/library/3.9/3.9/esri/css/esri.css"></link>
<!-- 加载自定义ArcGIS API  -->
<script type="text/javascript" src="../arcgis/initMap.js"></script>
<script type="text/javascript" src="../arcgis/globalFunction.js"></script>
<script type="text/javascript" src="../arcgis/globalVariable.js"></script>
<!-- 加载自定义样式 -->
<link rel="stylesheet" type="text/css" href="../arcgis/css/Map.css">
<script type="text/javascript" src="../arcgis/initPage.js"></script>
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
						<label id="field2">油气田名称:</label> <select id="field2Value"
							class="select">
							<option>公司1</option>
							<option>公司2</option>
							<option>公司3</option>
						</select>
					</div>
					<div class="inline-block">
						<label id="field3">油气田名称:</label> <select id="field3Value"
							class="select">
							<option>公司1</option>
							<option>公司2</option>
							<option>公司3</option>
						</select>
					</div>
					<div class="inline-block">
						<button onclick="queryTest();">查询</button>
					</div>
					<div class="inline-block">
						<button onclick="recQuery();">框选</button>
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
						<button onclick="queryTest();">查询</button>
					</div>
					<div class="inline-block">
						<button onclick="recQuery();">框选</button>
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
							onContextMenu="mapContextMenu()"></div>
						<div class="easyui-draggable"
							data-options="handle:'#mapToolsDiv',onDrag:onDrag"
							style="position: absolute; display: none">
							<div id="mapToolsDiv" class="mapToolDiv">
								<div>
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
								</div>
							</div>
						</div>
						<div id="layers" style="position:absolute;right:50px;top:30px">
							<div>
								<input type="checkbox" value="layer1" checked/>
								<label>layer1</label>
							</div>
							<div>
								<input type="checkbox" value="layer1" checked/>
								<label>layer1</label>
							</div>
							<div>
								<input type="checkbox" value="layer1" checked/>
								<label>layer1</label>
							</div>
							<div>
								<input type="checkbox" value="layer1" checked/>
								<label>layer1</label>
							</div>
						</div>
					</div>
					<div class="toolBar" style="width: 100%; height: auto">
						<div class="float-right" style="margin:1px">
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
					</div>
				</div>
			</div>
			<div title="图表" style="width: 100%; height: 100%">
				<table id="table" class="easyui-datagrid"
					style="width: 100%; height: 50%"
					data-options="url:'../track/json',fitColumns:true,singleSelect:true">
					<thead>
						<tr>
							<th data-options="field:'Country'">Country</th>
							<th data-options="field:'OrderID'">OrderID</th>
							<th data-options="field:'CustomerID'">CustomerID</th>
						</tr>
					</thead>
					<tbody>
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
				<div class="border" style="height: 235px">
					<div>test</div>
				</div>
				<div class="toolBar" style="width: 100%; height: auto">
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
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	/* require([ "myDojo/MyModel" ], function(myModel) {
		console.log(myModel);
	}) */
	$(function() {
		/* var map = new MapManager({map:"map"});
		map.init(); */
		initMap();
	})
	/* function tabChange(title, index) {
		if (title == "查询统计") {
			$("#tt").find(".tabs").css("width", window.innerWidth - 8 + "px")
					.css("padding-right", "4px");
			$("#tt").find(".tabs").find("li").css("float", "right").css(
					"margin-right", "4px");
		}
	} */
	function queryTest() {
		var url = "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer";
		var layerId = 0
		var sql = "FID < 900 and FID > 890";
		queryTask(url, layerId, sql);
	}
	function recQuery() {
		require([ "esri/toolbars/draw" ], function(Draw) {
			drawToolBar.activate(Draw.RECTANGLE);
		})
	}
</script>
</html>