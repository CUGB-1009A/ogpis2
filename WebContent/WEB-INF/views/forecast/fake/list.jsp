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
var date = new Date();
var currentYear =  "" + date.getFullYear();
var forecastName ;
var forecastType ;
var dataSourceName;
var modelName ;
var pemName ;
$(function(){
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

function nameIsValid(name){//通过名字检查预测成果名称是否有相同的（这里约定成果名称都是唯一，完成未完成都是唯一）
	var isValid ;
	$.ajax({
		url:"<%=path%>/forecast/nameIsValid",
		dataType:"json",
		async:true,
		data:{
			"name":encodeURIComponent(name)
			},
		type:"GET",
		success:function(result){
			if(result.result=='false'){
				alert("预测名已经存在")
				return false;
				}
			else{
				$('#s2s_forecastName').html(forecastName);
				$('#s2s_forecastType').html(forecastType);
				$('#s1_addForecast').dialog({
					closed:true
				});
				$('#s2s_dataSource').dialog({
					closed:false
				});
				//给id='s2s_data'的select添加库中查询出来的数据源,并将第一个数据源的查询条件写出来
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
						    url: '<%=path%>/getTabDimension1',
						    data:{"id":dataSourceId},
						    dataType: 'json',
						    async: false,
						    success: function(data){//将选择的表信息、字段信息、维度信息添加到步骤2上
						    	var content="";
				    	    	for(var i=0;i<data.condition.length;i++){
				    	    		if(data.condition[i].type =="interfaceTable"){
				    	    			content += "<span class='interfaceTable'>"+ data.condition[i].name +":</span><select class='interfaceTable' onchange='dataSourceChange1()'>";
				    	    			for(var ll=0;ll<data.condition[i].tableArray.length;ll++){
				    	    				content +=  "<option value ='"+data.condition[i].tableArray[ll].id+"'>"+data.condition[i].tableArray[ll].key+"</option>";
				    	    			}
				    	    			content += "</select><br class='interfaceTable'>";
				    	    		}
				    	    		if(data.condition[i].type =="choice"){
				    	    			content += "<span class='choice'>"+data.condition[i].name +":</span><select class='choice'>";
				    	    			for(var jj=0;jj<data.condition[i].choiceArray.length;jj++){
				    	    				content +=  "<option value ='"+data.condition[i].choiceArray[jj].key+"'>"+data.condition[i].choiceArray[jj].value+"</option>";
				    	    			}
				    	    			content += "</select><br class='choice'>";
				    	    		}
				    	    		if(data.condition[i].type =="condition"){
				    	    			if(data.condition[i].isYear){//选择条件为时间
				    							if(data.condition[i].yearType=="point"){//时间为时间点的处理分支
				    								content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
				    				    			for(var kk=1949;kk<currentYear;kk++){
				    				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    				    			}
				    				    			content += "</select><br class='condtion'>";
				    	    					}
				    							else{//时间为时间段的处理分支
				    								content += "<span class='condition'>"+"起始年份"+":</span><select name='"+data.condition[i].key+"'class='year condition'>";
				    				    			for(var kk=1949;kk<currentYear;kk++){
				    				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    				    			}
				    				    			content += "</select><br class='condtion'>";
				    				    			content += "<span class='condition"+ii+"'>"+"终止年份" +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
				    				    			for(var kk=1949;kk<currentYear;kk++){
				    				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    				    			}
				    				    			content += "</select><br class='condtion'>";
				    							}
				    	    			}
				    	    			else{//不是年份的处理分支
				    		    				content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='notYear condition'>";
				    			    			for(var kk=0;kk<data.condition[i].value.length;kk++){
				    			    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
				    			    			}
				    			    			content += "</select><br class='condtion'>";
				    	    				}	
				    	    		}
				    	    		
				    	    	}   
				    	    	content += "<button id='btn' onclick=\"search('"+data.table+"')\">预览</button>";					    	
				    	    	$("#s2s_condition").html(content);
						    }
						});
					},
					error:function(){
						alert("获取数据源失败");
					}
				});
				
			}
		},
		error:function(){
			alert("名称检查失败");
		}
	});
}

