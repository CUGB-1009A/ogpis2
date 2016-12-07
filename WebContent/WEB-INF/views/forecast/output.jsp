<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>123</title>
<script type="text/javascript" src="<%=path %>/sz/binary/dynaload.js"></script>
<script type="text/javascript" src="<%=path%>/Echarts2/dist/echarts.js"></script>
 
</head>
<body>
	<div style="width:20%;height:50%;float:left;">
		<div style="width:100%;height:100%;border:1px solid blue">
			<div style="padding:10px">
				数据集选择：
					<select name="mineType" id="mineType" onchange="dataCollectionChanged()">
					<c:forEach items="${dataCollectionList}" var="item">
						<option value="${item.id}">${item.dataCollectionName}</option>
					</c:forEach>
					</select><br>
				模型选择：
					<select name="modelName" id="modelName" onchange="modelChanged()">
					<c:forEach items="${modelInfoList}" var="item">
						<option value="${item.id}">${item.modelName}</option>
					</c:forEach>
					</select><br>
				拟合方法：
					<select name="PEM" id="PEM">
					<c:forEach items="${pemList}" var="item">
						<option value="${item.value}">${item.key}</option>
					</c:forEach>
					</select><br>
				历史数据区间：<br>
					<select name="historyBeginYear" id="historyBeginYear" onchange="historyBeginYearChanged()">
					<c:forEach items="${dataCollectionMap}" var="item">
						<option value="${item.key}" <c:if test="${status.first}">selected</c:if> >${item.key}</option>
					</c:forEach>
					</select>
				--
					<select name="historyEndYear" id="historyEndYear" onchange="historyEndYearChanged()">
					<c:forEach items="${dataCollectionMap}" var="item" varStatus="status">
						<option value="${item.key}" <c:if test="${status.last}">selected</c:if> >${item.key}</option>
					</c:forEach>
					</select><br>
				二选一：<br>
				<input name="timeChoice" type="radio" value="1" checked/>预测区间：
					<select name="futureBeginYear" id="futureBeginYear" disabled="disabled">
						
					</select> -- 
					<select name="futureEndYear" id="futureEndYear">
						
					</select><br>
				<input name="timeChoice" type="radio" value="2"/>长中短：
					<c:forEach items="${periodIntervalList}" var="item" varStatus="status">
						<input name="periodInterval" type="radio" value="${item.periodInterval}"<c:if test="${status.first}">checked</c:if>/>${item.periodName}
					</c:forEach><br>
					<button onclick="outputPrediction()">预测</button>
			</div>
		</div>
	</div>
	<div style="width:80%;height:50%;float:left;">
		<div style="width:30%;height:100%;float:left">
			<script type="text/javascript">
				insertReport('AF', "Rebar=Main");
			</script>
		</div>
		<div id="historyDataChart" style="width:900px;height:400px;float:left">
			
		</div>
	</div>
	<div style="width:20%;height:50%;float:left;">
		<div style="width:100%;height:100%;border-bottom:1px solid blue;border-left:1px solid blue;border-right:1px solid blue;">
			<div style="padding:10px" id="paramDiv">
				
			</div>
		</div>
	</div>
	<div style="width:80%;height:50%;float:left;">
		<div style="width:30%;height:100%;float:left">
			<script type="text/javascript">
				insertReport('AF1', "Rebar='Main'");
			</script>
		</div>
		<div id="futureDataChart" style="width:900px;height:400px;float:left">
			
		</div>
	</div>
<script type="text/javascript">
function OnReady(id){ //添历史数据表格，并显示预测数据表格模板
	if(id=='AF')
		{
		AF.func("Build", "<%=path%>/sz/historyData.xml");
		AF.func("setSource","ds1 \r\n "+historyDataString);
		AF.func("Calc",'');
		}
	if(id=='AF1')
		AF1.func("Build", "<%=path%>/sz/futureData.xml");
}

