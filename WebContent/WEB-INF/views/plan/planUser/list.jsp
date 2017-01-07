<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="<%=path%>/resource/echart/echart.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    
	</script>
	<title>完成情况管理</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<div style="margin:10px 80px 10px 10px;">
			<span style="font-size:24px;font-family:微软雅黑">规划概览</span>
			<div style="float:right;">
				<form action="<%=path%>/plan/list">
					<input type="hidden" value="${type }" name="type">
					<input type="text"  class="easyui-textbox" id="inputFuzzyQuery" data-options="prompt:'模糊查询条件'" name="condition">
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="easyui-linkbutton">查询</button>					
				</form>			
			</div>
		</div>
		<div class="easyui-accordion" style="margin:20px 10px 10px 10px;text-align:center" id="sew">
			<div title="十二五规划 （2011-2015）" style="overflow:auto;padding:10px;">
				<div style="width:50%;float:left">
					<div class="easyui-panel">						
						<div class="charts" style="height:300px;width:100%" align="center" id="zhutu">
							
						</div>
					</div>
				</div>
				<div style="width:50%;float:right">
					<div class="easyui-panel">
						<div class="carousel slide" style="height:300px;width:100%" id="lunbo">
							<div class="carousel-inner">
								<div class="mainCharts" style="height:300px;width:100%" id="futu" align="center"></div>
								<div class="mainCharts" style="height:300px;width:100%" id="futu2" align="center"></div>
								<div class="mainCharts" style="height:300px;width:100%" id="futu3" align="center"></div>
								<div class="mainCharts" style="height:300px;width:100%" id="futu4" align="center"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div title="十三五规划 （2011-2015）" style="overflow:auto;padding:10px;">
				<div style="width:45%;float:left">
					<div class="easyui-panel">
						<p>This is 十二五规划</p>
						<p>This is 十二五规划</p>
					</div>
				</div>
				<div style="width:45%;float:right">
					<div class="easyui-panel">
						<p>This is 十二五规划</p>
						<p>This is 十二五规划</p>
					</div>
				</div>
			</div>
			<div title="十一五规划 （2011-2015）" style="overflow:auto;padding:10px;">
				<div style="width:45%;float:left">
					<div class="easyui-panel">
						<p>This is 十二五规划</p>
						<p>This is 十二五规划</p>
					</div>
				</div>
				<div style="width:45%;float:right">
					<div class="easyui-panel">
						<p>This is 十二五规划</p>
						<p>This is 十二五规划</p>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<script type="text/javascript">
	
		
		function showDetail(){
			window.location.href="<%=path%>/plan/userDetail";
		}
		
		$(function(){
		   		document.getElementById("zhutu").addEventListener('dblclick',showDetail,false);
		   	
	    })
		
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
		            	position: 'inside'
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