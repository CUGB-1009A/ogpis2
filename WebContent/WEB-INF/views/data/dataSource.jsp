<!-- 这是数据源信息维护jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础信息维护</title>
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
<script type="text/javascript"
	src="<%=path %>/js/DataSourceManager/DataSourceManagerInit.js"></script>
<script type="text/javascript"
	src="<%=path %>/js/DataSourceManager/ManagerObject.js"></script>
<script type="text/javascript"
	src="<%=path %>/js/DataSourceManager/ManagerFunction.js"></script>
<script type="text/javascript"
	src="<%=path %>/js/DataSourceManager/Tools.js"></script>
<style type="text/css">
td, th {
	height: 35px;
	text-align: center
}

.item-div {
	padding: 15px 0 0 15px;
}

.value-input {
	width: 115px
}
</style>
<script type="text/javascript">
 $(function(){
	 //加载维度信息表
	var datagridDataSource = $('#dataSourceGrid');
	var h = $('body').height() - $('#dataSourceListTb').height()-$('#dataSourceButtons').height()-70;
	datagridDataSource.datagrid({
				border : false,
				height:h,
				fitColumns : true,
				remoteSort:false,
				singleSelect : true,
				rownumbers:true,
				url : '<%=path%>/dataSourceList',
				pagination:true,
				rowStyler: function(index,row){
					if (index==1){
						return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
					}
				},
				columns : [ [
						{
							field : 'id',
							title : '<input name="dataSourceAll" type="checkbox" value=""/>',
							width : 0,
							formatter : function(value,row,index) {
								var option = '<input name="dataSource" type="checkbox" value="'+value+'" />';
								return option;
							}
						},
						{
							field : 'name',
							sortable:true,
							title : '数据源名称',
							width : 20
						},
						{
							field : 'createTime',
							title : '创建时间',
							width : 20,
							formatter : function(value,row,index) {
								var year = value.year+1900;
								var month = value.month+1;
								var date = value.date;
								return year+"-"+month+"-"+date;
							}
						},
						{
							field : 'description',
							title : '描述信息',
							width : 20,
						},
						 {
							field:'subject',
							title:'所属主题',
							width:20,
							formatter : function(value,row,index){
								return value.name;
							}
						}] ],
				onLoadSuccess : function(data) {
					$('#dataSourceGrid').datagrid('fixRowHeight');//为了对齐行号
				}
			});
 });
