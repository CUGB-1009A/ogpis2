<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
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
						url : '<%=path%>/system/role/getData',
						pagination:true,
						toolbar: '#listTb',
						columns : [ [
								{
									field : 'name',
									title : '角色名',
									width : 20
								},
								{
									field : 'priority',
									title : '排序',
									width : 40
								},
								{
									field : 'isSuper',
									title : '超级管理员',
									width : 40
								},								
								{
									field : '_operate',
									title : '操作',
									width : 50,
									align : 'center',
									formatter : function(value,row,index) {
										var btn = '<a class="editcls" onclick="" >编辑</a>'+
												  '<a class="deletecls" onclick="javascript:del('+index+')">删除</a>';
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

function editUser(index){  
	$('#datagrid').datagrid('selectRow',index);// 关键在这里  
    var row = $('#dg').datagrid('getSelected');  
    alert(row);
//     if (row){  
//         $('#dlg').dialog('open').dialog('setTitle','修改学生信息');  
//         $('#fm').form('load',row);  
//         url = '${ctx}updateStudent.do?id='+row.id;  
//     }  
} 
//删除权限
function del(index){
	$.messager.confirm('确认框', '您确定要删除所选的数据吗?', function(r) {
		$('#datagrid').datagrid('selectRow',index);// 关键在这里  
		var row = $('#datagrid').datagrid('getSelected');  
		if (row != null&&row.id!=null){
			alert(row.id);
			var url = '<%=path%>/system/role/delete?id='+ row.id;
			$.ajax( {   
			    type : "POST",   
			    url :'<%=path%>/system/role/delete', 
			    data : {
			      'id' : row.id
			     },  
			    dataType: "text",   
			    success : function(data) {   
			        if(data=="success"){   
			            alert("删除权限成功！");
			            $("#datagrid").datagrid("reload");   
			        }   
			        else{   
			            alert("删除权限失败，请稍后再试！");   
			        }   
			    },   
			    error :function(){   
			        alert("网络连接出错！");   
			    }   
			});   
		}
	});
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',iconCls:'icon-lock',title:'&nbsp系统管理&nbsp;&gt;&gt;&nbsp;权限管理'">
	<div id="listTb">
		<a id="btn" href="#" class="easyui-linkbutton" plain="true"  data-options="iconCls:'icon-add'">添加权限</a> 
	</div>
	<!-- 列表区域 -->
	<div id="list" style="text-align:center;padding:10px 5px 2px 5px">
		<table id="datagrid" class="easyui-datagrid" />
	</div> 
</div>
</body>
</html>