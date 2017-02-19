<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <script type="text/javascript" src="<%=path%>/resource/dist/echarts.js"></script>
		<title>${plan.planName }详情</title>
	</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:true,collapsedContent:'规划总体情况'" style="height:40%">
	<!-- <div style="width:100%"> -->
		<div align="center"><span style="font-size:24px;font-family:微软雅黑">规划概览</span></div>
		<div style="width:50%;float:left">
			<div>
				<textarea class="inputs1" style="display: none;">${plan.indexDataInPlanYear }</textarea>
				<div class="charts1" style="height: 300px;width: 100%;" align="center"></div>
			</div>
		</div>
		<div style="width:30%;float:right;margin-right:100px;font-size:15px;overflow:auto">
			<h3 align="center">概述</h3>
			<p>"十二五"规划是从2011年到2015年。“规划的简短描述”：全国“十二五”油气资源勘探开发规划是由国家发改委、国家能源局共同发布的关于我国油气资源勘探
				开发规划的文件，文件基于“十一五”油气资源勘探开发规划的完成情况，结合当前油气资源勘探开发的背景，对“十二五”期间油气资源勘探开发面临的形式进行了评估，
				对油气资源勘探开发的目标进行了规划。
			</p>
		</div>
	</div> 
	<div data-options="region:'center',split:false">
	<!-- <div  style="width:100%"> -->
		<div class="easyui-tabs" data-options="narrow:true,plain:true,tabWidth:250,tabHeight:45" id="tt">
			<%@ include file="tab1.jsp" %>
			<%@ include file="tab2.jsp" %>
			<%@ include file="tab3.jsp" %>
			<%@ include file="tab4.jsp" %>
		</div>
	</div>
	
	<div id="mm" style="width:244px">
		<!-- href="javascript:void(0)" -->
		<div  onclick="openCondition()"><span>规划目标和总体情况</span></div>
		<div  onclick="openReserve()"><span>油气储量</span></div>
		<div  onclick="openOutput()"><span>油气产量</span></div>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			var p = $('#tt').tabs().tabs('tabs')[3];
			var mb = p.panel('options').tab.find('a.tabs-inner');
			mb.menubutton({
				menu:'#mm'
			}).click(function(){
				$('#tt').tabs('select',3);
			});
		});
			
		var option = {
			 title: {
	           text: '规划每年完成情况',
	           x:'center',
	           y:'top'
	       },
		   tooltip : {
		       trigger: 'axis',
		       axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		           type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		       }
		   },
		   legend: {
			 data:[],
			 x:'center',
		     y:'top'
		   },
		   toolbox: {
		       show : true,
		       feature : {
		           saveAsImage : {show: true},
		           dataView : {show: true, readOnly: false}
		       }
		   },
		    grid: {
		       x: '150px',
		       x2:'50px'
		    
		   }, 
		   xAxis:  {
		       type: 'value',
		       axisLabel: {
		      	 show: true,
		      	 interval: 'auto',
		      	 formatter: '{value} %'
		      	 }
		   },
		   yAxis: {
		       type: 'category',
		       data: [],
		       show:true
		   },
		   series: []
		};
		
		require.config({
			paths:{
				echarts:'<%=request.getContextPath()%>/resource/dist'
			}
		});
		
		require(
			[
			 	'echarts',
			 	'echarts/chart/bar',
			 	'echarts/chart/line'
			 ],
			 function (ec){
				var myCharts = ec.init($(".charts1")[0]);		
				var data = $(".inputs1")[0].value; 
				var obj = eval("(" + data + ")");
				
				var tempLegend = "{\"legend\":['',";
			 	var tempYdata = "{\"yData\":[";
	        	var tempSeries = "{\"series\":["
					for(var j=0;j<obj.length;j++)
							{
								tempYdata = tempYdata + "'"+obj[j].indexName+"',";
							}
		        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	
		        		tempLegend = tempLegend +obj[0].year + "]}";
		        	for(var ii=0;ii<obj[0].year.length;ii++)
		        		{
							tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:false, position: 'insideRight',textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:"+ obj[0].year[ii]+",data:[";
							for(var l=0;l<obj.length;l++)
								{
								tempSeries = tempSeries + (obj[l].value[ii]/obj[l].indexValue*100).toFixed(1)+","
								}
							tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]},"
						}
					tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
				
				var obj1 = eval("(" + tempLegend + ")");
				var obj2 = eval("(" + tempYdata + ")");
				var obj3 = eval("(" + tempSeries + ")");
				option.legend.data = obj1.legend;
				option.yAxis.data = obj2.yData;
				option.series = obj3.series;
			 	myCharts.setOption(option);
			}
		)
	</script>
</body>
</html>