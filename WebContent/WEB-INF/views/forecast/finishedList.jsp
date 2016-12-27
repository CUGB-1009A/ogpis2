<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
<style type="text/css">
td, th {
	height: 45px;
	text-align: center
}
</style>
<script type="text/javascript">
$(function() {
	var datagrid = $('#datagrid');
	var h = $('body').height() - $('#listTb').height();
	datagrid.datagrid(
					{
						border : false,
						height:h,
						fitColumns : true,
						singleSelect : true,
						rownumbers:true,
						url : '<%=path%>/forecast/getFinishedForecastRecord',
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
									title : '预测名',
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
										var btn = '<a class="sharecls" href="javascript:editRow('+index+',\''+row.id+'\')">共享</a>'+
												  '<a class="showcls" href="javascript:editRow(\''+index+'\',\''+row.id+'\')">查看结果</a>'+
												  '<a class="deletecls" href="javascript:deleteRow(\''+index+'\',\''+row.id+'\')">删除</a>';
										return btn;
									}
								} ] ],
						onLoadSuccess : function(data) {
							$('.sharecls').linkbutton({
								text : '共享',
								iconCls : 'fa fa-cloud'
							});
							$('.deletecls').linkbutton({
								text : '删除',
								iconCls : 'fa fa-remove'
							});
							$('.showcls').linkbutton({
								text : '查看结果',
								iconCls : 'fa fa-eye'
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
		$('#dd').dialog({
			title : '新建预测',
			closed : false,
			cache : true,
			modal : true,
			resizable:true,
			buttons:[{
				text:'确定',
				handler:function(e)
				{
					var name = $("#forecastName").val();	
					var type = $("#forecastType option:selected").val();
					close(e);
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
</head>
<body class="easyui-layout">

	<div id="listTb" style="padding-bottom:0px">
		<input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
	</div>
	<!-- 列表区域 -->
	<div id="list" style="text-align:center;padding:0px 5px 10px 5px">
		<table id="datagrid" class="easyui-datagrid .datagrid-btable">
		</table>
		<div id="dd" style="width:600px; height: 300px; display: none">
			<div id="content">
				<div style="padding: 15px 0 0 15px; ">
					<label class="dialog-lable">预测名:</label> 
					<input id="forecastName" class="dialog-input" type="text" value="" />
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">预测类型:</label> 
					<select class="dialog-input" id="forecastType">
						<c:forEach items="${forecastType}" var="item">
							<option value="${item.id}">${item.type}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div> 

</body>
</html>