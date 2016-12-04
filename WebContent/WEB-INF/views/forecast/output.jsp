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
<div style="width:15%;height:100%;float:left;border:1px solid red;padding:10px">
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
		参数拟合方法：
			<select name="PEM" id="PEM">
			<c:forEach items="${pemList}" var="item">
				<option value="${item.id}">${item.pemName}</option>
			</c:forEach>
			</select><br>
		历史数据起始年：
			<select name="historyBeginYear" id="historyBeginYear">
				<option value="1949" selected>1949</option>
			</select><br>
		历史数据终止年：
			<select name="historyEndYear" id="historyEndYear">
				<option value="2016" selected>2016</option>
			</select><br>
		预测结果起始年：
			<select name="futureBeginYear" id="futureBeginYear">
				<option value="2016" selected>2016</option>
			</select><br>
		预测结果终止年：
			<select name="futureEndYear" id="futureEndYear">
				<option value="2025" selected>2025</option>
			</select><br>
		拟合参数：<br>
		<c:forEach items="${modelParam}" var="item">
			${item}: <input>
		</c:forEach>	
			<button onclick="outputPrediction()">预测</button>
</div>
<div style="width:85%;height:100%">

</div>
<script type="text/javascript">
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

function outputPrediction(){
var modelName = $("#modelName option:selected").val();
var mineType = $("#mineType option:selected").val();
var historyBeginYear = $("#historyBeginYear option:selected").val();
var historyEndYear = $("#historyEndYear option:selected").val();
var futureBeginYear = $("#futureBeginYear option:selected").val();
var futureEndYear = $("#futureEndYear option:selected").val();
var PEM = $("#PEM option:selected").val();
$.ajax({
	url:"<%=path%>/forecast/outputPrediction",
	dataType:"json",
	async:true,
	data:{"modelName":modelName,"mineType":mineType,"PEM":PEM,
		"historyBeginYear":historyBeginYear,"historyEndYear":historyEndYear,
		"futureBeginYear":futureBeginYear,"futureEndYear":futureEndYear},
	type:"GET",
	success:function(result){

		alert(result.flag);
	},
	error:function(){
		alert("出意外错误了");
	}
});
}
</script>
</body>
</html>