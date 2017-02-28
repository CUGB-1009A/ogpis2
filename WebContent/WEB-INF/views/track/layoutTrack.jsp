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
<%@ include file="ArcGISAPI.jsp"%>
<!-- 加载自定义自定义tools函数  -->
<%@ include file="tools.jsp"%>
<!-- 加载自定义自定义echart函数 -->
<script type="text/javascript" src="../js/arcgis/echartOptions.js"></script>
<!-- 加载自定义样式 -->
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
</head>
<body>
	<div style="width: 100%; height: 100%" class="easyui-layout">
		<div id="tab1" class="easyui-tabs" style="height: 84px"
			data-options="border:false,region:'north'">
			<div title="查询统计">
				<div id="query" class="padding">
					<div class="inline-block">
						<label>查询条件:</label>
					</div>
					<div class="inline-block">
						<select name="field" class="select">
							<option>资源类型</option>
							<option>油气田名称</option>
							<option>年份</option>
						</select>
					</div>
					<div class="inline-block">
						<select name="relation" class="select">
							<option>全部</option>
							<option>大于</option>
							<option>大于或等于</option>
							<option>等于</option>
							<option>小于等于</option>
							<option>小于或等于</option>
							<option>不等于</option>
							<option>包含</option>
							<option>不包含</option>
						</select>
					</div>
					<div class="inline-block">
						<input type="text" class="select" placeholder="空值" name="value" />
					</div>
					<div class="inline-block">
						<button class="select" onclick="queryTest(this);">查询</button>
					</div>
					<!-- <div class="inline-block">
						<button class="select" onclick="recQuery();">框选</button>
					</div>
					<div class="inline-block">
						<button class="select" onclick="render();">渲染</button>
					</div> -->
				</div>
			</div>
			<div title="渲染设置" closable="true">
				<div id="render" class="padding">
					<!-- <div class="inline-block">
						<label>警戒条件1:</label> <select id="index" class="select">
							<option value="company">公司</option>
							<option>条件2</option>
							<option>条件3</option>
						</select>
					</div> -->
					<!-- <div class="inline-block">
						<label id="field2">警戒条件2:</label> <select id="year" class="select">
							<option>条件1</option>
							<option>条件2</option>
							<option>条件3</option>
						</select>
					</div> -->
					<div class="inline-block">
						<label id="field3">渲染字段:</label> <select id="index"
							class="select">
							<option value="company">公司名称</option>
							<option value="type">资源类型</option>
							<option value="value">指标值</option>
							<!-- <option>按</option> -->
							<!-- 目前只有油气田的位置信息，没有指标信息 -->
						</select>
					</div>
					<div class="inline-block">
						<button class="select" onclick="render();">渲染</button>
					</div>
				</div>
			</div>
		</div>
		<div id="tt" class="easyui-tabs"
			data-options="border:false,tabPosition:'right',headerWidth:50,region:'center'">
			<div title="地图">
				<div style="width: 100%; height: 100%;">
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
								<div class="mapInfoPanelStyle">
									<div class="mapInfoPanel-head">信息板</div>
									<div class="mapInfoPanel-body">
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
						</div>
					</div>
					<!-- <div>
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
					</div> -->
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
			<div title="图表" class="easyui-layout"
				style="width: 100%; min-width: 800px; height: 100%;">
				<div class="border"
					data-options="region:'center',border:false,onResize:panelResize">
					<div id="test" class="echart" style="width: 600px; height: 400px"></div>
				</div>
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
	function queryTest(obj) {
		var params = createParamsByDom(obj);
		var layoutParams = new SpaceAnalysisInfo({
			target : "layout",
			params : {
				company : "中石油",
				year : 2016,
				index : "oilReserve"
			}
		});
		getTargetOrLayoutInfo(layoutParams, projectPoint);
		updateTable("#table", params);
		/* mapManager.age="asd";
		console.log(mapManager);
		var options = {
			url : "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer",
			layerId : 0,
			sql : "FID < 900 and FID > 890"
		}
		queryTask(mapManager, options); */
	}
	function recQuery() {
		require([ "esri/toolbars/draw" ], function(Draw) {
			mapManager.drawToolBar.activate(Draw.RECTANGLE);
		})
	}
	function render() {
		/* initRender(mapManager, renderLayerId); */
		/* var info = new PolygonRenderInfo({
			layerId : "basin",
			matchField1 : "Name",
			renderField : "renderValue",
			matchField2 : "basinName",
			valueField : "oilProduce",
			values : [ 1, 10, 20, 30,40 ],
			params : {
				company : "中石油",
				year : 2015,
				index : "oilProduce"
			}
		}); */
		var info = new PointRenderInfo({
			symbols : Symbols.toArray("PointSymbol"),
			levels : 5,
			values : [ 1000, 2000, 3000, 4000, 5000, 6000 ],
			renderField : "mGasReserve"
		});
		renderPoint(info);
		/* require([ "esri/renderers/ClassBreaksRenderer",
				"esri/renderers/SimpleRenderer", "esri/layers/FeatureLayer",
				"dojo/_base/lang" ], function(ClassBreaksRenderer,
				SimpleRenderer, FeatureLayer, lang) {
			var graphics = mapManager.map.graphics.graphics;
			for (var i = 0; i < graphics.length; ++i) {
				var g = graphics[i];
				var v = g.attributes[""]
				g.setSymbol(info.symbols[(i % 4)]);
			}
		}); */
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

	var options = setChartOption(options1, {
		title : "油气资源布局跟踪",
		xAxisData : [ 2011, 2012, 2013, 2014, 2015, 2016 ],
		yAxisName : "万吨",
		yAxisData : [ 1000, 2000, 3000, 4000, 5000, 4500 ]
	});
	bindOptionToDiv("test", options);
	function panelResize(width, height) {
		$(this).children("div.echart")[0].style.width = $(this).width() - 17;
		$(this).children("div.echart")[0].style.height = $(this).height();
		echartResize($(this).children("div.echart")[0]);
	}
	//初始化查询、渲染的查询条件
	$(function() {
		append2("#render", "等级", null);
		var data1 = {
			company : [ "中石油", "中石化", "中海油" ],
			year : [ 2012, 2013, 2014, 2015, 2016 ],
			index : [ "石油产量", "天然气产量", "煤层气产量" ]
		};
		resetSelectDOM(data1, "#query");
		
		var layoutParams = new SpaceAnalysisInfo({
			target : "layout",
			params : {
				company : "中石油",
				year : 2016,
				index : "oilReserve"
			}
		});
		getTargetOrLayoutInfo(layoutParams, projectPoint);
		while(!mapManager.map.getLayer("basin"))
			mapManager.map.getLayer("basin").setVisibility(false);
		/* ajax({
			url : "url",
			params : {}
		}, resetSelectDOM, "#query"); */

		/* var data2 = {
			company : [ "中石油", "中石化", "中海油" ],
			year : [ 2012, 2013, 2014, 2015, 2016 ],
			index : [ "石油产量", "天然气产量", "煤层气产量" ]
		}; */
		/* ajax({
		url : "url",
		params : {}
		}, resetSelectDOM, "#query"); */
		/* resetSelectDOM(data2, "#render"); */
	});
</script>
</html>