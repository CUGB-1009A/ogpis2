<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/bulidReport.js"></script> --%>
<script type="text/javascript"
<<<<<<< HEAD
	src="<%=request.getContextPath()%>/resource/echart/myEcharts.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/browseHandle.js"></script>
=======
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/bulidReport.js"></script>
<style type="text/css">
tr{
height:30px;
}
td{
width:200px;
}

</style>
>>>>>>> refs/remotes/origin/数据要览
</head>
<body>
<<<<<<< HEAD
	<div id="ttReport" class="easyui-tabs" data-options="fit:true">   
	    <div title="大区" style="display:none;">
		    <div id="tterjiReport" class="easyui-tabs" data-options="fit:true">   
			    <div title="年度大区盆地油气资源量" style="display:none;">
			    	<div style="width:50%;height:60px;float:left;padding:10px 0 0 5px">
			    		<table style="border: 0px solid blue;">
			    			<tr>
			    				<td style="width:10%;">年度</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>2006</option>
			    						<option>2007</option>
			    						<option>2008</option>
			    						<option>2009</option>
			    						<option>2010</option>
			    						<option>2011</option>
			    						<option>2012</option>
			    						<option>2013</option>
			    						<option>2014</option>
			    						<option>2015</option>
			    						<option>2016</option>
			    					</select>
			    				</td>
			    				<td style="width:10%;">资源类型</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>石油</option>
			    						<option>天然气</option>
			    					</select>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td style="width:10%;">大区名称</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>东部</option>
			    						<option>中部</option>
			    						<option>西部</option>
			    						<option>南方</option>
			    						<option>青藏</option>
			    						<option>近海</option>
			    						<option>南海南部</option>
			    					</select>
			    				</td>
			    			</tr>
			    		</table>
			    	</div>
			    	<div style="padding:15px 20px;width:45%;height:60px;text-align:right;float:right">
			    		<input name="selectA00" type="button" value="查看报表"/>			    		
			    		<input name="selectA00" type="button" value="查看图表"/>
			    	</div>
			    	<div id="A000" style="width:100%;height:400px;fload:left;display:''">
			    		<img alt="" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang.jpg">
			    	</div>
			    	<div id="A001" style="width:100%;height:400px;fload:left;display:none">
			    		<img alt="" style="width:80%;height:100%" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang2.jpg">
			    	</div> 
			         <!-- <div id="reportdiv" style="display:''">
			        	<div id="dv1" style="position:relative;width:100%;height:600px;">
					        <script>
					        	insertReport('AF', '')
					        </script>
				        </div> 
			        </div> -->
			       <!--  <div id="chartdiv" style="width:80%;height:500px;display:''">
			        	
			        </div>  -->  
			    </div>   
			</div>   
	           
	    </div>   
	    <div title="全国" style="overflow:auto;display:none;">   
			<div id="tterjiReport" class="easyui-tabs" data-options="fit:true">   
			    <div title="年度各盆地油气资源量" style="padding:20px;display:none;">   
			        <div style="width:50%;height:60px;float:left;">
			    		<table style="border: 0px solid blue;">
			    			<tr>
			    				<td style="width:10%;">年度</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>2006</option>
			    						<option>2007</option>
			    						<option>2008</option>
			    						<option>2009</option>
			    						<option>2010</option>
			    						<option>2011</option>
			    						<option>2012</option>
			    						<option>2013</option>
			    						<option>2014</option>
			    						<option>2015</option>
			    						<option>2016</option>
			    					</select>
			    				</td>
			    				<td style="width:10%;">资源类型</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>石油</option>
			    						<option>天然气</option>
			    					</select>
			    				</td>
			    			</tr>			    			
			    		</table>
			    	</div>
			    	<div style="padding:15px 20px;width:45%;height:60px;text-align:right;float:right">			    		
					    <input name="selectA020" type="button" value="查看报表"/>
			    		<input name="selectA020" type="button" value="查看图表"/>
			    	</div>
			    	<div id="A020" style="width:100%;height:400px;fload:left;display:''">
			    		<img alt="" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang.jpg">
			    	</div>
			    	<div id="A021" style="width:100%;height:400px;fload:left;display:none">
			    		<img alt="" style="width:80%;height:100%" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang2.jpg">
			    	</div>   
			    </div>
			    <div title="年度各大区油气资源量" style="overflow:auto;padding:20px;">   
		    		<div style="width:50%;height:60px;float:left;">
			    		<table style="border: 0px solid blue;">
			    			<tr>
			    				<td style="width:10%;">年度</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>2006</option>
			    						<option>2007</option>
			    						<option>2008</option>
			    						<option>2009</option>
			    						<option>2010</option>
			    						<option>2011</option>
			    						<option>2012</option>
			    						<option>2013</option>
			    						<option>2014</option>
			    						<option>2015</option>
			    						<option>2016</option>
			    					</select>
			    				</td>
			    				<td style="width:10%;">资源类型</td>
			    				<td style="width:25%;">
			    					<select class="easyui-combobox">
			    						<option>石油</option>
			    						<option>天然气</option>
			    					</select>
			    				</td>
			    			</tr>			    			
			    		</table>
			    	</div>
			    	<div style="padding:15px 20px;width:45%;height:60px;text-align:right;float:right">			    		
			    		<input name="selectA010" type="button" value="查看报表"/>
			    		<input name="selectA010" type="button" value="查看图表"/>
			    		
			    	</div>
			    	<div id="A010" style="width:100%;height:400px;fload:left;display:''">
			    		<img alt="" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang.jpg">
			    	</div>
			    	<div id="A011" style="width:100%;height:400px;fload:left;display:none">
			    		<img alt="" style="width:80%;height:100%" src="<%=request.getContextPath()%>/image/databrowseimg/daqupendiziyuanliang2.jpg">
			    	</div>
			    </div>
			    <!-- <div title="年度各省区油气资源量" style="overflow:auto;padding:20px;display:none;">   
		    		<div id="div2" style="position:relative;width:900px;height:600px">
						
			        </div>
			    </div> -->    
			</div>
	    </div> 
	</div>  
	
	
