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
									title : '',
									width : 0,
									formatter : function(value,row,index) {
										var option = '<input name="interface" type="checkbox" value="'+value+'" />';
										return option;
									}
								},
								{
									field : 'name_CN',
									sortable:true,
									title : '接口中文名称',
									width : 20
								},
								{
									field : 'name_EN',
									sortable:true,
									title : '接口英文名称',
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
									field:'subjects',
									title:'所属主题',
									width:20,
									formatter : function(value,row,index){
										var subjects = "" ;
										for(var i=0;i<value.length;i++)
											subjects += value[i].name + ";"
										return subjects.substring(0,subjects.length-1);
									}
								},
								{
									field : 'local',
									sortable:true,
									title : '是否是本地表',
									width : 20,
									formatter : function(value,row,index){
										var local = value?"是":"否";
											return local;
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
						<div style="padding: 10px 0 0 10px; ">
							<label class="dialog-lable">接口中文名：</label> 
							<input id="interfaceNameCN" class="dialog-input" type="text"/>
						</div>
						<div style="padding: 10px 0 0 10px; ">
							<label class="dialog-lable">接口英文名：</label> 
							<input id="interfaceNameEN" class="dialog-input" type="text"/>
						</div>
						<div style="padding: 10px 0 0 10px; ">
							<label class="dialog-lable">接口描述：</label> 
							<textarea id="interfaceDescription"  style="resize:none;"  class="dialog-input" rows="3"></textarea>
						</div>
						<div style="padding: 10px 0 0 10px;">
							<label class="dialog-lable">主题：</label> 
							<div class="dialog-input">
								<c:forEach items="${subjects}" var="item" varStatus="status">
									 <input name="interfaceSubject" type="checkbox" value="${item.id}" /><span style="font-size:12px">${item.name}</span>
									 <c:if test="${status.count%4==0}">
									 	<br>
									 </c:if>
								</c:forEach>
							</div>
						</div>
						<div style="padding: 10px 0 0 10px;">
							<label class="dialog-lable">是否是本地表：</label>
							<input name="isLocal" type="radio" value="true" checked/>是
							<input name="isLocal" type="radio" value="false" />否	
						</div>
					</div>
				</div>
			</div> 
			<div id="interfaceButtons"style="text-align:center">
				<a id="interfaceAdd" href="javascript:saveInterface('add')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
				<a id="interfaceEdit" href="javascript:saveInterface('edit')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a> 
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
							<label><input id="notyear" type="radio" name="year" value="false" checked/>不是</label> 
							<label><input id="isyear" type="radio" name="year" value="true"/>是</label> 
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
				<a id="dimensionAdd" href="javascript:addDimension('add')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
				<a id="dimensionEdit" href="javascript:editDimension('edit')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>   
				<a id="dimensionDelete" href="javascript:deleteDimension()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
			</div> 
	    </div>    
	</div> 
</body>
<script type="text/javascript">
/* ---------------------对接口进行操作开始------------------------------------ */

function clearinterfaceAddDiv(){//清空添加接口表的dialog中信息
	$("#interfaceNameCN").val("");
	$("#interfaceNameEN").val("");
	$("#interfaceDescription").val("");//可以不填写描述信息，所以这里对interfaceDescription不做判断
	$('input[name="interfaceSubject"]').each(function(){ 
		$(this).prop("checked",false);
	});
	$('input[name="isLocal"]').get(0).checked = true;
}

function showInterfaceMsg(id){//回显要修改的接口表信息
	clearinterfaceAddDiv();
	$.ajax({
		url:"<%=path%>/interfaceTable/getInterfaceMsg",
		dataType:"json",
		async:true,
		data:{
			"id":id	
			},
		type:"GET",
		success:function(result){ 
			$("#interfaceNameCN").val(result.name_CN);
			$("#interfaceNameEN").val(result.name_EN);
			$("#interfaceDescription").val(result.description);
			var subjectIds = [];
			for(var i=0;i<result.subjects.length;i++){
				subjectIds.push(result.subjects[i].id);
			}
			console.log(subjectIds);
			$('input[name="interfaceSubject"]').each(function(){ 
				if(subjectIds.indexOf($(this).val())!=-1)
					$(this).prop("checked",true) ;
			});
			$(":radio[name='isLocal'][value='" + result.local + "']").prop("checked", "checked");
		},
		error:function(){
			alert("读取接口表信息失败！");
		}
	});
}

function saveInterface(type){ //type='add' or 'edit' 判断是新加接口表还是修改接口表
	var interfaceIds = [];
	var title = "";
	if(type=='add'){
		title = "添加接口信息";
		clearinterfaceAddDiv(); //清空interfaceAddDiv中的勾选信息
	}
	if(type=='edit'){
		title = "修改接口信息";
		      $('input[name="interface"]:checked').each(function(){ 
		      interfaceIds.push($(this).val());
		});
		if(interfaceIds.length!=1){
			alert("只能并必须选择一条记录修改！");
			return false;
		}
		showInterfaceMsg(interfaceIds[0]);
	}
	$('#interfaceAddDiv').dialog({
		title : title,
		closed : false,
		cache : false,
		modal : true,
		resizable:true,
		buttons:[{
			text:'保存',
			handler:function(e)
			{
				var interfaceNameCN = $("#interfaceNameCN").val();
				if(interfaceNameCN==""){
					alert("请填写接口中文名！");
					return false;
				}
				var interfaceNameEN = $("#interfaceNameEN").val();
				if(interfaceNameEN==""){
					alert("请填写接口英文名！");
					return false;
				}
				var interfaceDescription = $("#interfaceDescription").val();//可以不填写描述信息，所以这里对interfaceDescription不做判断
				var subjectIds = [];
				      $('input[name="interfaceSubject"]:checked').each(function(){ 
				      subjectIds.push($(this).val());
				});
				if(subjectIds.length==0){
					alert("请至少选择一个主题！");
					return false;
				}
				var isLocal = $('input[name="isLocal"]:checked').val();
				$('#interfaceAddDiv').dialog({
					closed:true
				}); 
				$.ajax({
					url:"<%=path%>/interfaceTable/save",
					dataType:"json",
					async:true,
					data:{
						"id":interfaceIds[0],
						"type":type,
						"interfaceNameCN":encodeURIComponent(interfaceNameCN),
						"interfaceNameEN":encodeURIComponent(interfaceNameEN),
						"interfaceDescription":encodeURIComponent(interfaceDescription),
						"subjectIds":subjectIds,
						"isLocal":isLocal,	
						},
					type:"GET",
					success:function(result){
						$('#interfaceGrid').datagrid('reload');//新建完成后从新获取列表信息
					},
					error:function(){
						alert("保存接口表信息失败！");
					}
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

function deleteInterface(){
	var interfaceIds = [];
         $('input[name="interface"]:checked').each(function(){ 
	      interfaceIds.push($(this).val());
		 });
	if(interfaceIds.length==0){
		alert("至少选择一个接口表进行删除！");
		return false;
	}
	$.ajax({
		url:"<%=path%>/interfaceTable/delete",
		dataType:"json",
		async:true,
		data:{
			"ids":interfaceIds	
			},
		type:"GET",
		success:function(result){
			$('#interfaceGrid').datagrid('reload');//新建完成后从新获取列表信息
		},
		error:function(){
			alert("保存接口表信息失败！");
		}
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
					/* if(name==""||priority==""||subjectIds=="")
						{
						alert("信息填写不完整");
						return false;
						} */
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
				/* 	if(subjectIds==""||name==""||priority==""||dimensionValues=="")
						{
						alert("信息填写不完整");
						return false;
						} */
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