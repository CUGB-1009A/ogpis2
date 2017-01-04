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
	<div
		style="width: 100%; height: 100%; dispaly: flex; flex-direction: column;">
		<div>
			规划名称
		</div>
		<!-- <div id="tab1" class="easyui-tabs" style="width: 100%; height: auto;"
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
		</div> -->
		<div class="easyui-panel" style="width:100%;overflow-y:auto" data-options="fit:true">
			<div style="width: 100%; height: 500px;">
				<div title="图表" class="easyui-layout" data-options="fit:true"
					style="width: 100%; min-width: 800px;">
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
					<div class="border" data-options="region:'center'"
						style="padding-right: 80px">
						<div id="test1" style="width: 70%; height: 400px;"></div>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 500px;">
				<div title="图表" class="easyui-layout" data-options="fit:true"
					style="width: 100%; min-width: 800px;">
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
					<div class="border" data-options="region:'center'"
						style="padding-right: 80px">
						<div id="test2" style="width: 70%; height: 400px;"></div>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 500px;">
				<div title="图表" class="easyui-layout" data-options="fit:true"
					style="width: 100%; min-width: 800px;">
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
					<div class="border" data-options="region:'center'"
						style="padding-right: 80px">
						<div id="test3" style="width: 70%; height: 400px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
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
			data : [ 2001, 2002, 2003, 2004, 2005, 2006 ]
		} ]
	}
	var myChart1 = echarts.init(document.getElementById("test1"));
	myChart1.setOption(option);
	var myChart2 = echarts.init(document.getElementById("test2"));
	myChart2.setOption(option);
	var myChart3 = echarts.init(document.getElementById("test3"));
	myChart3.setOption(option);
</script>
</html>