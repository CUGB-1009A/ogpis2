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

var forecastName ;
var forecastType ;
var dataSourceName;
var modelName ;
var pemName ;
$(function() {
	var datagrid = $('#datagrid');
	var h = $('body').height() - $('#listTb').height()-75;
	datagrid.datagrid(
					{
						border : false,
						height:h,
						fitColumns : true,
						singleSelect : true,
						remoteSort:false,
						rownumbers:true,
						url : '<%=path%>/forecast/getUnfinishedForecastRecord',
						pagination:true,
						toolbar: '#listTb',
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
									field : 'forecastName',
									title : '预测名',
									width : 20
								},
								{
									field : 'createTime',
									title : '时间',
									/* sortable:true, */
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
								}] ],
						onLoadSuccess : function(data) {
							$('.editcls').linkbutton({
								text : '编辑',
								iconCls : 'fa fa-edit'
							});
							$('.deletecls').linkbutton({
								text : '删除',
								iconCls : 'fa fa-remove'
							});
							$('#datagrid').datagrid('fixRowHeight');//为了对齐行号
						}
					});
	$(":radio[name='forecastTime']").click(function(){//时间选择方式有两种：一种是长中短期、一种是自定义时间段
		if($(this).val()=='4'){
			$('#s4_beginYear').attr('disabled',false);
			$('#s4_endYear').attr('disabled',false);
		}
		else{
			$('#s4_beginYear').attr('disabled',true);
			$('#s4_endYear').attr('disabled',true);
		}
	});
});

function inputPEM(){//判断自定义拟合参数是否选中
	if($('#inputPEM').is(':checked'))
		document.getElementById("pemParams").style.display="";
	else
		document.getElementById("pemParams").style.display="none";
}

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
		$('#s1_addForecast').dialog({
			closed:false
		});
}


function s1_next(){
	forecastName = $('#s1_forecastName').val();
	forecastType = $('#s1_forecastType option:selected').text();
	forecastTypeId = $('#s1_forecastType').val()
	if(forecastName==""){
		alert("请填写预测名称");
		return false;
	}
	$('#s2s_forecastName').html(forecastName);
	$('#s2s_forecastType').html(forecastType);
	$('#s1_addForecast').dialog({
		closed:true
	});
	$('#s2s_dataSource').dialog({
		closed:false
	});
}

function s1_saveExit(){
	$('#s1_addForecast').dialog({
		closed:true
	});
}
function s1_cancel(){
	$('#s1_addForecast').dialog({
		closed:true
	});
}

function s2s_previous(){
	
	$('#s1_addForecast').dialog({
		closed:false
	});
	$('#s2s_dataSource').dialog({
		closed:true
	});
}
function s2s_next(){
	$('#s3_forecastName').html(forecastName);
	$('#s3_forecastType').html(forecastType);
	dataSourceName = $('#s2s_data option:selected').text();
	$('#s3_data').html(dataSourceName);
	$('#s2s_dataSource').dialog({
		closed:true
	});
	$('#s3_modelInfo').dialog({
		closed:false
	});
	var myChart = echarts.init(document.getElementById("test3"));
	myChart.setOption(option);
}
function s2s_saveExit(){
	$('#s2s_dataSource').dialog({
		closed:true
	});
}
function s2s_cancel(){
	$('#s2s_dataSource').dialog({
		closed:true
	});
}

function s3_previous(){
	$('#s2s_dataSource').dialog({
		closed:false
	});
	$('#s3_modelInfo').dialog({
		closed:true
	});
}
function s3_next(){
	modelName = $('#s3_modelName option:selected').text();
	pemName =  $('#s3_pemName option:selected').text();
	$('#s4_forecastName').html(forecastName);
	$('#s4_forecastType').html(forecastType);
	$('#s4_data').html(dataSourceName);
	$('#s4_modelName').html(modelName);
	$('#s4_pemName').html(pemName);
	$('#s3_modelInfo').dialog({
		closed:true
	});
	$('#s4_forecast').dialog({
		closed:false
	});
}
function s3_saveExit(){
	$('#s3_modelInfo').dialog({
		closed:true
	});
}
function s3_cancel(){
	$('#s3_modelInfo').dialog({
		closed:true
	});
}

