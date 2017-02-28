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
$(function(){
	var datagrid = $('#forecastRecordGrid');
	var h = $('body').height() - $('#listTb').height()-75;
	datagrid.datagrid({
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
									title : '',
									width : 0,
									formatter : function(value,row,index) {
										var option = '<input name="forecastRecord" type="checkbox" value="'+value+'" />';
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
							$('#forecastRecordGrid').datagrid('fixRowHeight');//为了对齐行号
						}
					});
	$(":radio[name='forecastTime']").click(function(){//时间选择方式有两种：一种是长中短期、一种是自定义时间段
		if($(this).val()=='0'){
			$('#s4_endYear').attr('disabled',false);
		}
		else{
			$('#s4_endYear').attr('disabled',true);
		}
	});
});

var isNew = true;
var date = new Date();
var currentYear =  "" + date.getFullYear();

//存储结果，表示进行到了第几步了，总共四步（进行到了第一步，就保存到哪一步的那些信息）
var tempResult = 
				{"step":"1",
				 "result":[{"forecastId":"","forecastName":"","forecastTypeId":"","forecastTypeName":""},
                            {},
                            {},
                            {}]};

function clearMsg(){
	tempResult.step = "1";
	tempResult.result[0].forecastId = "";
	tempResult.result[0].forecastName = "";
	tempResult.result[0].forecastTypeId = "";
	tempResult.result[0].forecastTypeName = "";
}


function nameIsValid(forecastId,name){//通过名字检查预测成果名称是否有相同的（这里约定成果名称都是唯一，完成未完成都是唯一）
	var isValid ;
	$.ajax({
		url:"<%=path%>/forecast/nameIsValid",
		dataType:"json",
		async:false,
		data:{
			"name":encodeURIComponent(name),
			"id":forecastId
			},
		type:"GET",
		success:function(result){
			if(result.result=='false'){
				isValid = false;
				}
			else{
				isValid = true;
			}
		},
		error:function(){
			alert("名称检查失败");
		}
	});
	return isValid;
}


function openRecord(id){
	if(tempResult.step=='1')
		$('#s1_addForecast').dialog({
			closed:false
		});
	if(tempResult.step=='2')
		$('#s2s_dataSource').dialog({
			closed:true
		});
	if(tempResult.step=='3')
		$('#s3_modelInfo').dialog({
			closed:true
		});
	if(tempResult.step=='4')
		$('##s4_forecast').dialog({
			closed:true
		});		
}

function newRecord(){
	tempResult.step='1'
	isNew = true ;
	clearMsg();
	openRecord('');
}

function editRecord(){
	var forecastRecordIds = [] ;
	$("input[name='forecastRecord']:checked").each(function(){
		forecastRecordIds.push($(this).val());
	});
	if(forecastRecordIds.length!=1){
		alert('请选择一条记录进行操作');
		return ;
	}
	isNew = false;
	
	clearMsg();
	openRecord(forecastRecordIds[0]);
	tempResult.result[0].forecastId = forecastRecordIds[0];
}

function saveAndExit(){
	$.ajax({
		url:"<%=path%>/forecast/saveUnfinishedRecord",
		dataType:"json",
		async:true,
		type:"GET",
		data:tempResult,
		success:function(result){
			$('#forecastRecordGrid').datagrid('reload'); 
		},
		error:function(){
			alert("结果保存失败");
		}
	});
}


