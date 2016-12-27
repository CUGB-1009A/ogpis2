<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../init.jsp"%>
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
<style type="text/css">
td, th {
	height: 45px;
	text-align: center
}
</style>

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
		style="width: 100%; height: 100%; display: flex; flex-direction: row; flex-direction: column;">
		<div style="width: 100%; display: flex; justify-content: flex-end;">
			<div title="警戒设置">
				<div class="padding">
					<div class="inline-block">
						<select id="field1Value" class="select">
							<option selected="selected">规划名称</option>
							<option>规划类型</option>
							<option>指标统计</option>
							<option>规模跟踪</option>
							<option>布局跟踪</option>
						</select>
					</div>
					<div class="inline-block">
						<select id="field2Value" class="select">
							<option selected="selected">等于</option>
							<option>不等于</option>
							<option>大于</option>
							<option>小于</option>
							<option>包含</option>
						</select>
					</div>
					<div class="inline-block">
						<select id="field3Value" class="select">
							<option>十三五规划</option>
							<option>中石油十三五规划</option>
							<option>中海油十三五规划</option>
						</select>
					</div>
					<div class="inline-block">
						<button class="select" onclick="queryTest();">查询</button>
					</div>
				</div>
			</div>
		</div>
		<div title="图表"
			style="width: 100%; height: 88%; display: flex; flex-direction: row; flex-grow: 10; flex-shrink: 1">
			<table id="table" class="easyui-datagrid table"
				style="width: 100%; height: 100%; flex-grow: 1; flex-shrink: 1;">
				<thead>
					<tr>
						<th data-options="field:'name'" style="width: 30%">规划名称</th>
						<th data-options="field:'type'" style="width: 30%">规划类型</th>
						<th data-options="field:'index'" style="width: 40%">规划指标跟踪</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>十三五规划</td>
						<td>全国</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					
					</tr>
					<tr>
						<td>十二五规划</td>
						<td>全国</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>				
					</tr>
					<tr>
						<td>十一五规划</td>
						<td>全国</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					</tr>
					<tr>
						<td>中石油十三五规划</td>
						<td>中石油</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					</tr>
					<tr>
						<td>中石化十三五规划</td>
						<td>中石化</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					</tr>
					<tr>
						<td>中海油十三五规划</td>
						<td>中海油</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					</tr>
					<tr>
						<td>中联煤十三五规划</td>
						<td>中联煤</td>
						<td><a href="../track/indexTrack">规划指标跟踪描述信息……<a></td>
					</tr>
				</tbody>
			</table>
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
	$(function() {
		$("#table").datagrid({
			onDblClickCell : function(index, field, value) {
				if (field == "index")
					window.location = "../track/indexTrack";
				if (field == "scale")
					window.location = "../track/targetTrack";
				if (field == "layout")
					window.location = "../track/layoutTrack";
			}
		});
	})
</script>
</html>