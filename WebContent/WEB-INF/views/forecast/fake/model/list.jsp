<%@ page isELIgnored ="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
<style type="text/css">
td, th {
	height: 35px;
	text-align: center
}
</style>

<script>

var option1 = {
		 title: { 
					 text: '石油储量',
					 left:'center'
				 },
		 tooltip: {
			 		 trigger: 'axis'
		 },
		  legend: {
		        data:['历史数据','预测数据'],
		        right:'right'
		    },
		 xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            name:"年份",
			            data : [2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025]
			        }
			    ],
			    yAxis : [
					        {
					            type : 'value',
					            name:'万吨'
					        }
					    ],
		 series: [
			          {
					     type: 'line',
					     name:'历史数据',
					     data: [12,20,31,44,62,79]
			          },
			          {
			        	  type: 'line',
 					  name:'预测数据',
 					  data: [10,18,30,45,66,79.5,100,118,150,240,380,550,570,580,648,880] 
			          }
		          ]
		}
		
$(function(){
	 //加载模型信息表
	var datagridModel = $('#modelGrid');
	var h = $('body').height() - $('#modelList').height()-$('#modelButtons').height()-70;
	datagridModel.datagrid({
				border : false,
				height:h,
				fitColumns : true,
				remoteSort:false,
				singleSelect : true,
				rownumbers:true,
				url : '<%=path%>/getAllModel',
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
								var option = '<input name="modelInfo" type="checkbox" value="'+value+'" />';
								return option;
							}
						},
						{
							field : 'modelName',
							sortable:true,
							title : '模型名称',
							width : 20
						},
						
						{
							field : 'jarName',
							title : 'jar包路径',
							width : 20,
						},
						 {
							field:'pem',
							title:'拟合方法',
							width:20
						 },
						{
							field : 'createTime',
							title : '时间',
							width : 20,
							formatter : function(value,row,index) {
								var year = value.year+1900;
								var month = value.month+1;
								var date = value.date;
								return year+"-"+month+"-"+date;
							}
						}
						] ],
				onLoadSuccess : function(data) {
					$('#dataSourceGrid').datagrid('fixRowHeight');//为了对齐行号
				},
				onClickCell : function(index,field,value){
					if(field!="id"){
						var myChart = echarts.init(document.getElementById("test"));
						myChart.setOption(option1);
						$("#modelIntroduction").dialog({
							closed:false
						});
					}
					
				}
			});
});

function addModel(){
	$("#modelAddDiv").dialog({
		closed:false
	});
}
function saveModel(){
	$("#modelAddDiv").dialog({
		closed:true
	});
}

function cancleSave(){
	$("#modelAddDiv").dialog({
		closed:true
	});
}

function jarCheck(){
	document.getElementById("check2").style.display="none";
	document.getElementById("check3").style.display="none";
	document.getElementById("check1").style.display="";
	document.getElementById("status").value="";
	setTimeout(function (){
		document.getElementById("check2").style.display="";
	},1000);
	setTimeout(function (){
		document.getElementById("check3").style.display="";
		var fileName = $("#jarInput").val();
		var fileSuffix = fileName.substring(fileName.lastIndexOf(".")+1);
		console.log(fileSuffix)
		if(fileSuffix=="jar"){
				document.getElementById("status").style.color = "green"
				document.getElementById("status").value="成功";
			}
		else{
				document.getElementById("status").style.color = "red"
				document.getElementById("status").value="失败";
			}
			
			
	},2000);
}
</script>
</head>
<body>
<div class="easyui-panel" title="模型列表" style="width:100%;height:100%;padding:10px;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
    <div id="modelList" style="padding-bottom:10px"> 
		查询条件：<input class="easyui-validatebox" type="text" name="modelName"/>   
		<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
	</div> 
       <div style="text-align:center;padding:0px 5px 10px 5px">
			<table id="modelGrid" class="easyui-datagrid .datagrid-btable"></table> 
			<div id="modelAddDiv" title="添加模型"  data-options="resizable:true,modal:true" style="width:600px; height: 450px; display: none"><!-- 添加模型div -->
				<div>
					<div style="padding: 15px 0 0 15px; ">
						<label class="dialog-lable">模型名称:</label> 
						<input id="dataSourceName" class="dialog-input" type="text"/>
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">模型介绍:</label> 
						<textarea class="dialog-input" style="resize: vertical"></textarea>
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">上传jar包:</label> 
						<input id="jarInput" type="file" onchange="jarCheck()"/>
					</div>
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">检查流程:</label> 
						<div class="dialog-input" style="padding:0px;border:1px solid grey;">
							 <span id="check1" style="display:none">检查接口</span><br>
							 <span id="check2" style="display:none">检查方法</span><br>
							 <span id="check3" style="display:none">完成</span><br>
						</div>					
					</div>
				
					<div style="padding: 15px 0 0 15px;">
						<label class="dialog-lable">状态：</label> 
						<textarea id="status" class="dialog-input" style="resize:none;" readonly></textarea>					
					</div>
					<div style="padding: 15px 0 0 15px;text-align:center">
						<button onclick="saveModel()">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="cancleSave()">取消</button>
					</div>
				</div>
			</div>
			<div id="modelIntroduction" title="模型介绍" data-options="resizable:true" style="width:600px; height: 500px; display: none"><!-- 介绍模型 -->
				<div style="width:100%;height:20%">
					<div style="padding: 10px;">
						模型介绍:<br>
						<div style="padding:10px;border:1px solid grey">在1953年，美国地质学家哈伯特（King Hubbert）
						大胆预言，美国石油出产将于1969年左右达到顶峰，达到了顶峰之后就会一直下降。虽然当时许多专家对他的预测提出质疑，
						但是在1970年，他所预见的情况真的发生了。从此以后，石油专家把这种情形叫做哈伯特顶点（Hubbert's peak）。</div>
					</div>
				</div>
				<div style="width:100%;height:80%;">
					<div style="padding: 10px;">
					样例数据:
						<div id="test" style="width:500px;height:300px;">
					
						</div>
					</div>
				</div>
		</div>
	</div> 
	<div id="modelButtons"style="text-align:center">
		<a id="modelAdd" href="javascript:addModel()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
		<a id="modelDelete" href="javascript:deleteDataSource()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a> 
		<a id="modelEdit" href="javascript:addDataSource()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>   
	</div> 
</div>  
</body>
<script type="text/javascript">

</script>
</html>