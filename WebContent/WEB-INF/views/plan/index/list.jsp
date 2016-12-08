<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>规划指标管理</title>
</head>
<body>
	<div class="title">
		<h3><b>规划指标项定制</b></h3>
	</div>
	<div style="text-align:right;">
		<select>
			<option>全国</option>
			<option>中石化</option>
			<option>中海油</option>
			<option>延长石油</option>
			<option>中联煤</option>
			<option>其他   </option>
		</select>
		<a href="<%=path%>/index/add?type=${type}">添加指标</a>
	</div>
	<div class="easyui-panle">
		<table class="easyui-datagrid" title="指标项管理" data-options="iconCls:'icon-save',collapsible:true,maximizable:true">
			<thead>
				<tr>
					<th data-options="field:'IndexName'">指标名称</th>
					<th data-options="field:'IndexUnit'">指标单位</th>
					<th data-options="field:'MineType'">矿种类型</th>
					<th data-options="field:'IndexType'">指标类型</th>
					<th data-options="field:'priority'">显示顺序</th>
					<th data-options="field:' ',width:50">操作</th>
				</tr>
			</thead>
		</table>
	
	</div>
</body>
</html>