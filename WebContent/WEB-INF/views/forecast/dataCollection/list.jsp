<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/init.jsp"%>
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
							<option selected="selected">数据源</option>
							<option>URL地址</option>
							<option>查询函数</option>
							<option>查询条件</option>
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
						<th data-options="field:'name'" style="width: 15%">数据源</th>
						<th data-options="field:'type'" style="width: 20%">URL地址</th>
						<th data-options="field:'index'" style="width: 15%">查询函数</th>
						<th data-options="field:'scale'" style="width: 25%">查询条件</th>
						<th data-options="field:'layout'" style="width: 25%">描述信息</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>全国石油产量</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetData</td>
						<td>[{字段:公司名称;关系:!=;值:null}]</td>
						<td>全国石油产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>全国石油产量2</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetDataBySQL</td>
						<td>select * from 石油产量表 where 公司名称 != null</td>
						<td>全国石油产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>中石油石油产量</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetData</td>
						<td>[{字段:公司名称;关系:=;值:中石油}]</td>
						<td>中石油石油产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>中石油石油产量2</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetDataBySQL</td>
						<td>select * from 石油产量表 where 公司名称 = 中石油</td>
						<td>中石油石油产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>中石化天然气产量</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetData</td>
						<td>[{字段:公司名称;关系:=;值:中石化}]</td>
						<td>中石化天然气产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>中石化天然气产量2</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetDataBySQL</td>
						<td>select * from 天然气产量表 where 公司名称 = 中石化</td>
						<td>中石化天然气产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>全国天然气产量</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetData</td>
						<td>[{字段:公司名称;关系:!=;值:null}]</td>
						<td>全国天然气产量数据源的描述信息……</td>
					</tr>
					<tr>
						<td>全国天然气2</td>
						<td>http://192.168.198.52/Service1.asmx</td>
						<td>GetDataBySQL</td>
						<td>select * from 天然气产量表 where 公司名称 != null</td>
						<td>全国天然气产量数据源的描述信息……</td>
					</tr>
				</tbody>
			</table>
			<div id="dd" style="width:600px; height: 300px; display: none">Dialog
				Content.</div>
			<div id="content" style="display: none;">
				<div style="padding: 15px 0 0 15px; ">
					<label class="dialog-lable">数据源:</label> <input
						class="dialog-input" type="text" />
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">URL地址:</label> <input
						class="dialog-input" type="text" />
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">查询函数:</label> <select
						class="dialog-input">
						<option selected="selected">GetData</option>
						<option>GetDataBySQL</option>
					</select>
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">查询条件:</label> <input
						class="dialog-input" type="text" />
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">描述信息:</label> <input
						class="dialog-input" type="text" />
				</div>
				<!-- <div style="padding: 15px 0 0 15px;">
					<button class="dialog-lable" onClick="close()">确定</button>
					<button class="dialog-lable" onClick="close()">取消</button>
				</div> -->
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
			title : '新建数据源',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			content : $("#content").html(),
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