var historyBeginYear = $("#historyBeginYear option:selected").val();//数据集历史数据的起始年份，不变的
var historyEndYear = $("#historyEndYear option:selected").val();//数据集历史数据的终止年份，不变的
var historyData = ${historyData};//object格式的历史数据，不变的
var historyDataString = JSON.stringify(historyData);
var historyDataJson = historyData.historyData ;

	var historyYear="{\"year\":[";
	var historyValue="{\"value\":[";
	for(i=0;i<historyDataJson.length;i++){
		historyYear = historyYear + historyDataJson[i].year+",";
		historyValue = historyValue + historyDataJson[i].value+",";
	}
	historyYear = historyYear.substring(0,historyYear.length-1);
	historyValue = historyValue.substring(0,historyValue.length-1);
	historyYear = historyYear + "]}";
	historyValue = historyValue + "]}";
	
	var option = {
		    title : {
		        text: ''
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:[]
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : []
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'',
		            type:'line',
		            data:[]
		        }
		    ]
		};
	        require.config({
	            paths: {
	                echarts: '<%=path%>/Echarts2/dist'
	            }
	        });
	        require(
	            [
	                'echarts',
	                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
	                'echarts/chart/bar'
	            ],
	            function (ec) {
	            	var myHistoryChart = ec.init($("#historyDataChart")[0]);
	
	            	//图表使用-------------------
	            	
	            		option.title.text = '石油产量历史数据';
	            		option.legend.data[0] = '历史数据';
	            		option.series[0].name = '历史数据';
	            		option.xAxis[0].data = eval("(" + historyYear + ")").year;
	            		option.series[0].data = eval("(" + historyValue + ")").value;
	            		myHistoryChart.setOption(option);
	            });


$(function(){
	$("#futureBeginYear").append("<option value='"+historyBeginYear+"' selected>"+historyBeginYear+"</option>");	
	for(var i=parseInt(historyEndYear);i<parseInt(historyEndYear)+50;i++){
		$("#futureEndYear").append("<option value='"+i+"'>"+i+"</option>");
	}
	
});
//数据集改变了，对应模型得变，对应模型的参数拟合方法得变，对应数据起始终止年份得变----------------------（对应历史数据起始终止年份得改变还没有做）
function dataCollectionChanged(){
	var dataCollectionId = $("#mineType option:selected").val();
	$.ajax({
		url:"<%=path%>/forecast/dataCollectionChanged",
		dataType:"json",
		async:true,
		data:{"dataCollectionId":dataCollectionId},
		type:"GET",
		success:function(result){
			$("#modelName").empty();//清空模型选择下拉框，再添加对应的模型
			for(var i=0;i<result.model.length;i++)
				$("#modelName").append("<option value='"+result.model[i].id+"'>"+result.model[i].name+"</option>"); 
			$("#PEM").empty();//清空拟合方法选择下拉框，再添加对应的拟合方法
			for(var i=0;i<result.pem.length;i++)
				$("#PEM").append("<option value='"+result.pem[i].id+"'>"+result.pem[i].name+"</option>"); 
		},
		error:function(){
			alert("数据集没有对应的模型或模型没有对应的参数拟合方法");
		}
	});
}

//模型改变了，对应模型的参数拟合方法得变，对应数据起始终止年份得变----------------------（对应历史数据起始终止年份得改变还没有做）
function modelChanged(){
	var modelId = $("#modelName option:selected").val();
	$.ajax({
		url:"<%=path%>/forecast/modelChanged",
		dataType:"json",
		async:true,
		data:{"modelId":modelId},
		type:"GET",
		success:function(result){
			$("#PEM").empty();//清空拟合方法选择下拉框，再添加对应的拟合方法
			for(var i=0;i<result.pem.length;i++)
				$("#PEM").append("<option value='"+result.pem[i].id+"'>"+result.pem[i].name+"</option>"); 
		},
		error:function(){
			alert("模型没有对应的参数拟合方法");
		}
	});
}

//历史数据起始年份改变了
function historyBeginYearChanged(){
	var tempBegin = $("#historyBeginYear option:selected").val();
	var tempEnd = $("#historyEndYear option:selected").val();
	$("#historyEndYear").empty();
	for(var i=parseInt(tempBegin);i<parseInt(historyEndYear)+1;i++){
		if(parseInt(tempEnd)==i)
			$("#historyEndYear").append("<option value='"+i+"'selected>"+i+"</option>"); 
		else
			$("#historyEndYear").append("<option value='"+i+"'>"+i+"</option>");
	}
	$("#futureBeginYear").empty(); 
	$("#futureBeginYear").append("<option value='"+tempBegin+"' selected>"+tempBegin+"</option>");
	for(var j=parseInt(historyBeginYear);j<parseInt(historyEndYear)+1;j++){
		var temp = j-parseInt(historyBeginYear)+1;
		if(j>parseInt(tempBegin)-1&&j<parseInt(tempEnd)+1){//显示出来
			AF.func("HideRow",temp+" \r\n 1 \r\n false");
		}
		else{
			AF.func("HideRow",temp+" \r\n 1 \r\n true");
		}
	} 
}