function s1_next(){
	tempResult.result[0].forecastName = $('#s1_forecastName').val();
	tempResult.result[0].forecastTypeName =  $('#s1_forecastType option:selected').text();
	tempResult.result[0].forecastTypeId = $('#s1_forecastType').val();
	console.log(nameIsValid(tempResult.result[0].forecastId,tempResult.result[0].forecastName));
	if(tempResult.result[0].forecastName==""){
		alert("请填写预测名称");
		return false;
	}
	if(!nameIsValid(tempResult.result[0].forecastId,tempResult.result[0].forecastName)){
		alert("预测名已经存在！");
		return ;
	}
	$('#s1_addForecast').dialog({
		closed:true
	});
	$('#s2s_dataSource').dialog({
		closed:false
	});
	$('#s2s_forecastName').html(tempResult.result[0].forecastName);
	$('#s2s_forecastType').html(tempResult.result[0].forecastTypeName);
	$.ajax({
		url:"<%=path%>/dataSource/getAllDataSource",
		dataType:"json",
		async:true,
		type:"GET",
		success:function(data){
			$("#s2s_data").empty();
			for(var i=0;i<data.length;i++){
				$("#s2s_data").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
			}
			//获取选定数据源下的interfaceTable，choice，condition三方面的信息
			var dataSourceId = $("#s2s_data").val();
			$("#s2s_condition").empty();
			$.ajax({
			    url: '<%=path%>/dataBrowser/getTabContentByDSId',
			    data:{"id":dataSourceId},
			    dataType: 'json',
			    async: false,
			    success: function(data){//将选择的表信息、字段信息、维度信息添加到步骤2上
			    	var content="";
	    	    	if(data.dataSource.isVirtual){//如果是虚拟数据源，则数据源也有下拉框选择
	    	    		
	    	    	}
	    	    	if(data.y.isMulti){//如果度量值有多个的话，也有下拉框选择
	    	    		content += "<span class='choice'>"+data.y.CN_name +":</span><select class='choice'>";
    	    			for(var jj=0;jj<data.y.value.length;jj++){
    	    				content +=  "<option value ='"+data.y.value[jj].key+"'>"+data.y.value[jj].value+"</option>";
    	    			}
    	    			content += "</select><br class='choice'>";
	    	    	}
	    	    	for(var i=0;i<data.condition.length;i++){
	    	    		if(data.condition[i].isYear){//为某年，即为点
	    	    			content += "<span class='condition'>"+data.condition[i].CN_name +":</span><select name='"+data.condition[i].EN_name+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
	    	    		}
	    	    		else{
	    	    			content += "<span class='condition'>"+data.condition[i].CN_name +":</span><select name='"+data.condition[i].EN_name+"'class='notYear condition'>";
			    			for(var kk=0;kk<data.condition[i].value.length;kk++){
			    				content +=  "<option value ='"+data.condition[i].value[kk].key+"'>"+data.condition[i].value[kk].value+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
	    	    		}
	    	    	}	
	    	    	if(data.x.isYear){//则condition中year为区间，也添加到condition中去
	    	    		content += "<span class='condition'>"+"起始年份"+":</span><select name='"+data.x.EN_name+"'class='year condition'>";
		    			for(var kk=1949;kk<currentYear;kk++){
		    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
		    			}
		    			content += "</select><br class='condtion'>";
		    			content += "<span class='condition'>"+"终止年份" +":</span><select name='"+data.x.EN_name+"'class='year condition'>";
		    			for(var kk=1949;kk<currentYear;kk++){
		    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
		    			}
		    			content += "</select><br class='condtion'>";
					}
	    	    	content += "<button id='btn' onclick='s2s_previewData()'>预览</button>";					    	
	    	    	$("#s2s_condition").html(content);
			    }
			});
		},
		error:function(){
			alert("获取数据源失败");
		}
	});
}

function s1_saveExit(){
	saveAndExit();
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
	$('#s3_forecastName').html(tempResult.result[0].forecastName);
	$('#s3_forecastType').html(tempResult.result[0].forecastTypeName);
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
	//获取模型和对应的参数拟合方法
	$.ajax({
		url:"<%=path%>/getModel",
		dataType:"json",
		async:true,
		type:"GET",
		success:function(result){
			$("#s3_modelName").empty();
			for(var i=0;i<result.length;i++){
				$("#s3_modelName").append("<option value='"+result[i].id+"'>"+result[i].modelName+"</option>");
			}
			//通过模型的选择获取对应的参数拟合方法
			modelChanged();
		},
		error:function(){
			alert("获取模型失败");
		}
	});
}

function modelChanged(){
	var modelId = $("#s3_modelName").val();
	$.ajax({
		url:"<%=path%>/getPem",
		dataType:"json",
		async:true,
		data:{"id":modelId},
		type:"GET",
		success:function(result){
			$("#s3_pemName").empty();
			$("#s3_modelDescription").empty();
			$("#s3_modelDescription").html(result.description);
			console.log(result.description);
			for(var i=0;i<result.pems.length;i++){
				$("#s3_pemName").append("<option value='"+result.pems[i].pemNum+"'>"+result.pems[i].pemName+"</option>");
			}
		},
		error:function(){
			alert("获取模型拟合参数失败");
		}
	});	
}

function s2s_saveExit(){
	saveAndExit();
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
	$('#s4_forecastName').html(tempResult.result[0].forecastName);
	$('#s4_forecastType').html(tempResult.result[0].forecastTypeName);
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
	saveAndExit();
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
	saveAndExit();
	$('#s4_forecast').dialog({
		closed:true
	});
}
function s4_cancel(){
	$('#s4_forecast').dialog({
		closed:true
	});
}

var option = {//用作预测的历史数据
		 title: { 
					 text: '',
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
			        	splitLine:{
			        		show:false
			        	},
			            type : 'category',
			            boundaryGap : false,
			            name:"年份",
			            data : []
			        }
			    ],
			    yAxis : [
					        {
					        	splitLine:{
					        		show:false
					        	},
					            type : 'value',
					            name:'万吨'
					        }
					    ],
		 series: [
			          {
					     type: 'line',
					     data: []
			          }
		          ]
		}
		