</script>
</head>
<body>
	<div class="easyui-panel" title="数据源列表"
		style="width: 100%; height: 100%; padding: 10px; background: #fafafa;"
		data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
		<div id="dataSourceListTb" style="padding-bottom: 10px">
			主题：<select id="dataSourceSubject">
				<c:forEach items="${subjects}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</select> 数据源名称：<input class="easyui-validatebox" type="text"
				name="dataSourceName" /> <a id="btn" href="javascript:void(0)"
				class="easyui-linkbutton"><i class="fa fa-search"
				style="margin-right: 3px"></i>查 询</a>
		</div>
		<div style="text-align: center; padding: 0px 5px 10px 5px">
			<table id="dataSourceGrid" class="easyui-datagrid .datagrid-btable"></table>
			<div id="dataSourceAddDiv"
				style="width: 600px; height: 400px; display: none">

				<!-- 添加数据源 第1步 -->
				<div id="step1">
					<div class="item-div">
						<label class="dialog-lable">数据源名称:</label> <input
							data-paramtype="value" data-prefix="DataSource" name="name"
							data-resume="none" data-submit="yes" class="dialog-input"
							type="text" />
					</div>
					<div class="item-div">
						<label class="dialog-lable">主题:</label> <select
							data-paramtype="value" data-prefix="DataSource.subject" name="id"
							data-submit="yes" class="dialog-input"
							data-target="tableList,realDSList" data-resume="select"
							onchange="getInterfaceBysubject(this)">
							<option value="null">未选择</option>
							<c:forEach items="${subjects}" var="item">
								<option value="${item.id}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="item-div">
						<label class="dialog-lable">数据源类型:</label>
						<div class="dialog-input" id="tableType">
							<input type="radio" value="table" data-paramtype="value"
								data-prefix="DataSource" name="dataType" value="table"
								data-target="dataType1" data-resume="checked" data-submit="yes"
								data-old="yes" onchange="radioChange(this)" checked /> <label>真实数据源</label>
							<input data-paramtype="value" data-prefix="DataSource"
								name="dataType" data-submit="no" data-old="no" type="radio"
								value="datasource" data-target="dataType2"
								onchange="radioChange(this)" /> <label>虚拟数据源</label>
						</div>
					</div>
					<div id="tables">
						<div id="dataType1">
							<div class="item-div">
								<label class="dialog-lable">接口表:</label> <select id="tableList"
									data-paramtype="value" data-prefix="DataSource.table" name="id"
									data-submit="yes" data-old="yes" class="dialog-input"
									data-resume="clear" onchange="">
								</select>
							</div>
						</div>
						<div id="dataType2" style="display: none">
							<div class="item-div">
								<label class="dialog-lable">维度名称:</label><input type="text"
									data-paramtype="value" data-prefix="DataSource" name="dimensionName" data-resume="none" data-submit="no"
									data-old="no" class="dialog-input" placeholder="维度名称" />
							</div>
							<div class="item-div">
								<label class="dialog-lable">真实数据源:</label>
								<div id="realDSList" class="dialog-input" data-resume="clear"
									style="display: inline-block; height: auto"></div>
							</div>
						</div>
					</div>
					<div class="item-div">
						<label class="dialog-lable">描述信息:</label>
						<textarea name="description" data-submit="yes" data-resume="none"
							data-paramtype="value" data-prefix="DataSource"
							name="description" class="dialog-input"></textarea>
					</div>
				</div>

				<!-- 添加数据源 第2步 -->
				<div id="step2" style="display: none">
					
					<div class="item-div">
						<label class="dialog-lable">计算方法:</label>
						<div class="dialog-input">
							<input type="radio" name="metricType" value="false"
								data-paramtype="sum" data-prefix="DataSourceMetric"
								data-submit="yes" data-old="yes" data-resume="checked"
								onchange="radioChange(this)" checked /> <label>求和</label> 
								<input
								data-paramtype="value" data-prefix="DataSourceMetric"
								name="metricType" type="radio" value="count"
								data-submit="no" data-old="no"
								onchange="radioChange(this)" /> <label>计数</label>
								<input
								data-paramtype="value" data-prefix="DataSourceMetric"
								name="metricType" type="radio" name="isMulti" value="average"
							 	data-submit="no" data-old="no"
								onchange="radioChange(this)" /> <label>平均</label>
						</div>
					</div>
					
					<div class="item-div">
						<label class="dialog-lable">度量值类型:</label>
						<div class="dialog-input">
							<input type="radio" name="isMulti" value="false"
								data-paramtype="value" data-prefix="DataSourceMetric"
								name="isMulti" data-target="valueType1" data-submit="yes"
								data-old="yes" data-resume="checked"
								onchange="radioChange(this)" checked /> <label>表字段</label> <input
								data-paramtype="value" data-prefix="DataSourceMetric"
								name="isMulti" type="radio" name="isMulti" value="true"
								data-target="valueType2" data-submit="no" data-old="no"
								onchange="radioChange(this)" /> <label>维度</label>
						</div>
					</div>
					<div>
						<div id="valueType1">
							<div class="item-div">
								<label class="dialog-lable">度量字段:</label> <select
									data-paramtype="value"
									data-prefix="DataSourceMetric.tableColumns" name="id"
									id="columnsList" data-submit="yes" data-old="yes"
									class="dialog-input" data-resume="clear" onchange="">
								</select>
							</div>
						</div>
						<div id="valueType2" style="display: none">
							<div class="item-div">
								<label class="dialog-lable">度量维度:</label> <select
									data-paramtype="value" data-prefix="DataSourceMetric.dimension"
									name="id" class="dialog-input" data-submit="no" data-old="no"
									data-target="dimensionValueList" data-resume="select"
									onchange="changeDimension(this)">
									<option value="null">未选择</option>
									<c:forEach items="${dimensions1}" var="item">
										<option value="${item.id}">${item.name}</option>
									</c:forEach>
								</select>
							</div>
							<div id="dimensionValueList" class="item-div" data-resume="clear"></div>
						</div>
					</div>
					<div class="item-div">
						<label class="dialog-lable">维度值列表:</label>
						<div class="dialog-input" id="dimensionList">
							<c:forEach items="${dimensions2}" var="item">
								<div data-paramtype="object" data-prefix="DataSourceField[]">
									<input type="checkbox" name="dimension.id" value="${item.id}"
										data-submit="no" data-old='no' data-resume="unchecked" /> <label
										data-label>${item.name}</label> <select
										data-prefix="dimensionValue-Column" name="tableColumns.id"
										data-submit="no" data-old='no' style="display: none">
									</select> <input type="radio" name="isX" data-submit="no" data-old='no'
										value="true" data-resume="unchecked" style="display: none"
										onchange="radioIsX(this)" /> <label style="display: none">设为X轴</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dataSourceButtons" style="text-align: center">
		<a id="dataSourceAdd"
			href="javascript:addDataSource('#dataSourceAddDiv')"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> <a
			id="dataSourceDelete" href="javascript:deleteDataSource()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	</div>
	</div>