function dataSourceChange1(){//二级数据源变化时，重置除数据表的所有条件
	console.log($("select[class='interfaceTable']"))
	var dataSourceId = $("select[class='interfaceTable']").val();
	var temp = $('.interfaceTable');
	content = '';
	for(var i=0;i<temp.length;i++){
		content += temp[i].outerHTML;
	}	
	$.ajax({
	    url: '<%=path%>/getTabDimension1',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将选择的表信息、字段信息、维度信息添加到tab页上
	    	for(var i=0;i<data.condition.length;i++){
	    		if(data.condition[i].type =="interfaceTable"){
	    			content += "<span class='interfaceTable'>"+ data.condition[i].name +":</span><select class='interfaceTable' onchange='dataSourceChange1()'>";
	    			for(var ii=0;ii<data.condition[i].tableArray.length;ii++){
	    				content +=  "<option value ='"+data.condition[i].tableArray[ii].id+"'>"+data.condition[i].tableArray[ii].key+"</option>";
	    			}
	    			content += "</select><br class='interfaceTable'>";
	    		}
	    		if(data.condition[i].type =="choice"){
	    			content += "<span class='choice'>"+data.condition[i].name +":</span><select class='choice'>";
	    			for(var jj=0;jj<data.condition[i].choiceArray.length;jj++){
	    				content +=  "<option value ='"+data.condition[i].choiceArray[jj].key+"'>"+data.condition[i].choiceArray[jj].value+"</option>";
	    			}
	    			content += "</select><br class='choice'>";
	    		}
	    		if(data.condition[i].type =="condition"){
	    			if(data.condition[i].isYear){//选择条件为时间
						if(data.condition[i].yearType=="point"){//时间为时间点的处理分支
							content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
    					}
						else{//时间为时间段的处理分支
							content += "<span class='condition'>"+"起始年份"+":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
			    			content += "<span class='condition'>"+"终止年份" +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
						}
    			}
    			else{//不是年份的处理分支
	    				content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='notYear condition'>";
		    			for(var kk=0;kk<data.condition[i].value.length;kk++){
		    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
		    			}
		    			content += "</select><br class='condtion'>";
    				}
	    		}
	    		
	    	}   
	    	content += "<button id='btn' onclick=\"search('"+data.table+"')\">查询</button>"
	   	}
	});
	$("#s2s_condition").html(content);
	$(".interfaceTable").val(dataSourceId);
}
function dataSourceChange(){//一级数据源变化时，重置所有的查询条件
	content = '';
	var dataSourceId = $("#s2s_data").val();
	$("#s2s_condition").empty();
	$.ajax({
	    url: '<%=path%>/getTabDimension1',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将选择的表信息、字段信息、维度信息添加到tab页上
	    	for(var i=0;i<data.condition.length;i++){
	    		if(data.condition[i].type =="interfaceTable"){
	    			content += "<span class='interfaceTable'>"+ data.condition[i].name +":</span><select class='interfaceTable' onchange='dataSourceChange1()'>";
	    			for(var ii=0;ii<data.condition[i].tableArray.length;ii++){
	    				content +=  "<option value ='"+data.condition[i].tableArray[ii].id+"'>"+data.condition[i].tableArray[ii].key+"</option>";
	    			}
	    			content += "</select><br class='interfaceTable'>";
	    		}
	    		if(data.condition[i].type =="choice"){
	    			content += "<span class='choice'>"+data.condition[i].name +":</span><select class='choice'>";
	    			for(var jj=0;jj<data.condition[i].choiceArray.length;jj++){
	    				content +=  "<option value ='"+data.condition[i].choiceArray[jj].key+"'>"+data.condition[i].choiceArray[jj].value+"</option>";
	    			}
	    			content += "</select><br class='choice'>";
	    		}
	    		if(data.condition[i].type =="condition"){
	    			if(data.condition[i].isYear){//选择条件为时间
						if(data.condition[i].yearType=="point"){//时间为时间点的处理分支
							content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
    					}
						else{//时间为时间段的处理分支
							content += "<span class='condition'>"+"起始年份"+":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
			    			content += "<span class='condition'>"+"终止年份" +":</span><select name='"+data.condition[i].key+"'class='year condition'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion'>";
						}
    			}
    			else{//不是年份的处理分支
	    				content += "<span class='condition'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='notYear condition'>";
		    			for(var kk=0;kk<data.condition[i].value.length;kk++){
		    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
		    			}
		    			content += "</select><br class='condtion'>";
    				}
	    		}
	    		
	    	}   
	    	content += "<button id='btn' onclick=\"search('"+data.table+"')\">预览</button>"
	    	$("#s2s_condition").html(content);
	   	}
	});
}