function s4_previous(){
	$('#s4_forecast').dialog({
		closed:true
	});
	$('#s3_modelInfo').dialog({
		closed:false
	});
}
function s4_saveExit(){
	$('#s4_forecast').dialog({
		closed:true
	});
}
function s4_finish(){
	$('#s4_forecast').dialog({
		closed:true
	});
}
function s4_cancel(){
	$('#s4_forecast').dialog({
		closed:true
	});
}

var option = {
		 title: { 
					 text: '石油新增探明地质储量',
					 left:'center'
				 },
		 tooltip: {
			 		 trigger: 'axis'
		 },
		 toolbox:{
			 show : true,
 		   		feature : {
 		       		saveAsImage : {show: true}
		 		}
		 },
		 xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            name:"年份",
			            data : [1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960]
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
					     data: [1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960]
			          }
		          ]
		}
		
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

function s2s_previewData(){
	var myChart = echarts.init(document.getElementById("test1"));
	myChart.setOption(option);
}

function s4_predict1(){
	var myChart = echarts.init(document.getElementById("test4"));
	myChart.setOption(option1);
}
function s4_predict2(){
	var myChart = echarts.init(document.getElementById("test4"));
	myChart.setOption(option1);
}
</script>
</head>
<body class="easyui-layout">

<!-- ************第一步新建估测弹出框*********** -->
<div id="s1_addForecast" title="新建预测（第1步/共4步）" style="width:600px;height:200px;display:none"   
        data-options="resizable:true,modal:true">   
	<div>
		<div style="padding: 15px 0 0 15px; ">
			<label class="dialog-lable">预测名称:</label> 
			<input id="s1_forecastName" class="dialog-input" type="text" value="" />
			<!-- <button>检查</button> -->
		</div>
		<div style="padding: 15px 0 0 15px;">
			<label class="dialog-lable">预测目标:</label> 
			<select class="dialog-input" id="s1_forecastType">
				<c:forEach items="${forecastType}" var="item">
					<option value="${item.id}">${item.type}</option>
				</c:forEach>
			</select>
		</div>
		<div style="text-align:center;padding-top:10px">
			<button onclick="s1_next()">下一步</button>
			<button onclick="s1_saveExit()">保存退出</button>
			<button onclick="s1_cancel()">取消</button>
		</div>
	</div>
</div>

<!-- ************第二步--选择单数据源框*********** -->
<div id="s2s_dataSource" title="数据源选择-单数据源（第2步/共4步）" style="width:800px;height:450px;display:none"   
        data-options="resizable:true,modal:true">
	<div style="width:100%;height:90%">
		<div style="width:40%;height:100%;float:left">
			<div style="padding: 10px;">
				<span>预测名称:</span> 
				<span id="s2s_forecastName"></span>
			</div>
			<div style="padding: 10px;">
				<span>预测目标:</span> 
				<span id="s2s_forecastType"></span>
			</div>
			<div style="padding: 10px;">
				数据源：
				<select id="s2s_data">
					<option value="1">石油数据</option>
					<option value="2">天然气数据</option>
					<option value="3">煤层气数据</option>
					<option value="4">页岩气数据</option>
				</select>
				<button>显示所有数据源</button>
			</div>
			<div style="padding: 10px;">
				查询条件：<br/><br/> 
		   			<div style="padding:20px">
		   			 	资源类型：
					    <select id="s2s_mineType">
							<option value="1">石油</option>
							<option value="2">天然气</option>
							<option value="3">煤层气</option>
							<option value="4">页岩气</option>
						</select><br/><br/>
						储量类型：
					    <select id="s2s_mineType">
							<option value="1">新增探明地质储量</option>
							<option value="2">累计储量</option>
							<option value="3">经济可采储量</option>
						</select><br/><br/>
						实体类型：
					    <select id="s2s_entityType">
							<option value="1">全国</option>
							<option value="2">公司</option>
							<option value="3">盆地</option>
						</select><br/><br/>
						时间选择：
					    <select id="s2s_beginYear">
							<option value="1949">1949</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
						</select>--
						 <select id="s2s_endYear">
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
						</select>
						<button onclick="s2s_previewData()">预览</button>
		   			</div>
			</div>
		</div>
		<div style="width:60%;height:100%;float:left">
			<div id="test1" style="height:350px;width:450px">
				
			</div>
		</div>
	</div>
	<div style="width:100%;height:10%;text-align:center">
		<button onclick="s2s_previous()">上一步</button>
		<button onclick="s2s_next()">下一步</button>
		<button onclick="s2s_saveExit()">保存退出</button>
		<button onclick="s2s_cancel()">取消</button>
	</div>
