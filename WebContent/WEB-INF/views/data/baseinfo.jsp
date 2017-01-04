<!-- 维护维度信息和接口信息的jsp -->

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
	var datagridDimension = $('#dimensionGrid');
	var h = $('body').height() - $('#dimensionListTb').height()-$('#dimensionButtons').height()-130;
	datagridDimension.datagrid({
						border : false,
						height:h,
						fitColumns : true,
						remoteSort:false,
						singleSelect : true,
						rownumbers:true,
						url : '<%=path%>/dimensionList',
						pagination:true,
						rowStyler: function(index,row){
							if (index==1){
								return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
							}
						},
						columns : [ [
								{
									field : 'id',
									title : '<input name="dimensionAll" type="checkbox" value=""/>',
									width : 0,
									formatter : function(value,row,index) {
										var option = '<input name="dimension" type="checkbox" value="'+value+'" />';
										return option;
									}
								},
								{
									field : 'name',
									sortable:true,
									title : '维度名称',
									width : 20
								},
								{
									field : 'dimensionValue',
									title : '维度值',
									width : 20,
									formatter : function(value,row,index){
										var result = "";
										for(var i=0;i<value.length;i++){
											result += value[i].value +"；";
										}
										result = result.substring(0,result.length-1);
										return result;
									}
								},
								 {
									field:'subject',
									title:'所属主题',
									width:20,
									formatter : function(value,row,index){
										var result = "";
										for(var i=0;i<value.length;i++){
											result += value[i].name +"；";
										}
										result = result.substring(0,result.length-1);
										return result;
									}
								}, 
							/* 	{
									field : 'createTime',
									title : '创建时间',
									width : 20,
									formatter : function(value,row,index) {
										var year = value.year+1900;
										var month = value.month+1;
										var date = value.date;
										return year+"-"+month+"-"+date;
									}
								}, */
								{
									field : 'year',
									title : '是否为年份',
									width : 20,
									formatter : function(value,row,index){
										if(value==true)
											return "是";
										if(value==false)
											return "不是";
									}
								}] ],
						onLoadSuccess : function(data) {
							$('#dimensionGrid').datagrid('fixRowHeight');//为了对齐行号
						}
					});
	//加载接口信息表
	var datagridInterface = $('#interfaceGrid');
	datagridInterface.datagrid({
						border : false,
						height:h,
						fitColumns : true,
						remoteSort:false,
						singleSelect : true,
						rownumbers:true,
						url : '<%=path%>/interfaceList',
						pagination:true,
						rowStyler: function(index,row){
							if (index==1){
								return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
							}
						},
						columns : [ [
								{
									field : 'id',
									title : '<input name="interfaceAll" type="checkbox" value=""/>',
									width : 0,
									formatter : function(value,row,index) {
										var option = '<input name="interface" type="checkbox" value="'+value+'" />';
										return option;
									}
								},
								{
									field : 'name',
									sortable:true,
									title : '接口名称',
									width : 20
								},
								{
									field : 'description',
									title : '接口描述',
									width : 20
								},
								{
									field : 'field',
									title : '维度信息',
									width : 20,
									formatter : function(value,row,index){
										var result = "";
										for(var i=0;i<value.length;i++){
											result += value[i].value +"；";
										}
										result = result.substring(0,result.length-1);
										return result;
									}
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
							$('#interfaceGrid').datagrid('fixRowHeight');//为了对齐行号
						}
					});
	
});

</script>
</head>
<body>
	<div class="easyui-tabs" style="width:100%;height:100%;">   
	    <div title="服务接口表维护" data-options="closable:false" style="overflow:auto;padding:10px;display:none;">   
	        <div id="interfaceListTb" style="padding-bottom:10px"> 
	    		主题：<select id="interfaceSubject">
						<c:forEach items="${subjects}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				查询条件：<input class="easyui-validatebox" type="text" name="interfaceName"/>   
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
			</div> 
	        <div style="text-align:center;padding:0px 5px 10px 5px">
				<table id="interfaceGrid" class="easyui-datagrid .datagrid-btable"></table> 
				<div id="interfaceAddDiv" style="width:600px; height: 400px; display: none"><!-- 添加维度div -->
					<div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">接口名称:</label> 
							<input id="interfaceName" class="dialog-input" type="text"/>
						</div>
						<div style="padding: 15px 0 0 15px;">
							<label class="dialog-lable">主题（可多选）:</label> 
							<select class="dialog-input" id="interface_subjectId" multiple="multiple">
								<c:forEach items="${subjects}" var="item">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">排序（数字）:</label> 
							<input id="interfacePriority" class="dialog-input easyui-numberbox" type="text"/>
						</div>
					</div>
				</div>
			</div> 
			<div id="interfaceButtons"style="text-align:center">
				<a id="interfaceAdd" href="javascript:addInterface()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
				<a id="interfaceEdit" href="javascript:editInterface()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a> 
				<a id="interfaceDelete" href="javascript:deleteInterface()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
			</div> 
	    </div>
	    
	    <div title="维度表维护" style="padding:10px;display:none;">  
	    	<div id="dimensionListTb" style="padding-bottom:10px"> 
	    		主题：<select id="dimensionSubject">
						<c:forEach items="${subjects}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				查询条件：<input class="easyui-validatebox" type="text" name="dimensionName"/>   
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
			</div> 
	        <div style="text-align:center;padding:0px 5px 10px 5px">
				<table id="dimensionGrid" class="easyui-datagrid .datagrid-btable"></table> 
				<div id="dimensionAddDiv" style="width:600px; height: 400px; display: none"><!-- 添加维度div -->
					<div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">维度名:</label> 
							<input id="dimensionName" class="dialog-input" type="text"/>
						</div>
						<div style="padding: 15px 0 0 15px;">
							<label class="dialog-lable">主题（可多选）:</label> 
							<select class="dialog-input" id="dimension_subjectId" multiple="multiple">
								<c:forEach items="${subjects}" var="item">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<div style="padding: 15px 0 0 15px;">
							<label class="dialog-lable">是否是年份:</label> 
							<label><input id="notyear" type="radio" name="year" value="no" checked/>不是</label> 
							<label><input id="isyear" type="radio" name="year" value="yes"/>是</label> 
						</div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">排序（数字）:</label> 
							<input id="dimensionPriority" class="dialog-input easyui-numberbox" type="text"/>
						</div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">维度值（分隔符；）:</label> 
							<input id="dimensionValue" class="dialog-input" type="text"/>
						</div>
					</div>
				</div>
			</div> 
			<div id="dimensionButtons"style="text-align:center">
				<a id="dimensionAdd" href="javascript:addDimension()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
				<a id="dimensionEdit" href="javascript:editDimension()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>   
				<a id="dimensionDelete" href="javascript:deleteDimension()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
			</div> 
	    </div>    
	</div> 
