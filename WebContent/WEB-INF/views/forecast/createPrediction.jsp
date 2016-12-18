<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产量预测--new</title>

</head>
<body>
	<div id="step2" class="easyui-layout" style="width:100%;height:100%;display:none;">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center;postion:static">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;postion:static">
	    	<div style="height:90%">
	    		
	    	</div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="toRecordList()">返回列表</button>
	    		<button onclick="step2_next()">下一步</button>
	    	</div>
	    </div>   
	</div>
	
	<div id="step3" class="easyui-layout" style="width:100%;height:100%;display:none">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center;postion:static">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;postion:static">
	    	<div style="height:90%"></div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step3_previous()">上一步</button>
	    		<button onclick="step3_next()">下一步</button>
	    	</div>
	    </div>   
	</div>
	
	<div id="step4" class="easyui-layout" style="width:100%;height:100%;display:none;">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
	    	<div style="height:90%"></div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step4_previous()">上一步</button>
	    		<button onclick="predict()">预测</button>
	    	</div>
	    </div>   
	</div>
	
	<div id="step5" class="easyui-layout" style="width:100%;height:100%;display:none;">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
	    	<div style="height:90%"></div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step5_previous()">上一步</button>
	    		<button onclick="save()">保存</button>
	    	</div>
	    </div>   
	</div>
</body>
<script type="text/javascript">
function toRecordList(){
	window.location.href = "<%=path%>/forecast/list"
}
function step2_next(){
	$('#step2').css("display","none");
	$('#step3').css("display","");
	$.parser.parse();

}

function step3_previous(){
	$('#step3').css("display","none");
	$('#step2').css("display","");
	$.parser.parse();
}

function step3_next(){
	$('#step3').css("display","none");
	$('#step4').css("display","");
	$.parser.parse();
}

function step4_previous(){
	$('#step4').css("display","none");
	$('#step3').css("display","");
	$.parser.parse();
}

function predict(){
	$('#step4').css("display","none");
	$('#step5').css("display","");
	$.parser.parse();
}

function step5_previous(){
	$('#step5').css("display","none");
	$('#step4').css("display","");
	$.parser.parse();
}

function save(){
	
}

	var step = ${step} ;
	$('#step'+step).css("display",""); //首次进入，控制需要显示的div
</script>
</html>