//历史数据终止年份改变了
function historyEndYearChanged(){
	var tempBegin = $("#historyBeginYear option:selected").val();
	var tempEnd = $("#historyEndYear option:selected").val();
	$("#historyBeginYear").empty();
	for(var i=parseInt(historyBeginYear);i<parseInt(tempEnd)+1;i++){
		if(parseInt(tempBegin)==i)
			$("#historyBeginYear").append("<option value='"+i+"'selected>"+i+"</option>"); 
		else
			$("#historyBeginYear").append("<option value='"+i+"'>"+i+"</option>");
	}
	for(var j=parseInt(historyBeginYear);j<parseInt(historyEndYear)+1;j++){
		var temp = j-parseInt(historyBeginYear)+1;
		if(j>parseInt(tempBegin)-1&&j<parseInt(tempEnd)+1){//显示出来
			AF.func("HideRow",temp+" \r\n 1 \r\n false");
		}
		else{
			AF.func("HideRow",temp+" \r\n 1 \r\n true");
		}
	}
}

function outputPrediction(){
	var dataCollectionId = $("#mineType option:selected").val();
	var modelId = $("#modelName option:selected").val();
	var PEMNum = $("#PEM option:selected").val();
	var historyBeginYear1 = $("#historyBeginYear option:selected").val();
	var historyEndYear1 = $("#historyEndYear option:selected").val();
	var timeChoice=$('input:radio[name="timeChoice"]:checked').val();
	if(timeChoice==1){//预测区间通过下拉框自定义选择时间
		var futureBeginYear = $("#futureBeginYear option:selected").val();
		var futureEndYear = $("#futureEndYear option:selected").val();
	}
	if(timeChoice==2){//预测区间通过长中短期选择
		var periodInterval=$('input:radio[name="periodInterval"]:checked').val();
		var futureBeginYear = $("#historyBeginYear option:selected").val();
		var futureEndYear = parseInt(historyEndYear) + parseInt(periodInterval);
	}
	$.ajax({
		url:"<%=path%>/forecast/outputPrediction",
		dataType:"json",
		async:true,
		data:{"modelId":modelId,"dataCollectionId":dataCollectionId,"PEMNum":PEMNum,
			"historyBeginYear":historyBeginYear1,"historyEndYear":historyEndYear1,
			"futureBeginYear":futureBeginYear,"futureEndYear":futureEndYear},
		type:"GET",
		success:function(result){
			$("#predictResult").empty();
			for(var i=0;i<result.output.predictData.length;i++){
				$("#predictResult").append("<tr><td>"+result.output.predictData[i].year+"</td><td>"+result.output.predictData[i].value+"</td></tr>");
			}	
			$("#paramDiv").empty();
			for(var i=0;i<result.output.pemValue.length;i++){
				$("#paramDiv").append(result.output.pemValue[i].param+":<input value='"+result.output.pemValue[i].value+"'/><br>")
			}
			
			AF1.func("setSource","ds1 \r\n "+JSON.stringify(result));
			AF1.func("Calc",'');
			
			var historyYear1="{\"year\":[";
			var historyValue1="{\"value\":[";
			for(i=0;i<result.output.predictData.length;i++){
				historyYear1 = historyYear1 + result.output.predictData[i].year+",";
				historyValue1 = historyValue1 + result.output.predictData[i].value+",";
			}
			historyYear1 = historyYear1.substring(0,historyYear1.length-1);
			historyValue1 = historyValue1.substring(0,historyValue1.length-1);
			historyYear1 = historyYear1 + "]}";
			historyValue1 = historyValue1 + "]}";
			require.config({
		            paths: {
		                echarts: '<%=path%>/Echarts2/dist'
		            }
		        });
		        require(
		            [
		                'echarts',
		                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
		                'echarts/chart/bar'
		            ],
		            function (ec) {
		            	var myfutureChart = ec.init($("#futureDataChart")[0]);
		
		            	//图表使用-------------------
		            	
		            		option.title.text = '石油产量预测数据';
		            		option.legend.data[0] = '预测数据';
		            		option.series[0].name = '预测数据';
		            		option.xAxis[0].data = eval("(" + historyYear1 + ")").year;
		            		option.series[0].data = eval("(" + historyValue1 + ")").value;
		            		myfutureChart.setOption(option);
		            });
			
		},
		error:function(){
			alert("出意外错误了");
		}
});
}


</script>
</body>
</html>