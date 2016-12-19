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
	<div style="width: 100%; height: 100%;dispaly:flex;flex-direction: column;">
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
		<div title="图表"
			style="width: 100%; height:88%;display: flex; flex-direction: row;flex-grow:10;flex-shrink:1">
			<table id="table" class="easyui-datagrid"
				style="width: 20%; height: 100%;flex-grow:1;flex-shrink:1;"
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
			<div class="border" style="width: 80%;flex-grow:1;flex-shrink:1;">
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
</body>
<script type="text/javascript">
	
</script>
</html>