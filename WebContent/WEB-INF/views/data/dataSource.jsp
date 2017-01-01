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
<style type="text/css">
	td, th {
		height: 35px;
		text-align: center
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
<div class="easyui-panel" title="数据源列表" style="width:100%;height:100%;padding:10px;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
    <div id="dataSourceListTb" style="padding-bottom:10px"> 
   		主题：<select id="dataSourceSubject">
				<c:forEach items="${subjects}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</select>
		查询条件：<input class="easyui-validatebox" type="text" name="dataSourceName"/>   
		<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
	</div> 
       <div style="text-align:center;padding:0px 5px 10px 5px">
		<table id="dataSourceGrid" class="easyui-datagrid .datagrid-btable"></table> 
		<div id="dataSourceAddDiv" style="width:600px; height: 400px; display: none"><!-- 添加维度div -->
			<div>
				<div style="padding: 15px 0 0 15px; ">
					<label class="dialog-lable">数据源名称:</label> 
					<input id="dataSourceName" class="dialog-input" type="text"/>
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">主题:</label> 
					<select class="dialog-input" id="dataSource_subjectId" onchange="getInterfaceBysubject()">
						<c:forEach items="${subjects}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">接口表:</label> 
					<select class="dialog-input" id="dataSourceInterface" onchange="getFieldByInterface()">
						<c:forEach items="${interfaceTables}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div style="padding: 15px 0 0 15px;">
					<label class="dialog-lable">维度字段:</label> 
					<select class="dialog-input" id="dataSourceField" multiple="multiple">
						<c:forEach items="${fields}" var="item">
							<option value="${item.id}">${item.value}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div> 
	<div id="dataSourceButtons"style="text-align:center">
		<a id="dataSourceAdd" href="javascript:addDataSource()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
		<a id="dataSourceDelete" href="javascript:deleteDataSource()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
	</div> 
</div>
</body>
<script type="text/javascript">
function getFieldByInterface(){//根据接口表获取维度字段
	var interfaceId = $("#dataSourceInterface option:selected").val();
	 $.ajax({
			url:"<%=path%>/field/getFieldByInterface",
			dataType:"json",
			async:true,
			data:{
				"id":interfaceId
				},
			type:"GET",
			success:function(result){					   
				   if(result.status=='noField'){//该接口表下没有主题字段
					   $("#dataSourceField").empty();
					   alert(result.errInfo) 
				   }
				   if(result.status=='success'){//有主题字段
					   $("#dataSourceField").empty();
					   for(var i=0;i<result.fields.length;i++){
						   $("#dataSourceField").append('<option value="'+result.fields[i].id+'">'+result.fields[i].name+'</option>'); 
					   }
				   }
			},
			error:function(){
				alert("获取主题字段失败");
			}
		});
}

function getInterfaceBysubject(){//根据主题获取接口表
	var subjectId = $("#dataSource_subjectId option:selected").val();
	 $.ajax({
			url:"<%=path%>/interfaceTable/getInterfaceBysubject",
			dataType:"json",
			async:true,
			data:{
				"id":subjectId
				},
			type:"GET",
			success:function(result){
				   if(result.status=='noInterfaceTable'){//该主题下没有接口表，则也没有维度字段
					   $("#dataSourceInterface").empty();
					   $("#dataSourceField").empty();
					   alert(result.errInfo);
				   }
					   
				   if(result.status=='noField'){//该主题下的第一个接口表没有维度字段
					   $("#dataSourceInterface").empty();
					   $("#dataSourceField").empty();
					   for(var i=0;i<result.interfaceTable.length;i++){
						   $("#dataSourceInterface").append('<option value="'+result.interfaceTable[i].id+'">'+result.interfaceTable[i].name+'</option>'); 
					   }
					   alert(result.errInfo) 
				   }
				   if(result.status=='success'){//都有
					   $("#dataSourceInterface").empty();
					   $("#dataSourceField").empty();
					   for(var i=0;i<result.interfaceTable.length;i++){
						   $("#dataSourceInterface").append('<option value="'+result.interfaceTable[i].id+'">'+result.interfaceTable[i].name+'</option>'); 
					   }
					   for(var i=0;i<result.fields.length;i++){
						   $("#dataSourceField").append('<option value="'+result.fields[i].id+'">'+result.fields[i].name+'</option>'); 
					   }
				   }
			},
			error:function(){
				alert("获取接口表失败");
			}
		});	
}
 function addDataSource(){
	 $('#dataSourceAddDiv').dialog({
			title : '添加数据源',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[
			{
				text:'测试连接',
				handler:function(e){
					
				}
			},
			{
				text:'确定',
				handler:function(e)
				{
					var name = $("#dataSourceName").val();
					var dataSourceInterface = $("#dataSourceInterface").val();
					var dataSourceField = $("#dataSourceField").val();

					if(subjectIds==""||name==""||priority=="")
						{
						alert("信息填写不完整");
						return false;
						}
					 close(e);
					 $.ajax({
							url:"<%=path%>/dimension/save",
							dataType:"json",
							async:true,
							data:{
								"name":encodeURIComponent(name),
								"priority":priority,
								"subjectIds":subjectIds,
								"flag":"new",
								"isYear":isYear
								},
							type:"GET",
							success:function(result){
								$('#dimensionGrid').datagrid('reload');    
							},
							error:function(){
								alert("添加失败");
							}
						});
				}
			},{
				text:'取消',
				handler:function(e){close(e)}
			}]
		});
 }
 
 function close(e){//关闭添加、修改维度信息对话框，清空所填信息
	 $("#dataSourceName").val("");
	 $("#dataSource_subjectId").val("");
	 $("#dataSourceInterface").val("");
	 $("#dataSourceField").empty();
	/*  $('#dimensionAddDiv').dialog({
			closed : true,
		}); */
	}
</script>
</html>