<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>123</title>
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
						<option value="${item.methodNum}">${item.pemName}</option>
					</c:forEach>
					</select><br>
				历史数据起始年：
					<select name="historyBeginYear" id="historyBeginYear" onchange="historyBeginYearChanged()">
					<c:forEach items="${dataCollectionMap}" var="item">
						<option value="${item.key}" <c:if test="${status.first}">selected</c:if> >${item.key}</option>
					</c:forEach>
					</select><br>
				历史数据终止年：
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
				<%-- 拟合参数：<br>
				<c:forEach items="${modelParam}" var="item">
					${item}: <input>
				</c:forEach> --%>	
					<button onclick="outputPrediction()">预测</button>
			</div>
		</div>
	</div>
	<div style="width:80%;height:50%;float:left;">
		<div style="width:100%;height:100%;border-top:1px solid blue;border-bottom:1px solid blue;border-right:1px solid blue;">
			<div class="queryList" style="padding:10px;overflow:auto">
				<table class="easyui-datagrid" cellspacing="0" cellpadding="0" width="100px" height="200px">
					<thead>
						<tr class="listTit tabTh">
							<th data-options="frozen:true,field:'year'">年份</th>
							<th data-options="frozen:true,field:'historyData'">历史数据</th>
						</tr>
					</thead>
					<tbody class="easyui-panel" style="height:100%">
						<c:forEach items="${dataCollectionMap}" var="item">
								<tr class="listTr">
									<td>${item.key}</td>
									<td>${item.value}</td>
								</tr>
						    </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div style="width:20%;height:50%;float:left;">
		<div style="width:100%;height:100%;border-bottom:1px solid blue;border-left:1px solid blue;border-right:1px solid blue;">
			<div style="padding:10px" id="paramDiv">
				
			</div>
		</div>
	</div>
	<div style="width:80%;height:50%;float:left;">
		<div style="width:100%;height:100%;border-bottom:1px solid blue;border-right:1px solid blue;">
			<div class="queryList" style="padding:10px;overflow:auto">
				<table>
					<thead>
						<tr>
							<th>年份</th>
							<th>预测结果</th>
						</tr>
					</thead>
					<tbody id="predictResult">
						<%-- <c:forEach items="${dataCollectionMap}" var="item">
								<tr class="listTr">
									<td>${item.key}</td>
									<td>${item.value}</td>
								</tr>
						    </c:forEach> --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var historyBeginYear = $("#historyBeginYear option:selected").val();
var historyEndYear = $("#historyEndYear option:selected").val();
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
			for(var i=0;i<result.output.year.length;i++){
				$("#predictResult").append("<tr><td>"+result.output.year[i]+"</td><td>"+result.output.futureData[i]+"</td></tr>");
			}	
			$("#paramDiv").empty();
			for(var i=0;i<result.output.param.length;i++){
				$("#paramDiv").append(result.output.param[i]+":<input value='"+result.output.value[i]+"'/><br>")
			}
		},
		error:function(){
			alert("出意外错误了");
		}
});
}
</script>

</html>