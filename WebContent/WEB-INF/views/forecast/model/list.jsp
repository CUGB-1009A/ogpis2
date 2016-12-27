<%@ page isELIgnored ="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							<option selected="selected">模型名称</option>
							<option>Jar包名</option>
							<option>类名</option>
							<option>描述信息</option>
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
							<option selected="selected">全国石油产量</option>
							<option>全国石油储量</option>
							<option>全国石油新增储量</option>
							<option>全国天然气产量</option>
							<option>全国天然气储量</option>
							<option>全国天然气新增储量</option>
						</select>
					</div>
					<div class="inline-block">
						<button class="select" onclick="queryTest();">查询</button>
					</div>
					<div class="inline-block">
						<button class="select" onclick="create();">新建</button>
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
						<th data-options="field:'name'" style="width: 25%">模型名称</th>
						<th data-options="field:'type'" style="width: 25%">Jar包名</th>
						<th data-options="field:'index'" style="width: 25%">类名</th>
						<th data-options="field:'layout'" style="width: 25%">描述信息</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>冈伯茨</td>
						<td>Gompertz</td>
						<td>Compertz</td>
						<td>适合累计储量的预测</td>
					</tr>
					<tr>
						<td>翁氏旋回</td>
						<td>Possion</td>
						<td>Possion</td>
						<td>适合当年产量的预测</td>
					</tr>
					<tr>
						<td>哈伯特</td>
						<td>Hubbert</td>
						<td>Hubbert</td>
						<td>适合油气储量的预测</td>
					</tr>
				</tbody>
			</table>
			<div id="dd" style="width:600px; height: 400px; display: none">
				<div id="content">
					<div style="padding: 15px 0 0 15px; ">
						<label class="dialog-lable">模型名称:</label> <input
							class="dialog-input" type="text" />
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">Jar包名:</label> <input
							class="dialog-input" type="text" />
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">类名:</label> <input
							class="dialog-input" type="text" />
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">选择文件:</label> <input
							class="dialog-input" type="file" />
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">描述信息:</label> 
						<textArea class="dialog-input" style="resize:none;height:100px"></textArea>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#table").datagrid({
			onDblClickCell : function(index, field, value) {
				if (field == "index")
					window.location = "../track/index1";
				if (field == "scale")
					window.location = "../track/index";
				if (field == "layout")
					window.location = "../track/index";
			}
		});
	})
	function create() {
		$('#dd').dialog({
			title : '新建模型',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[{
				text:'确定',
				handler:function(e){close(e)}
			},{
				text:'取消',
				handler:function(e){close(e)}
			}]
		});
	}
	function close(e){
		$('#dd').dialog({
			closed : true,
		});
	}
</script>
</html>