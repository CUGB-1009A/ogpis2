<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="<%=path%>/resource/echart/echart.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    
	</script>
	<title>完成情况管理</title>
</head>
<body>
	<div data-options="region:'north',split:true,collapsedContent:'规划总体情况'" style="height:25%">
	<!-- <div style="width:100%"> -->
		<div align="center"><span style="font-size:24px;font-family:微软雅黑">规划概览</span></div>
		<div style="width:50%;float:left">
			规划每年完成情况
		</div>
		<div style="width:30%;float:right;margin-right:100px;font-size:15px;overflow:auto">
			<h3 align="center">概述</h3>
			<p>"十二五"规划是从2011年到2015年。“规划的简短描述”：全国“十二五”油气资源勘探开发规划是由国家发改委、国家能源局共同发布的关于我国油气资源勘探
				开发规划的文件，文件基于“十一五”油气资源勘探开发规划的完成情况，结合当前油气资源勘探开发的背景，对“十二五”期间油气资源勘探开发面临的形式进行了评估，
				对油气资源勘探开发的目标进行了规划。
			</p>
		</div>
	</div> 
	<div data-options="region:'center',split:true">
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
			
			/* var sb=$("#gl");
			$("#xxx").tooltip({
				position:'right',
				content:'<span>dfgdfhhs</span>'
			}) */
		});
	
		/* $(function(){
		   	
	    }) */
		
		$('.carousel').carousel({
			interval:3000
		})	
	
		myCharts=echarts.init(document.getElementById("zhutu"));
		myChartsF=echarts.init(document.getElementById("futu"));
		myChartsF2=echarts.init(document.getElementById("futu2"));
		myChartsF3=echarts.init(document.getElementById("futu3"));
		myChartsF4=echarts.init(document.getElementById("futu4"));
		
		var option={
				title:{
					text:'规划完成情况',
					x:'center',
					y:'top'
				},
				tooltip:{
					trigger:'axis',
					axisPointer:{
						type:'shadow'
					}
				}, 
				grid:{
					x:'150px',
					y:'40px'
				},
				xAxis:{
					type:'value',
					axisLabel:{
						show:true,
						interval:'auto',
						formatter:'{value} %'
					}
				},
				yAxis:{
					type:'category',
					show:true,
					data:['页岩气产量','煤层气产量','天然气产量','石油产量','新增页岩气探明地质储量','新增煤层气探明地质储量','新增天然气探明地质储量','新增石油探明地质储量']
				},
				series:[{
					name:'产量',
					type:'bar',
					data:[22.3, 19.3, 82.9, 103.3, 96.8, 45.6, 115.1, 94.3]
				}],
				label:{ 
	            	normal:{ 
		            	show: true, 
		            	position: 'outside'
		            	} 
	            	}
		};
		var optionFutu = {
	            title: {
	                text: '石油产量',
	                x:'center'
	            },
	            tooltip: {},
	            xAxis: {
	            	name:'年份',
	            	type:'category',
					show:true,
	                data: ["2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"]
	            },
	            yAxis: {
	            	name:'亿吨',
	            	type:'value'
	            },
	            series: [{
	                name: '销量',
	                type: 'bar',
	                data: [1.84, 1.87, 1.91, 1.88, 2.01, 2.03, 2.07, 2.09, 2.11, 2.03]
	            }],
	            label:{ 
	            	normal:{ 
		            	show: true, 
		            	position: 'outside'
		            	} 
	            	}
	        };
		myCharts.setOption(option);
		myChartsF.setOption(optionFutu);
		myChartsF2.setOption(optionFutu);
		myChartsF3.setOption(optionFutu);
		myChartsF4.setOption(optionFutu);
	</script>
</body>
</html>