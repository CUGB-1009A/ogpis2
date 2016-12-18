<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<style type="text/css">

</style>
<script type="text/javascript">

$(function() {
	var datagrid = $('#datagrid');
	var h = $('body').height() - $('#listTb').height()-200;
	datagrid.datagrid(
					{
						border : false,
						height:h,
						fitColumns : true,
						singleSelect : true,
						rownumbers:true,
						url : '<%=path%>/forecast/getForecastRecord',
						pagination:true,
						toolbar: '#listTb',
						rowStyler: function(index,row){
							if (index==1){
								return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
							}
						},
						columns : [ [
								{
									field : 'forecastName',
									title : '预测成果名',
									width : 20
								},
								{
									field : 'forecastStep',
									title : '预测步骤',
									width : 20
								},
								{
									field : '_operate',
									title : '操作',
									width : 20,
									formatter : function(value,row,index) {
										var btn = '<a class="editcls" href="javascript:editRow('+index+',\''+row.id+'\')">编辑</a>'+
												  '<a class="deletecls" href="javascript:deleteRow(\''+index+'\',\''+row.id+'\')">删除</a>';
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

function deleteRow(index,id){//index为第几行，id为预测成果记录的id
	if(confirm("确定删除？")){
		$.ajax({
			url:"<%=path%>/forecast/deleteRecord",
			dataType:"json",
			async:true,
			data:{
				"id":id
				},
			type:"GET",
			success:function(result){
				$('#datagrid').datagrid('reload'); 
			},
			error:function(){
				alert("删除失败");
			}
		});
	}
}

function editRow(index,id){//index为第几行，id为预测成果记录的id
	window.location.href = "<%=path%>/forecast/toCreatePredictionPage?recordId="+id;
}

function createRecord(){
	 var name = prompt("请输入预测名称", ""); 
	 if(name){
		 $.ajax({
				url:"<%=path%>/forecast/createPrediction",
				dataType:"json",
				async:true,
				data:{
					"name":encodeURIComponent(name)
					},
				type:"GET",
				success:function(result){
					window.location.href = "<%=path%>/forecast/toCreatePredictionPage?recordId="+result.id;
				},
				error:function(){
					alert("新建失败");
				}
			});
	 }
}
</script>
</head>
<body class="easyui-layout">

	<div id="listTb" style="padding-bottom:0px">
		<a id="btn" href="javascript:createRecord()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">新建预测</a> 
		<input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查  询</a> 
	</div>
	<!-- 列表区域 -->
	<div id="list" style="text-align:center;padding:0px 5px 10px 5px">
		<table id="datagrid" class="easyui-datagrid .datagrid-btable">
		</table>
	</div> 

</body>
</html>