</div>
<!-- ************第二步选择多数据源弹出框*********** -->
<div id="s2m_dataSource" title="数据源选择-多数据源（第2步/共4步）" style="width:600px;height:200px;display:none"   
        data-options="resizable:true,modal:true">   
</div>

<!-- ************第三步选择预测模型弹出框*********** -->
<div id="s3_modelInfo" title="选择预测模型（第3步/共4步）" style="width:800px;height:450px;display:none"   
        data-options="resizable:true,modal:true">   
	<div style="width:100%;height:90%">
		<div style="width:60%;height:100%;float:left">
			<div style="padding: 5px;">
				<span>预测名称:</span> 
				<span id="s3_forecastName"></span>
			</div>
			<div style="padding: 5px;">
				<span>预测目标:</span> 
				<span id="s3_forecastType"></span>
			</div>
			<div style="padding: 5px;">
				<span>数据源:</span> 
				<span id="s3_data"></span>
			</div>
			<div id="test3" style="width:450px;height:300px;">
				
			</div>
		</div>
		<div style="width:40%;height:100%;float:left">
			<div style="padding: 5px;">
				模型选择：
				    <select id="s3_modelName">
						<option value="1">翁氏旋回模型</option>
						<option value="2">冈伯茨模型</option>
						<option value="3">哈伯特模型</option>
						<option value="4">对数回归模型</option>
					</select>
			</div>
			<div style="padding: 5px;">
				参数拟合方法：
				    <select id="s3_pemName">
						<option value="1">最小二乘法</option>
						<option value="2">三段估计法</option>
					</select>
			</div>
			<div style="padding: 5px;">
				模型介绍：
				    <p>
				    翁文波认为这种生命旋回的发展合乎Poisson分布规律，就把它称为“Poisson回归”。后人称这种生命旋回为翁氏回归。该模型为我国建立的第一个预测油气田产量的模型，因而受到石油专家的广泛重视和应用
				    翁文波认为这种生命旋回的发展合乎Poisson分布规律，就把它称为“Poisson回归”。后人称这种生命旋回为翁氏回归。该模型为我国建立的第一个预测油气田产量的模型，因而受到石油专家的广泛重视和应用
				    翁文波认为这种生命旋回的发展合乎Poisson分布规律，就把它称为“Poisson回归”。后人称这种生命旋回为翁氏回归。该模型为我国建立的第一个预测油气田产量的模型，因而受到石油专家的广泛重视和应用
				    翁文波认为这种生命旋回的发展合乎Poisson分布规律，就把它称为“Poisson回归”。后人称这种生命旋回为翁氏回归。该模型为我国建立的第一个预测油气田产量的模型，因而受到石油专家的广泛重视和应用
				    </p>
			</div>
		</div>
	</div>
	<div style="width:100%;height:10%;text-align:center">
		<button onclick="s3_previous()">上一步</button>
		<button onclick="s3_next()">下一步</button>
		<button onclick="s3_saveExit()">保存退出</button>
		<button onclick="s3_cancel()">取消</button>
	</div>
