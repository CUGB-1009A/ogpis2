<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/data_mould.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/mychart.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/bulidReport.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/browseHandle.js"></script>
<style type="text/css">
	tr{
	height:30px;
	}
	td{
	width:200px;
	}
</style>
   
<script type="text/javascript">
	$(function(){
		BrowseHandle.init();
		 /* window.onresize =function(){
			 alert("sss");
			BrowseHandle.winWidth=$(window).width();
			BrowseHandle.winHeight=$(window).height();
		}; */ 
 		/* var som={
            "xName":"盆地",
            "yName":"亿方",
            "ds1":[
            {"盆地名称":"渤海湾盆地","地质资源量95":369.23},
            {"盆地名称":"渤海湾盆地","地质资源量95":208.23}, 
            {"盆地名称":"渤海湾盆地","地质资源量95":128.23},
            {"盆地名称":"渤海湾盆地","地质资源量95":105.23},
            {"盆地名称":"渤海湾盆地","地质资源量95":81.23},
            {"盆地名称":"渤海湾盆地","地质资源量95":32.23}                       
        ]}
		/* var report=new Data_mould("2006年全国石油资源量",som);
		var chartdata= report.chart_data();
		var chart=new CreatChart('main',chartdata);
		chart.chart_bar(); */ 
		//BrowseHandle.refreshReportAndChart("2016年全国地质资源量",som); */
	})
</script>

</head>
<body>
	<div data-options="region:'north'" style="height:110px">
		<div id="browsett" class="easyui-tabs" data-options="fit:true">
			<div title="年度大区各盆地油气资源量">
				<div style="float:left;">
            		<table>
	            		<tr>
			            	<td style="width:100px">年度</td>
			            	<td>
			            		<select id="year" style="width:199px;">   										    
								    <option value="aa">2006</option>   
								    <option>2007</option>   
								    <option>2008</option>   
								    <option>2009</option>   
								    <option>2010</option>
								    <option>2011</option>   
								</select>
			            	</td>
			            	<td style="width:100px">资源类型</td>
			            	<td>
			            		<select id="resourceType" style="width:199px;">   
								    <option value="">石油</option>   
								    <option>天然气</option>   										      
								</select>
			            	</td>
			            </tr>
			            <tr>
			            	<td style="width:100px">大区名称</td>
			            	<td>
			            		<select id="area" style="width:199px;">					            
								    <option value="aa">东部</option>   
								    <option>中部</option>   
								    <option>西部</option>   
								    <option>南方</option>   
								    <option>近海</option>										       
								</select>										
			            	</td>
			            	<td style="width:100px">资源量类型</td>
			            	<td>
			            		<select id="resourceQuantity" style="width:199px;">   
								    <option value="aa">地质资源量</option>   
								    <option>可采资源量</option>   
								    <option>待探明地质资源量</option>   
								    <option>待探明可采资源量</option>     
								</select>
			            	</td>
			            </tr>
	            	</table>
            	</div>
            	<div style="float:right;margin-right:30px;margin-top:40px">
            		<a id="search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" class="">查询</a> 
            	</div>
			</div>			
			<div title="年度大区各盆地油气资源量2">
				<div style="float:left;">
            		<table>
	            		<tr>
			            	<td style="width:100px">年度</td>
			            	<td>
			            		<select id="year" style="width:199px;">   										    
								    <option value="aa">2006</option>   
								    <option>2007</option>   
								    <option>2008</option>   
								    <option>2009</option>   
								    <option>2010</option>
								    <option>2011</option>   
								</select>
			            	</td>
			            	<td style="width:100px">资源类型</td>
			            	<td>
			            		<select id="resourceType" style="width:199px;">   
								    <option value="">石油</option>   
								    <option>天然气</option>   										      
								</select>
			            	</td>
			            </tr>
			            <tr>
			            	<td style="width:100px">大区名称</td>
			            	<td>
			            		<select id="area" style="width:199px;">					            
								    <option value="aa">东部</option>   
								    <option>中部</option>   
								    <option>西部</option>   
								    <option>南方</option>   
								    <option>近海</option>										       
								</select>										
			            	</td>			            	
			            </tr>
	            	</table>
            	</div>
            	<div style="float:right;margin-right:30px;margin-top:40px">
            		<a id="search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" class="">查询</a> 
            	</div>
			</div>
		</div>
	</div>
	<!-- The position of report and chart -->
	<div data-options="region:'center' fit:true">
		<div style="width:98%;height:30%;text-align:center; font-size:18pt;font-weight:bolder;"><p id="browseTitle" vertical-align:center;>2006年全国石油资源量</p></div>
        <div style="text-align:center;">
        	<div id="dataBrowseRepDiv" style="width:45%;height:400px;float:left;padding-left:50px">
				<script>
					insertReport('dataBrowseReport', 'Rebar=none; Border=none; Ruler=none; PagesTabPercent=0; SeperateBar=none')
				</script> 
			</div>
			<div id="dataBrowseChartDiv"style="width:50%;height:450px;float:left;"></div>
        </div>
	</div>
</body>


</html>