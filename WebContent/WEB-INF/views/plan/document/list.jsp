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
	<div class="title" style="font-size:24px; font-family:微软雅黑;margin:10px 10px 10px 10px;">
		<span>文档管理</span>
	</div>
	<div style="text-align:right;margin:0 10px 0 10px">
		<table class="easyui-datagrid" title="资料管理" data-options="pagination:true">
			<thead>
				<tr>
					<th field='checkBox' width="10%"><input type="checkbox"/>全选</th>
					<th field='indexName' width="30%">文档名称</th>
					<th field="indexUnit" width="30%">上传时间</th>
					<th field="mineType" width="30%">对应规划</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>www</td>
					<td>www</td>
					<td>www</td>
					<td>www</td>
				</tr>
			</tbody>
		</table>
	
	</div>
	<script type="text/javascript">					
		
	</script>
</body>
</html>