</div>

<!-- ************第四步完成预测弹出框*********** -->
<div id="s4_forecast" title="完成预测（第4步/共4步）" style="width:800px;height:450px;display:none"   
        data-options="resizable:true,modal:true">   
	<div style="width:100%;height:90%">
		<div style="width:40%;height:100%;float:left">
			<div style="padding: 5px;">
				<span>预测名称:</span> 
				<span id="s4_forecastName"></span>
			</div>
			<div style="padding: 5px;">
				<span>预测目标:</span> 
				<span id="s4_forecastType"></span>
			</div>
			<div style="padding: 5px;">
				<span>数据源:</span> 
				<span id="s4_data"></span>
		   	</div>
		   	<div style="padding: 5px;">
				<span>模型名称:</span> 
				<span id="s4_modelName"></span>
		   	</div>
		   	<div style="padding: 5px;">
				<span>拟合方法:</span> 
				<span id="s4_pemName"></span>
		   	</div>
		   	<div style="padding: 5px;">
		   		预测时间范围选择：<br/><br/> 
			   		<label><input name="forecastTime" type="radio" value="1" checked/>短期(5年) </label> 
					<label><input name="forecastTime" type="radio" value="2" />中期(10年) </label> 
					<label><input name="forecastTime" type="radio" value="3" />中长期(20年) </label> 
					<br><br>
					<label><input name="forecastTime" type="radio" value="4" />自定义</label> 
					 <select id="s4_beginYear" disabled>
							<option value="1949">1949</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
						</select>--
						 <select id="s4_endYear" disabled>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
						</select>
						<button onclick="s4_predict1()">预测</button>
		   	</div>
		   	<div style="padding: 5px;">
		   		<input type="checkbox" id="inputPEM" onclick="inputPEM()">自定义拟合参数：
		   		<div style="display:none;text-align:center" id="pemParams">
		   			a:<input type="text" id="pem_a"><br>
		   			b:<input type="text" id="pem_b"><br>
		   			K:<input type="text" id="pem_K"><br>
		   			<div style="text-align:center">
		   				<button onclick="s4_predict2()">预测</button>
		   			</div>
		   		</div>
		   			
		   	</div>
		</div>
		<div style="width:60%;height:100%;float:left">
			<div id="test4" style="height:350px;width:450px">
			</div>
		</div>
	</div>
	<div style="width:100%;height:10%;text-align:center">
		<button onclick="s4_previous()">上一步</button>
		<button onclick="s4_saveExit()">保存退出</button>
		<button onclick="s4_finish()">完成预测</button>
		<button onclick="s4_cancel()">取消</button>
	</div>
</div>



	<div class="easyui-panel" title="未完成预测" style="width:100%;height:100%;padding:10px;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
		<div id="listTb" style="padding-bottom:0px">
			目标主题：<select id="dataSourceSubject">
				<c:forEach items="${forecastType}" var="item">
					<option value="${item.id}">${item.type}</option>
				</c:forEach>
			</select>
			<input class="easyui-validatebox" type="text" name="name"/>   
			<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
		</div>
		<!-- 列表区域 -->
		<div id="list" style="text-align:center;padding:0px 5px 10px 5px">
			<table id="datagrid" class="easyui-datagrid .datagrid-btable">
			</table>
		</div>
		<div style="text-align:center;padding-top:10px">
			<a id="btn" href="javascript:createRecord()" class="easyui-linkbutton" ><i class="fa fa-plus" style="margin-right:3px"></i>新建</a> 
			<a id="btn" href="javascript:openRecord()" class="easyui-linkbutton" ><i class="fa fa-file-excel-o" style="margin-right:3px"></i>打开</a>
			<a id="btn" href="javascript:deleteRecord()" class="easyui-linkbutton" ><i class="fa fa-minus" style="margin-right:3px"></i>删除</a>
		</div> 
	</div>
</body>
</html>