=======
	<div id="tt_zyl_dq" class="easyui-tabs" data-option="fit:true">   
	    <div title="年度大区各盆地油气资源量" style="display:none;">   
	        <div data-options="region:'center'">   
		        <div class="easyui-layout" style="width:100%;height:900px;">   
		            <div data-options="region:'north',split:true" style="height:110px">
		            	<div style="float:left;">
		            		<table>
			            		<tr>
					            	<td style="width:100px">年度</td>
					            	<td>
					            		<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
										    <option value="aa">2006</option>   
										    <option>2007</option>   
										    <option>2008</option>   
										    <option>2009</option>   
										    <option>2010</option>   
										</select>
					            	</td>
					            	<td style="width:100px">资源类型</td>
					            	<td>
					            		<select id="cc" class="easyui-combobox" name="dept" style="width:199px;">   
										    <option value="aa">石油</option>   
										    <option>天然气</option>   										      
										</select>
					            	</td>
					            </tr>
					            <tr>
					            	<td style="width:100px">大区名称</td>
					            	<td>
					            		<select id="cc" class="easyui-combobox" name="dept" style="width:199px;">   
										    <option value="aa">东部</option>   
										    <option>中部</option>   
										    <option>西部</option>   
										    <option>南方</option>   
										    <option>近海</option>   
										</select>
					            	</td>
					            	<td style="width:100px">资源量类型</td>
					            	<td>
					            		<select id="cc" class="easyui-combobox" name="dept" style="width:199px;">   
										    <option value="aa">地质资源量</option>   
										    <option>可采资源量</option>   
										    <option>待探明地质资源量</option>   
										    <option>待探明可采资源量</option>     
										</select>
					            	</td>
					            </tr>
					            <tr>
					            	<td style="width:100px">盆地范围</td>
					            	<td>
					            		<select id="cc" class="easyui-combobox" name="dept" style="width:199px;">   
										    <option value="aa">前10</option>   
										    <option>前15</option>   
										    <option>前20</option>   
										    <option>前25</option>   
										    <option>前30</option>   
										</select>
					            	</td>
					            </tr>
			            	</table>
		            	</div>
		            	<div style="float:right;margin-right:30px;margin-top:40px">
		            		<a id="zyl_dq_tab1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> 
		            	</div>
		            </div>   
		            <div data-options="region:'center'">
		            	<div id="zyl11" style="width:100%;height:100%">
							<script>
								insertReport('AF_zyl_dq_01', 'Border=single,3D; Ruler=Horz; Rebar=Print,Property,Font; print=11, 216')
							</script>
						</div>
		            </div>   
		        </div>   
		    </div>    
	    </div> 
	</div>
	<!-- <div id="zyl21" style="width:100%;height:100%">
		<script>
			insertReport('AF_zyl_qg_01', '')
		</script>
	</div>
	<div id="zyl22" style="width:100%;height:100%">
		<script>
			insertReport('AF_zyl_qg_02', '')
		</script>
	</div>
	<div id="zyl11" style="width:100%;height:100%">
		<script>
			insertReport('AF_zyl_dq_01', '')
		</script>
	</div> -->
>>>>>>> refs/remotes/origin/数据要览
</body>
<<<<<<< HEAD
<script type="text/javascript">
$.ajax({  
	     type : "POST",  //提交方式  
	     url : "http://localhost:8080/report/test4.json",//路径  
	     data : "",//数据，这里使用的是Json格式进行传输  
	     success : function(result) {//返回数据根据结果进行相应的处理  
	     var box1=new CreatChart("chartdiv",{"title":"2006年东部各盆地石油资源量","xAxisName":"sss","yAxisName":"ceshi","series":result});  
	   	 box1.creatChart();
     }  
}); 
	
	//var box =new CreatChart("div2",{"title":"shili","xAxisName":"sss","yAxisName":"ceshi","series":{"A0005": [{"盆地名称":"渤海湾盆地","待探明地质资源量95":"141.72","待探明可采资源量95":"33.36","地质资源量":"69.21","可采资源量95":"89.26"},{"盆地名称":"海拉尔盆地","待探明地质资源量95":"21.72","待探明可采资源量95":"313.36","地质资源量":"369.21","可采资源量95":"419.26"},{"盆地名称":"松辽盆地","待探明地质资源量95":"71.72","待探明可采资源量95":"92.36","地质资源量":"99.21","可采资源量95":"124.26"}]}});
	//box.creatChart();
</script>
=======
>>>>>>> refs/remotes/origin/数据要览
</html>