var option1 = {
		 title: { 
					 text: '',
					 left:'center'
				 },
		 tooltip: {
			 		 trigger: 'axis'
		 },
		  legend: {
		        data:['历史数据','预测数据'],
		        right:'right'
		    },
		 xAxis : [{
		        	 splitLine:{
		        		show:false
		        	},
		            type : 'category',
		            boundaryGap : false,
		            name:"年份",
		            data : []
			        }
			    ],
			    yAxis : [
					        {
					        	splitLine:{
					        		show:false
					        	},
					            type : 'value',
					            name:'万吨'
					        }
					    ],
		 series: [
			          {
					     type: 'line',
					     name:'历史数据',
					     data: []
			          },
			          {
			        	  type: 'line',
	   					  name:'预测数据',
	   					  data: [] 
			          }
		          ]
		}

function s2s_previewData(){
	var myChart = echarts.init(document.getElementById("test1"));
	console.log($(".year .condition"))
	var beginYear = $(".year.condition")[0].value;
	var endYear = $(".year.condition")[1].value;
	var sql = 'select YearName,DNCL from qgdncl where YearName>'+beginYear+' and YearName<'+endYear;
	console.log(sql);
	$.ajax({
		url:"<%=path%>/forecast/getHistoryData",
		dataType:"json",
		data:{"sql":sql},
		async:true,
		type:"GET",
		success:function(result){
			console.log(result)
			var temp = {"x":[],"y":[]};
			for(var i=0;i<result.length;i++){
				temp.x[i] = result[i][0];
				temp.y[i] = result[i][1];
				option.xAxis[0].data = temp.x;
				option.series[0].data= temp.y;
				myChart.setOption(option);
				console.log(option.xAxis[0].data);
			}
		},
		error:function(){
			alert("获取失败");
		}
	});
	
}

function s4_predict1(){//根据参数拟合方法计算参数
	var endYear;
	var beginYear = option.xAxis[0].data[0];
	var x = "";
	var y = "";
	if($("input[name='forecastTime']:checked").val()=='0')
		endYear = $("#s4_endYear").val();
	else
		endYear = parseInt(currentYear) + parseInt($("input[name='forecastTime']:checked").val());

	for(var i=0;i<option.xAxis[0].data.length;i++){
		x += option.xAxis[0].data[i]+";";
		y += option.series[0].data[i]+";";
	}
	document.getElementById("echarts").style.display="";
	var myChart = echarts.init(document.getElementById("test4"));

	$.ajax({
		url:"<%=path%>/forecast/forecast",
		dataType:"json",
		async:true,
		data:{
		"x":x,
		"y":y,
		"modelId":$("#s3_modelName").val(),
		"pemNum":$("#s3_pemName").val(),
		"beginYear":beginYear,
		"endYear":endYear	
		},
		type:"GET",
		success:function(result){
			document.getElementById("echarts").style.display="";
			var myChart = echarts.init(document.getElementById("test4"));
			option1.xAxis[0].data = result.x;
			option1.series[0].data= option.series[0].data;
			option1.series[1].data= result.y;
			var content ="";
			for(var i=0;i<result.pemName.length;i++){
				content += result.pemName[i]+":<input type='text' value='"+result.pemValue[i]+"'><br>"
			}
			content += "<button onclick='s4_predict2()'>预测</button>";
			$("#pemParams").empty();
			$("#pemParams").html(content);
			document.getElementById("pemParams").style.display="";
			myChart.setOption(option1);
		},
		error:function(){
			alert("预测失败");
		}
	});

}
function s4_predict2(){//自定义拟合参数拟合
	document.getElementById("echarts").style.display="";
	var myChart = echarts.init(document.getElementById("test4"));
	myChart.setOption(option1);
}