</body>
<script type="text/javascript">
function getFieldByInterface(obj){//根据接口表获取维度字段
	var interfaceId=$(obj).children("option:selected").val();
	if(interfaceId!="null"&&interfaceId!=null)
		 $.ajax({
				url:"<%=path%>/interfaceTable/getColumnsById",
				dataType : "json",
				async : true,
				data : {
					"interfaceId" : interfaceId
				},
				type : "POST",
				success : function(result) {
					if(result instanceof Array){
						   var key=$(obj).data("target");
						   var container=$("#"+key);
						   container.empty();
						   for(var i=0;i<result.length;++i){
							   container.append(DomTools.createDSItem(result[i]),i);
						   }
					   }
				},
				error : function() {
					alert("接口表字段获取失败");
				}
			});
	else{
		
	}
}
	
	function getInterfaceBysubject(obj) {//根据主题获取接口表
		var subjectId = $(obj).children("option:selected").val();
		if(subjectId!="null"&&subjectId!=null)
		$.ajax({
			url : "<%=path%>/dataSource/getTableAndRealDS",
						dataType : "json",
						async : true,
						data : {
							"subjectId" : subjectId
						},
						type : "GET",
						success : function(result) {
							if (result instanceof Object) {
								var list = $(obj).data("target").split(",");

								var list0 = $("#" + list[0]);
								list0.empty();
								var data0 = result[list[0]];
								for (var i = 0; i < data0.length; ++i) {
									list0.append(DomTools
											.createTableItem(data0[i]), i);
								}

								var list1 = $("#" + list[1]);
								list1.empty();
								var data1 = result[list[1]];
								for (var i = 0; i < data1.length; ++i) {
									list1.append(DomTools.createDSItem(
											data1[i], i));
								}
							}
						},
						error : function() {
							alert("获取接口表失败");
						}
					});
		else {
			var list = $(obj).data("target").split(",");
			var list0 = $("#" + list[0]);
			list0.empty();
			var list1 = $("#" + list[1]);
			list1.empty();
		}
	}

	var DomTools = {
		createDSItem : function(data) {
			var div = $("<div data-paramtype='object' data-prefix='DataSource.children[]'></div>");
			div
					.append("<input data-submit='no' data-old='no' name='id' value='"+data.id+"' type='checkbox' />");
			div.append("<label>" + data.name + "</label>");
			div
					.append("<input data-submit='no' data-old='no' name='dimensionValue' class='value-input' style='display:none' placeholder='维度值' />")
			return div;
		},
		createDimensionItem : function(data, value, content) {
			var div = $("<div ></div>");
			div.append("<input type='checkbox' name='' data-submit='no' value='"+data[value]+"'> <label>"
							+ data[content] + "</label>");
			var select = $("<select class='dialog-input' data-submit='no' name=''></select>");
			var selectData = $("#valueType2").data("columns");
			$.each(selectData, function() {
				select.append(createOption(this, "id", "name"));
			});
			div.append(select);
			return div;
		},
		createTableItem : function(data) {
			return "<option value='"+data.id+"'>" + data.name_CN + "</option>";
		},
		createOption : function(data, value, content) {
			return "<option value='"+data[value]+"'>" + data[content]
					+ "</option>";
		}
	}

	function getAjaxParamFromDom(id) {
		var params = {};
		var prefix = {};
		$("#" + id).find("input,select,textarea").each(
				function(content, prefix) {
					var obj = $(this);
					if (obj.data("submit") && obj.data("submit") == "yes") {
						if (obj.data("prefix")) {
							var prefixKey = obj.data("prefix");
							if (prefix[prefixKey] == null) {
								prefix[prefixKey] = 0;
							} else {
								prefix[prefixKey]++;
							}
							content[prefixKey
									+ "["
									+ parseInt(prefix[prefixKey]
											/ parseInt(obj.data("num"))) + "]."
									+ this.name] = obj.val();
						} else
							content[this.name] = obj.val();
					}
				}, [ params, prefix ]);
		return params;
	}

	$(function() {

	})
</script>
</html>