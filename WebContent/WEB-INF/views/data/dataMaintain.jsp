<!-- 这是数据维护jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=path%>/js/sz/fillReportData.js"></script>
</head>
<body>
	<div class="easyui-panel" title="数据维护" style="width:100%;height:100%;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
	    <div style="width:35%;height:100%;float:left"> 
	   		<div style="padding:20px">
	   			<div style="padding-bottom:10px">
		   			数据源主题：<br/><br/> 
						<label><input name="dataSourceSubject" type="radio" value="1" checked/>储量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="2" />产量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="3" />资源量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="4" />消费量</label> 
						<label><input name="dataSourceSubject" type="radio" value="5" />进出口 </label> 
						<label><input name="dataSourceSubject" type="radio" value="6" />其他 </label> 
				</div>
				<div style="padding-bottom:10px">
		   			选择数据源：<br/><br/> 
					    <select id="dataSourceSubject">
							<option value="1">全国石油储量</option>
							<option value="2">油气公司石油储量</option>
							<option value="3">全国新增探明地质储量</option>
						</select>
						<button>显示全部</button>
				</div>
				<div style="padding:10px;align:center;border:outset 1px grey">
		   			查询条件：<br/><br/> 
		   			<div style="padding:10px">
		   			 	资源类型：
					    <select id="mineType">
							<option value="1">石油</option>
							<option value="2">天然气</option>
							<option value="3">煤层气</option>
							<option value="4">页岩气</option>
						</select><br/><br/>
						储量类型：
					    <select id="mineType">
							<option value="1">新增探明地质储量</option>
							<option value="2">累计储量</option>
							<option value="3">经济可采储量</option>
						</select><br/><br/>
						实体类型：
					    <select id="entityType">
							<option value="1">全国</option>
							<option value="2">公司</option>
							<option value="3">盆地</option>
						</select><br/><br/>
						时间选择：
					    <select id="beginYear">
							<option value="1949">1949</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
						</select>--
						 <select id="endYear">
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
						</select>
		   			</div>
				</div>
				<div style="padding-top:10px;text-align:center"> 
					<button>获取数据</button>				
				</div>
	   			
	   		</div>
		</div> 
		<div style="width:65%;height:100%;float:left">
			<div class="easyui-tabs" style="width:100%;height:80%;background:#fafafa;"> 
				<div style="padding:20px" title="统计图" tabPosition="right">
					<div id="testChart" style="width:700px;height:340px;">
						
					</div>
				</div>
				<div style="padding:20px" title="数据表">
					<div>
						<script type="text/javascript">
							insertReport('AF', "");
						</script>
					</div>
				</div>
			</div>  
				
			<div style="text-align:center;width:100%;padding-top:20px">
				<input name="autoSave" type="checkbox" value="" /> 自动保存
				<button>保存缓存</button>
			</div>	

		</div> 
	</div>
</body>
<script type="text/javascript">
	var historyData = ${historyData};
	var historyDataString;
	var historyDataJson;
	var x;
	var y;
	historyDataString = JSON.stringify(historyData);
	historyDataJson = historyData.historyData ;	
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
	x = eval("(" + historyYear + ")").year;
	y = eval("(" + historyValue + ")").value;
	
function OnReady(id){
	window[id].func("Build", "<%=request.getContextPath()%>/sz/historyData.xml");
	var unit = '万吨';
	if(id=='AF')
	fillReportData(id,'石油新增探明地质储量',unit,historyDataString);
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
	        			            data : []
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
	        					     data: []
	        			          }
	        		          ]
	        		}
var myChart = echarts.init(document.getElementById("testChart"));
 	option.xAxis[0].data = x;
	option.series[0].data = y;	
	myChart.setOption(option);
$(function(){
	$.parser.parse();
})
</script>
</html>