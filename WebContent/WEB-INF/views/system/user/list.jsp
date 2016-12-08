<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<script type="text/javascript">
$(function() {
	var datagrid = $('#datagrid');
	var h = $('body').height() - $('#listTb').height() - 97;
	datagrid.datagrid(
					{
						border : false,
						height:h,
						fitColumns : true,
						singleSelect : true,
						rownumbers:true,
						url : '<%=path%>/system/user/getData',
						pagination:true,
						toolbar: '#listTb',
						columns : [ [
								{
									field : 'loginId',
									title : '登录名',
									width : 20
								},
								{
									field : 'name',
									title : '用户名',
									width : 40
								},
								{
									field : '_operate',
									title : '操作',
									width : 50,
									align : 'center',
									formatter : function(value,row,index) {
										var btn = '<a class="editcls" onclick="" href="javascript:void(0)">编辑</a>'+
												  '<a class="deletecls" onclick="" href="javascript:void(0)">删除</a>';
										return btn;
									}
								} ] ],
						onLoadSuccess : function(data) {
							$('.editcls').linkbutton({
								text : '编辑',
								plain : true,
								iconCls : 'icon-edit'
							});
							$('.deletecls').linkbutton({
								text : '删除',
								plain : true,
								iconCls : 'icon-cancel'
							});
							$('#datagrid').datagrid('fixRowHeight');//为了对齐行号
						}
					});
});

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',iconCls:'icon-lock',title:'&nbsp系统管理&nbsp;&gt;&gt;&nbsp;用户管理'">
	<div id="listTb">
		<a id="btn" href="#" class="easyui-linkbutton" plain="true"  data-options="iconCls:'icon-add'">添加用户</a> 
	</div>
	<!-- 列表区域 -->
	<div id="list" style="text-align:center;padding:10px 5px 2px 5px">
		<table id="datagrid" class="easyui-datagrid" />
	</div> 
</div>
</body>
</html>