function search(table){
	var myChart = echarts.init(document.getElementById("test1"));
	var sql = writeSQL(table);
	console.log(sql);
	$.ajax({
	    url: '<%=path%>/getDataBySql',
	    data:{"sql":encodeURIComponent(sql)},
	    dataType: 'json',
	    async: false,
	    success: function(data){
	    	var title = $(".interfaceTable option:selected").text()+$(".notYear .condition option:selected").text()+data.yName;
	    	var temp = $("select[class='year condition']");
	    	if(temp.length==1){
	    		title += $(temp[0]).find("option:selected").text()+"年";
	    	}
	    	if(temp.length==2){
		    		title += $(temp[0]).find("option:selected").text()+"──"+$(temp[1]).find("option:selected").text()+"年";
	    	}
	    	var temp = {"x":[],"y":[]};
			for(var i=0;i<data.data.length;i++){
				var flag = 0;
				for(var key in data.data[i]){
					if(flag==0) {
						temp.x[i] = data.data[i][key];
						console.log(data.data[i][key])
					}
					if(flag==1){
						temp.y[i] =  data.data[i][key];
					}
					flag++;
				}
				option.title.text = title ;
				option.xAxis[0].data = temp.x;
				option.series[0].data= temp.y;
				myChart.setOption(option);
			}
	    }
	});
}

function writeSQL(table){
	var sql = "select ";
	var temp = $("select[class='choice']");
	var feilds = new Array();
	for(var i=0;i<temp.length;i++){
		feilds[i] = temp[i].value;
	}	
	for(var jj=0;jj<feilds.length;jj++){
		if(jj==feilds.length-1)
			sql = sql + feilds[jj] + " from " 
		else
			sql = sql + feilds[jj] + ", " 	
	}
	var condition = new Array();
	var value = new Array();
	var i=0;
	$("select[class='notYear condition']").each(function(){
		condition[i] = $(this).attr("name");
		value[i] = $(this).val();
		i++;	
	});
	sql = sql + table +" where " 
	for(var j=0;j<condition.length;j++){
		if(j==condition.length-1)
			sql = sql + condition[j] + "='" + value[j] +"'" 
		else
			sql = sql + condition[j] + "='" + value[j] +"' and " 	
	}
	if($("select[class='year condition']").length==1){//说明是时间点
		sql = sql + "and "+$("select[class='year condition']")[0].name+"="+$("select[class='year condition']")[0].value;
	}
	if($("select[class='year condition']").length==2){//说明是时间区间
		sql = sql + "and "+$("select[class='year condition']")[0].name+">="+$("select[class='year condition']")[0].value+" and "+$("select[class='year condition']")[1].name+"<="+$("select[class='year condition']")[1].value;
	}
	return sql ;
	
}
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
	nameIsValid(forecastName);
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
				$("#s3_pemName").append("<option value='"+result.pems[i].penNum+"'>"+result.pems[i].pemName+"</option>");
			}
		},
		error:function(){
			alert("获取模型拟合参数失败");
		}
	});	
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
	$.ajax({
		url:"<%=path%>/forecast/getHistoryData",
		dataType:"json",
		async:true,
		type:"GET",
		success:function(result){
			console.log(result)
			var temp = {"x":[],"y":[]};
			for(var i=0;i<result.historyData.length;i++){
				temp.x[i] = result.historyData[i].year;
				temp.y[i] = result.historyData[i].value;
				option.xAxis[0].data = temp.x;
				option.series[0].data= temp.y;
				myChart.setOption(option);
			}
		},
		error:function(){
			alert("获取失败");
		}
	});
	
}

function s4_predict1(){//根据参数拟合方法计算参数
	document.getElementById("echarts").style.display="";
	var myChart = echarts.init(document.getElementById("test4"));
	$.ajax({
		url:"<%=path%>/forecast/forecast",
		dataType:"json",
		async:true,
		type:"GET",
		success:function(result){
			console.log(result)
			var temp = {"x":[],"y":[]};
			for(var i=0;i<result.forecastData.length;i++){
				temp.x[i] = result.forecastData[i].year;
				temp.y[i] = result.forecastData[i].value;
				option1.xAxis[0].data = temp.x;
				option1.series[0].data = option.series[0].data;
				option1.series[1].data= temp.y;
				myChart.setOption(option1);
			}
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
		<div style="width:60%;height:100%;float:left;display:none" id="echarts">
			<div id="test4" style="height:350px;width:450px;">
			
			</div>
			<div style="height:40px;width:450px;text-align:right">
				a=12;b=23;K=23
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