</body>
<script type="text/javascript">
/* ---------------------对接口进行操作开始------------------------------------ */
function addInterface(){
	$('#interfaceAddDiv').dialog({
		title : '添加接口信息',
		closed : false,
		cache : false,
		modal : true,
		resizable:true,
		buttons:[{
			text:'保存',
			handler:function(e)
			{
				$('#interfaceAddDiv').dialog({
					closed:true
				});
			}
		},{
			text:'取消',
			handler:function(e){
				$('#interfaceAddDiv').dialog({
					closed:true
			});
				}
		}]
	});
}
 
 
 
 
 
/* ---------------------对接口进行操作结束------------------------------------ */



/* ---------------------对维度进行操作开始------------------------------------ */
	function editDimension(){//编辑维度信息
		var number =$("input[name='dimension']:checked").length;
		if(number!=1){
			alert("只能选择一条记录进行操作");
			return false;
		}
		var id = $("input[name='dimension']:checked").val();
		 $.ajax({
				url:"<%=path%>/dimension/getDimensionInfo",
				dataType:"json",
				async:true,
				data:{
					"id":id
					},
				type:"GET",
				success:function(result){
					if(result.year=="true"){
						document.getElementById("isyear").checked = true;
					}
					$("#dimensionValue").val(result.dimensionValues);
					$("#dimensionName").val(result.name);
					$('#dimensionPriority').numberbox('setValue', result.priority);
					$("#dimension_subjectId option").each(function(){
						for(var i=0;i<result.ids.length;i++){
							if($(this).val()==result.ids[i])
								$(this).attr("selected",true);
						}
					});
				},
				error:function(){
					alert("获取维度信息失败");
					return false;
				}
			});
		$('#dimensionAddDiv').dialog({
			title : '修改维度信息',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[{
				text:'确定',
				handler:function(e)
				{
					var subjectIds = "";
					var dimensionValues = $("#dimensionValue").val();
					var name = $("#dimensionName").val();
					var priority = $("#dimensionPriority").val();
					var isYear = $("input[name='year']:checked").val();
					$("#dimension_subjectId option:selected").each(function(){
						subjectIds += $(this).val()+";";
					});
					if(name==""||priority==""||subjectIds=="")
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
								"flag":"update",
								"id":id,
								"dimensionValues":encodeURIComponent(dimensionValues),
								"isYear":isYear
								},
							type:"GET",
							success:function(result){
								$('#dimensionGrid').datagrid('reload');    
							},
							error:function(){
								alert("修改失败");
							}
						});
				}
			},{
				text:'取消',
				handler:function(e){close(e)}
			}]
		});
		
	}
	
	function deleteDimension(){
		var number =$("input[name='dimension']:checked").length;
		if(number<1){
			alert("请至少选择一条记录再删除");
			return false;
		}
		if(confirm("你确定要删除所选维度吗？")){
			var ids = "";
			$("input[name='dimension']:checked").each(function(){
				ids += $(this).val()+";";
			});
			 $.ajax({
					url:"<%=path%>/dimension/delete",
					dataType:"json",
					async:true,
					data:{
						"ids":ids
						},
					type:"GET",
					success:function(result){
						$('#dimensionGrid').datagrid('reload');    
					},
					error:function(){
						alert("删除失败");
					}
				});
		}		
	}
	
	function addDimension(){ //添加维度信息
		$('#dimensionAddDiv').dialog({
			title : '添加维度信息',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[{
				text:'确定',
				handler:function(e)
				{
					var subjectIds = "";
					var dimensionValues = $("#dimensionValue").val();
					var name = $("#dimensionName").val();
					var priority = $("#dimensionPriority").val();
					var isYear = $("input[name='year']:checked").val();
					$("#dimension_subjectId option:selected").each(function(){
						subjectIds += $(this).val()+";";
					});
					if(subjectIds==""||name==""||priority==""||dimensionValues=="")
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
								"dimensionValues":encodeURIComponent(dimensionValues),
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
		document.getElementById("notyear").checked = true;
		$("#dimensionName").val("");
		$('#dimensionPriority').numberbox('setValue', '');
		$("#dimension_subjectId").val("");
		$("#dimensionValue").val("");
		$('#dimensionAddDiv').dialog({
			closed : true,
		});
	}
/* ---------------------对维度进行操作结束------------------------------------ */
</script>
</html>