function deleteRecord(){
	var number =$("input[name='forecastRecord']:checked").length;
	if(number<1){
		alert("请至少选择一条记录再删除");
		return false;
	}
	if(confirm("你确定要删除所选记录吗？")){
		var forecastRecordIds = [] ;
		$("input[name='forecastRecord']:checked").each(function(){
			forecastRecordIds.push($(this).val());
		});
		 $.ajax({
				url:"<%=path%>/forecast/delete",
				dataType:"json",
				async:true,
				data:{
					"ids":forecastRecordIds
					},
				type:"GET",
				success:function(result){
					$('#forecastRecordGrid').datagrid('reload');    
				},
				error:function(){
					alert("删除记录失败");
				}
			});
	}		
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
				<select id="s2s_data" onchange="dataSourceChange()">
					
				</select>
				<input type="checkbox"/>显示所有数据源
			</div>
			<div style="padding: 10px;">
				查询条件：<br/><br/> 
		   			<div style="padding:20px" id="s2s_condition">
		   			
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
				    <select id="s3_modelName"  onchange="modelChanged()">
						
					</select>
			</div>
			<div style="padding: 5px;">
				参数拟合方法：
				    <select id="s3_pemName">
						
					</select>
			</div>
			<div style="padding: 5px;">
				模型介绍：
				 <div id="s3_modelDescription" style="padding: 5px;">
				 
				 </div>  

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
		   		<c:forEach items="${perfiodDifinition}" var="item" varStatus="statu">
		   			<label><input name="forecastTime" type="radio" value="${item.periodInterval}" <c:if test="${statu.index==0}">checked</c:if> >${item.periodName}(${item.periodInterval}年) </label> 
		   		</c:forEach>
					<br><br>
					<label><input name="forecastTime" type="radio" value="0" />自定义预测截止年份</label> 
						<input id="s4_endYear" disabled/>
						
						<button onclick="s4_predict1()">预测</button>
		   	</div>
		   	<div style="padding: 5px;">
		   		<input type="checkbox" id="inputPEM" onclick="inputPEM()">修改拟合参数：
			   		<div style="display:none;text-align:center" id="pemParams">
			   			
			   		</div>
		   			<div style="text-align:center">
		   				<button onclick="s4_predict2()">预测</button>
		   			</div>
		   	</div>
		</div>
		<div style="width:60%;height:100%;float:left;display:none" id="echarts">
			<div id="test4" style="height:350px;width:450px;">
			
			</div>
			<div style="height:40px;width:450px;text-align:right">
				
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



<div class="easyui-panel" title="未完成预测 " style="width:100%;height:100%;padding:10px;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
	<div id="listTb" style="padding-bottom:0px">
		目标主题：<select id="forecastType">
			<c:forEach items="${forecastType}" var="item">
				<option value="${item.id}">${item.type}</option>
			</c:forEach>
		</select>
		<input class="easyui-validatebox" type="text" name="name"/>   
		<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" ><i class="fa fa-search" style="margin-right:3px"></i>查  询</a> 
	</div>
	<!-- 列表区域 -->
	<div id="list" style="text-align:center;padding:0px 5px 10px 5px">
		<table id="forecastRecordGrid" class="easyui-datagrid .datagrid-btable">
		</table>
	</div>
	<div style="text-align:center;padding-top:10px">
		<a id="btn" href="javascript:newRecord()" class="easyui-linkbutton" ><i class="fa fa-plus" style="margin-right:3px"></i>新建</a> 
		<a id="btn" href="javascript:editRecord()" class="easyui-linkbutton" ><i class="fa fa-file-excel-o" style="margin-right:3px"></i>打开</a>
		<a id="btn" href="javascript:deleteRecord()" class="easyui-linkbutton" ><i class="fa fa-minus" style="margin-right:3px"></i>删除</a>
	</div> 
</div>
</body>
</html>