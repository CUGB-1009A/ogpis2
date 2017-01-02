<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
<style type="text/css">
td, th {
	height: 35px;
	text-align: center
}
</style>
<script type="text/javascript">

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
		
$(function() {
	var datagrid = $('#datagrid');
	var h = $('body').height() - $('#listTb').height()-50;
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
									title : '预测名称',
									width : 15
								},
								{
									field : 'user',
									title : '用户',
									width : 15,
									formatter : function(value,row,index) {
										return value.name;
									}
								},
								{
									field : 'createTime',
									title : '完成时间',
									width : 20,
									formatter : function(value,row,index) {
										var year = value.year+1900;
										var month = value.month+1;
										var date = value.date;
										return year+"-"+month+"-"+date;
									}
								},
								{
									field : 'forecastType',
									title : '目标',
									width : 20,
									formatter : function(value,row,index) {
										return value.type;
									}
								},
								{
									field : 'shared',
									title : '操作',
									width : 20,
									formatter : function(value,row,index) {
										var btn = '<a class="sharecls" href="javascript:void(0)">共享</a>'+
												  '<a class="deletecls" href="javascript:void(0)">删除</a>'+
												  '<a class="showcls" href="javascript:void(0)">重新预测</a>'
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
								text : '重新预测',
								iconCls : 'fa fa-eye'
							});
							$('#datagrid').datagrid('fixRowHeight');//为了对齐行号
						},
						onClickRow : function(index,row){
							var myChart = echarts.init(document.getElementById("test4"));
							myChart.setOption(option1);
							$('#forecastView').dialog({
								closed:false
							});
						}
					});
});

</script>
</head>
<body class="easyui-layout">
<div id="forecastView" title="查看详情" style="width:800px;height:400px;display:none"   
        data-options="resizable:true,modal:true">   
	<div style="width:100%;height:100%">
		<div style="width:25%;height:100%;float:left;">
			<div style="padding: 10px;">
				<span>预测名称:</span> 
				<span>石油储量预测</span>
			</div>
			<div style="padding: 10px;">
				<span>预测目标:</span> 
				<span>储量预测</span>
			</div>
			<div style="padding: 10px;">
				<span>数据源:</span> 
				<span>全国新增探明地质储量</span>
		   	</div>
		   	<div style="padding: 10px;">
				<span>模型名称:</span> 
				<span>哈伯特模型</span>
		   	</div>
		   	<div style="padding: 10px;">
				<span>拟合方法:</span> 
				<span>最小二乘法</span>
		   	</div>
		   	<div style="padding: 10px;">
				<span>预测时间:</span> 
				<span>2010-2025</span>
		   	</div>
		   	<div style="padding: 10px;">
		   		自定义拟合参数：
		   		<div style="text-align:center" id="pemParams">
		   			a:12<br>
		   			b:23<br>
		   			K:43<br>
		   		</div>
		   			
		   	</div>
		</div>
		<div style="width:75%;height:100%;float:left;">
			<div id="test4" style="height:350px;width:550px;">
			</div>
		</div>
	</div>
</div>
	<div class="easyui-panel" title="已完成预测" style="width:100%;height:100%;padding:10px;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
		<div id="listTb" style="padding-bottom:0px">
			<input type="checkbox"/>只显示我的预测 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			目标主题：<select id="forecastType">
				<c:forEach items="${forecastType}" var="item">
					<option value="${item.id}">${item.type}</option>
				</c:forEach>
			</select>
			<input class="easyui-validatebox" type="text" name="name"/>   
			<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
		</div>
	<!-- 列表区域 -->
		<div id="list" style="text-align:center;padding:0px">
			<table id="datagrid" class="easyui-datagrid .datagrid-btable">
			</table>
		</div>
</div>

</body>
</html>