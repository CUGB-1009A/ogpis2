<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>完成情况管理</title>
</head>
<body style="text-align:center">
	<div>
		<div style="margin:10px 10px 10px 10px;text-align:center">
			<span>完成情况管理</span>
			<a href="<%=path %>/plan/toEditPage" style="float:right" class="easyui-linkbutton" 
				data-options="iconCls:'icon-add',size:'middle'">
				添加规划
			</a>
		</div>
		<div style="margin:20px 10px 10px 10px;text-align:center">
			<table class="easyui-datagrid" title="规划管理" cellpadding="5" style="margin:0 auto;text-align:center">
				<thead>
					<tr>
						<th field="规划名称">规划名称</th>
						<th field="规划类型">规划类型</th>
						<th field="信息">信息</th>
						<th field="操作">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>十一五</td>
						<td>全国</td>
						<td>
							<b iconCls="icon-edit">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-lock'">取消发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip'">预览</a>
						</td>
					</tr>
					<tr>
						<td>十二五</td>
						<td>全国</td>
						<td>
							<b iconCls="icon-edit">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-lock'">取消发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip'" href="<%=path%>/plan/toPreview">预览</a>
						</td>
					</tr>
					<tr>
						<td>找矿突破战略行动总体方案第一阶段</td>
						<td>三五八</td>
						<td>							
							<b data-options="iconCls:'icon-edit',size:'small'">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit',size:'small'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',size:'middle'">发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',size:'middle'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip',size:'middle'">预览</a>
						</td>
					</tr>
					<tr>
						<td>找矿突破战略行动总体方案第二阶段</td>
						<td>三五八</td>
						<td>							
							<b data-options="iconCls:'icon-edit',size:'small'">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit',size:'small'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',size:'middle'">发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',size:'middle'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip',size:'middle'">预览</a>
						</td>
					</tr>
					<tr>
						<td>找矿突破战略行动总体方案第三阶段</td>
						<td>三五八</td>
						<td>							
							<b data-options="iconCls:'icon-edit',size:'small'">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit',size:'small'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',size:'middle'">发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',size:'middle'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip',size:'middle'">预览</a>
						</td>
					</tr>
					<tr>
						<td>“十二五”中国石油油气资源勘探开发规划</td>
						<td>中石油</td>
						<td>							
							<b data-options="iconCls:'icon-edit',size:'small'">文档个数&nbsp;&nbsp;3</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">指标个数&nbsp;&nbsp;4</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b data-options="iconCls:'icon-edit',size:'small'">收藏&nbsp;&nbsp;1</b>
						</td>
						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit',size:'small'">编辑</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-filter',size:'middle'">发布</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove',size:'middle'">删除</a>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-tip',size:'middle'">预览</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>	
	<script type="text/javascript">
		
	</script>
</body>
</html>