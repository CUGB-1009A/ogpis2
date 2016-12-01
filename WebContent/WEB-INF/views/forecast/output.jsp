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
<div style="width:20%;height:100%;float:left">
		数据集选择：
			<select name="mineType" id="mineType">
				<option value="1" selected>石油产量</option>
				<option value="2">天然气产量</option>
			</select><br>
		模型选择：
			<select name="modelName" id="modelName">
				<option value="Poisson" selected>翁氏旋回模型</option>
			</select><br>
		参数拟合方法：
			<select name="PEM" id="PEM">
				<option value="1" selected>最小二乘法</option>
				<option value="2">三段估计法</option>
				<option value="3">专家经验法</option>
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
			<button onclick="outputPrediction()">预测</button>
</div>
<div style="width:80%;height:100%">

</div>
<script type="text/javascript">
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
	data:{"modelName":modelName,"mineType":mineType,
		"historyBeginYear":historyBeginYear,"historyEndYear":historyEndYear,
		"futrueBeginYear":futureBeginYear,"futureEndYear":futureEndYear},
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