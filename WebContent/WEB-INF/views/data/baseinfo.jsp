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
									title : '',
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
									width : 25
								},
								{
									field : 'createTime',
									title : '创建时间',
									width : 25,
									formatter : function(value,row,index) {
										var year = value.year+1900;
										var month = value.month+1;
										var date = value.date;
										return year+"-"+month+"-"+date;
									}
								},
								{
									field : 'year',
									title : '是否为年份',
									width : 25,
									formatter : function(value,row,index){
										return value?'是':'否';
									}
								},
								{
									field : 'metric',
									title : '是否是度量值',
									width : 25,
									formatter : function(value,row,index){
										return value?'是':'否'
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
				按接口中文名查询：<input class="easyui-validatebox" type="text" name="interfaceName"/>   
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
				<div id="tableColumnsDiv" style="width:560px; height: 360px; display: none">
					<table id="tableColumnsGrid">
					</table> 
				</div>
			</div> 
			<div id="interfaceButtons"style="text-align:center">
				<a id="interfaceAdd" href="javascript:saveInterface('add')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
				<a id="interfaceEdit" href="javascript:saveInterface('edit')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a> 
				<a id="interfaceDelete" href="javascript:deleteInterface()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
				<a id="tableColumnsEdit" href="javascript:tableColumnsEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-large-smartart'">编辑表字段</a>  
			</div> 
	    </div>
	    
	    <div title="维度表维护" style="padding:10px;display:none;">  
	    	<div id="dimensionListTb" style="padding-bottom:10px"> 
				按维度名查询：<input class="easyui-validatebox" type="text" name="dimensionName"/>   
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
			</div> 
	        <div style="text-align:center;padding:0px 5px 10px 5px">
				<table id="dimensionGrid" class="easyui-datagrid .datagrid-btable"></table> 
				<div id="dimensionAddDiv" style="width:600px; height: 250px; display: none"><!-- 添加维度div -->
					<div>
						<div style="padding: 15px 0 0 15px; ">
							<label class="dialog-lable">维度名:</label> 
							<input id="dimensionName" class="dialog-input" type="text"/>
						</div>
						<div style="padding: 15px 0 0 15px;">
							<label class="dialog-lable">是否是年份值:</label> 
							<label><input id="notyear" type="radio" name="year" value="false" checked/>否</label> 
							<label><input id="isyear" type="radio" name="year" value="true"/>是</label> 
						</div>
						<div style="padding: 15px 0 0 15px;">
							<label class="dialog-lable">是否是度量值:</label> 
							<label><input id="notMetric" type="radio" name="metric" value="false" checked/>否</label> 
							<label><input id="isMetric" type="radio" name="metric" value="true"/>是</label> 
						</div>
					</div>
				</div>
				<div id="dimensionValueDiv" style="width:650px; height: 400px; display: none">
					<table id="dimensionValueGrid">
					</table> 
				</div>
			</div> 
			<div id="dimensionButtons"style="text-align:center">
				<a id="dimensionAdd" href="javascript:saveDimension('add')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
				<a id="dimensionEdit" href="javascript:saveDimension('edit')" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>    
				<a id="dimensionDelete" href="javascript:deleteDimension()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
				<a id="dimensionValueEdit" href="javascript:editDimensionValue()" class="easyui-linkbutton" data-options="iconCls:'icon-large-smartart'">编辑维度值</a>   

			</div> 
	    </div>    
	</div> 
</body>
<script type="text/javascript">
/* ---------------------对维度进行操作开始------------------------------------ */
function saveDimension(type){//保存维度信息
	var dimensionIds = [] ;
	var title;
	if(type=='add'){
		title = "添加维度信息";
	}
	if(type=='edit'){
		title = "修改维度信息";
		$('input[name="dimension"]:checked').each(function(){ 
		      dimensionIds.push($(this).val());
		});
		if(dimensionIds.length!=1){
			alert("只能并必须选择一条记录修改！");
			return false;
		}
		 $.ajax({
				url:"<%=path%>/dimension/getDimensionInfo",
				dataType:"json",
				async:true,
				data:{
					"id":dimensionIds[0]
					},
				type:"GET",
				success:function(result){
					if(result.year){
						document.getElementById("isyear").checked = true;
					}
					if(result.metric){
						document.getElementById("isMetric").checked = true;
					}
					$("#dimensionName").val(result.name);
				},
				error:function(){
					alert("获取维度信息失败");
					return false;
				}
			});
	}
	$('#dimensionAddDiv').dialog({
		title : title,
		closed : false,
		cache : false,
		modal : true,
		resizable:true,
		buttons:[{
			text:'确定',
			handler:function(e)
			{
				var name = $("#dimensionName").val();
				var isYear = $("input[name='year']:checked").val();
				var isMetric = $("input[name='metric']:checked").val();
				if(name=="")
					{
					alert("请填写维度名称！");
					return false;
				}
				 close(e);
				 $.ajax({
						url:"<%=path%>/dimension/save",
						dataType:"json",
						async:true,
						data:{
							"name":encodeURIComponent(name),
							"type":type,
							"id":dimensionIds[0],
							"isMetric":isMetric,
							"isYear":isYear
							},
						type:"GET",
						success:function(result){
							$('#dimensionGrid').datagrid('reload');    
						},
						error:function(){
							alert("保存失败");
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
			var dimensionIds = [] ;
			$("input[name='dimension']:checked").each(function(){
				dimensionIds.push($(this).val());
			});
			 $.ajax({
					url:"<%=path%>/dimension/delete",
					dataType:"json",
					async:true,
					data:{
						"ids":dimensionIds
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
	
	function close(e){//关闭添加、修改维度信息对话框，清空所填信息
		document.getElementById("notyear").checked = true;
		document.getElementById("notMetric").checked = true;
		$("#dimensionName").val("");
		$('#dimensionAddDiv').dialog({
			closed : true,
		});
	}
	
function editDimensionValue(){//编辑维度值
	var dimensionIds = [];
	$('input[name="dimension"]:checked').each(function(){ 
		      dimensionIds.push($(this).val());
		});
		if(dimensionIds.length!=1){
			alert("只能且必须选择一个服务接口表！");
			return false;
		}
		$('#dimensionValueDiv').dialog({
			title : '编辑维度值',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[{
				text:'返回',
				handler:function(e){
					$('#dimensionValueDiv').dialog({
						closed:true
					});
				}
			},
			{
				text:'添加',
				handler:function(e){
					newColumnsRow1();
				}
			}]
		});
		$.ajax({
			url:"<%=path%>/dimension/getDimensionInfo",
			dataType:"json",
			async:true,
			data:{
				"id":dimensionIds[0]	
				},
			type:"GET",
			success:function(result){ 
				$("#dimensionValueGrid").empty();
				$("#dimensionValueGrid").append("<tr><td>维度值显示名</td><td>维度值真实值</td><td>排序</td><td>操作</td></tr>")
				for(var i=0;i<result.orederdDimensionValue.length;i++){
					if(!result.orederdDimensionValue[i].deleted)
						$("#dimensionValueGrid").append("<tr><td>"+result.orederdDimensionValue[i].displayValue+"</td><td>"+result.orederdDimensionValue[i].value+"</td><td>"+result.orederdDimensionValue[i].priority+"</td><td>"+"<input type='button' value='编辑' onclick='editColumnsRow1(this,\""+result.orederdDimensionValue[i].id+"\")'><input type='button' value='删除' onclick='deleteColumnsRow1(this,\""+result.orederdDimensionValue[i].id+"\")'>"+"</td></tr>")
				}
			},
			error:function(){
				alert("读取接口表信息失败！");
			}
		});
}
function newColumnsRow1(){
	$("#dimensionValueGrid").append("<tr><td><input type='text' value=''></td><td><input type='text' value=''></td><td><input type='text' value=''></td><td>"+"<input type='button' value='确定' onclick='editColumnsRow1(this,\"\")'><input type='button' value='删除' onclick='deleteColumnsRow1(this,\"\")'>"+"</td></tr>")
	
}

function editColumnsRow1(dom,dimensionValueId){
	var str = $(dom).val()=="编辑"?"确定":"编辑";  
	if($(dom).val()=="确定"){
		saveColumnsRow1(dom,dimensionValueId);
	}
     $(dom).parent().siblings("td").each(function() {  // 获取当前行的其他单元格
            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
            if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以编辑
                $(this).html("<input type='text' value='"+$(this).text()+"'>");
            else   // 如果已经存在文本框，则将其显示为文本框修改的值
                $(this).html(obj_text.val()); 
       });
	 $(dom).val(str);   // 按钮被点击后，在“编辑”和“确定”之间切换
}

function saveColumnsRow1(dom,dimensionValueId){
	var type = 'update';
	var displayValue = $(dom).parent().parent().find('input').eq(0).val();
	var value = $(dom).parent().parent().find('input').eq(1).val();
	var priority = $(dom).parent().parent().find('input').eq(2).val();
	var dimensionId ;
	$('input[name="dimension"]:checked').each(function(){ 
		     dimensionId = $(this).val();
		});
	if(dimensionValueId==""){
		type = 'new';
	}
	$.ajax({
		url:"<%=path%>/dimensionValue/save",
		dataType:"json",
		async:true,
		data:{
			"dimensionId":dimensionId,
			"displayValue":encodeURIComponent(displayValue),
			"value":encodeURIComponent(value),
			"priority":priority,
			"type":type,
			"id":dimensionValueId,
			},
		type:"GET",
		success:function(result){ 
			console.log(result.id);//此处将两个按钮重写一下就行了
			var temp = $(dom).parent();
			$(dom).parent().empty();
			temp.append("<input type='button' value='编辑' onclick='editColumnsRow1(this,\""+result.id+"\")'><input type='button' value='删除' onclick='deleteColumnsRow1(this,\""+result.id+"\")'>");
		},
		error:function(){
			alert("删除字段失败！");
		}
	});
	
}

function deleteColumnsRow1(dom,dimensionValueId){
	if(dimensionValueId==""){
		$(dom).parent().parent().remove();
		return ;
	}
	$.ajax({
		url:"<%=path%>/dimensionValue/delete",
		dataType:"json",
		async:true,
		data:{
			"id":dimensionValueId	
			},
		type:"GET",
		success:function(result){ 
			$(dom).parent().parent().remove();
		},
		error:function(){
			alert("删除字段失败！");
		}
	});
}
/* ---------------------对维度进行操作结束------------------------------------ */


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

function deleteInterface(){ //批量删除接口表
	var interfaceIds = [];
         $('input[name="interface"]:checked').each(function(){ 
	      interfaceIds.push($(this).val());
		 });
	if(interfaceIds.length==0){
		alert("至少选择一个接口表进行删除！");
		return ;
	}
	if(!confirm("你确定要删除所选维度吗？")){
		return ;
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
 
function tableColumnsEdit(){//编辑表字段
	var interfaceIds = [];
	$('input[name="interface"]:checked').each(function(){ 
		      interfaceIds.push($(this).val());
		});
		if(interfaceIds.length!=1){
			alert("只能且必须选择一个服务接口表！");
			return false;
		}
		$('#tableColumnsDiv').dialog({
			title : '编辑表字段信息',
			closed : false,
			cache : false,
			modal : true,
			resizable:true,
			buttons:[{
				text:'返回',
				handler:function(e){
					$('#tableColumnsDiv').dialog({
						closed:true
					});
				}
			},
			{
				text:'添加',
				handler:function(e){
					newColumnsRow();
				}
			}]
		});
		$.ajax({
			url:"<%=path%>/interfaceTable/getInterfaceMsg",
			dataType:"json",
			async:true,
			data:{
				"id":interfaceIds[0]	
				},
			type:"GET",
			success:function(result){ 
				$("#tableColumnsGrid").empty();
				$("#tableColumnsGrid").append("<tr><td>字段中文名</td><td>字段英文名</td><td>操作</td></tr>")
				for(var i=0;i<result.tableColumns.length;i++){
					if(!result.tableColumns[i].deleted)
						$("#tableColumnsGrid").append("<tr><td>"+result.tableColumns[i].name+"</td><td>"+result.tableColumns[i].code+"</td><td>"+"<input type='button' value='编辑' onclick='editColumnsRow(this,\""+result.tableColumns[i].id+"\")'><input type='button' value='删除' onclick='deleteColumnsRow(this,\""+result.tableColumns[i].id+"\")'>"+"</td></tr>")
				}
			},
			error:function(){
				alert("读取接口表信息失败！");
			}
		});
}
function newColumnsRow(){
	$("#tableColumnsGrid").append("<tr><td><input type='text' value=''></td><td><input type='text' value=''></td><td>"+"<input type='button' value='确定' onclick='editColumnsRow(this,\"\")'><input type='button' value='删除' onclick='deleteColumnsRow(this,\"\")'>"+"</td></tr>")
	
}

function editColumnsRow(dom,tableColumnsId){
	var str = $(dom).val()=="编辑"?"确定":"编辑";  
	if($(dom).val()=="确定"){
		saveColumnsRow(dom,tableColumnsId);
	}
     $(dom).parent().siblings("td").each(function() {  // 获取当前行的其他单元格
            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
            if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以编辑
                $(this).html("<input type='text' value='"+$(this).text()+"'>");
            else   // 如果已经存在文本框，则将其显示为文本框修改的值
                $(this).html(obj_text.val()); 
       });
	 $(dom).val(str);   // 按钮被点击后，在“编辑”和“确定”之间切换
}

function saveColumnsRow(dom,tableColumnsId){
	var type = 'update';
	var name = $(dom).parent().parent().find('input').eq(0).val();
	var code = $(dom).parent().parent().find('input').eq(1).val();
	var tableId ;
	$('input[name="interface"]:checked').each(function(){ 
		     tableId = $(this).val();
		});
	if(tableColumnsId==""){
		type = 'new';
	}
	$.ajax({
		url:"<%=path%>/tableColumns/save",
		dataType:"json",
		async:true,
		data:{
			"tableId":tableId,
			"name":encodeURIComponent(name),
			"code":encodeURIComponent(code),
			"type":type,
			"id":tableColumnsId,
			},
		type:"GET",
		success:function(result){ 
			console.log(result.id);//此处将两个按钮重写一下就行了
			var temp = $(dom).parent();
			$(dom).parent().empty();
			temp.append("<input type='button' value='编辑' onclick='editColumnsRow(this,\""+result.id+"\")'><input type='button' value='删除' onclick='deleteColumnsRow(this,\""+result.id+"\")'>");
		},
		error:function(){
			alert("删除字段失败！");
		}
	});
	
}

function deleteColumnsRow(dom,tableColumnsId){
	if(tableColumnsId==""){
		$(dom).parent().parent().remove();
		return ;
	}
	$.ajax({
		url:"<%=path%>/tableColumns/delete",
		dataType:"json",
		async:true,
		data:{
			"id":tableColumnsId	
			},
		type:"GET",
		success:function(result){ 
			$(dom).parent().parent().remove();
		},
		error:function(){
			alert("删除字段失败！");
		}
	});
}
/* ---------------------对接口进行操作结束------------------------------------ */
</script>
</html>