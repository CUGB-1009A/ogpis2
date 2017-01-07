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
		
	})
</script>

</head>
<body>

	<div id="tt_zyl_dq" class="easyui-tabs" data-option="fit:true">   
	    <div title="年度大区各盆地油气资源量" style="display:none;">   
	        <div data-options="region:'center'">   
		        <div class="easyui-layout" style="width:100%;height:900px;">   
		            <div data-options="region:'north',split:true" style="height:110px;z-index=9999">

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
		               
		            <div data-options="region:'center'">
		            	<div id="zyl11" style="width:100%;height:100%">
							<script>
								insertReport('AF_zyl_qg_02', 'Rebar=none; Border=none; Ruler=none; PagesTabPercent=0; SeperateBar=none')
							</script>
						</div>
		            </div>   
		        </div>   
		    </div>    
	    </div>
	    
	    <div title="年度大区各盆地油气资源量1" style="display:none;">   
	        <div data-options="region:'center'">   
		        <div class="easyui-layout" style="width:100%;height:900px;">   
		            <div data-options="region:'north',split:true" style="height:110px;z-index=9999">
		            	<div style="float:left;">
		            		<table>
			            		<tr>
					            	<td style="width:100px">年度</td>
					            	<td>
					            		<select id="year1" style="width:199px;">   										    
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
					            		<select id="resourceType1" style="width:199px;">   
										    <option value="">石油</option>   
										    <option>天然气</option>   										      
										</select>
					            	</td>
					            </tr>
					            <tr>
					            	<td style="width:100px">大区名称</td>
					            	<td>
					            		<select id="area1" style="width:199px;">					            
										    <option value="aa">东部</option>   
										    <option>中部</option>   
										    <option>西部</option>   
										    <option>南方</option>   
										    <option>近海</option>										       
										</select>										
					            	</td>
					            	<td style="width:100px">资源量类型</td>
					            	<td>
					            		<select id="resourceQuantity1" style="width:199px;">   
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
		               
		            <div data-options="region:'center'">
		            	<div id="zyl11" style="width:100%;height:100%">
							<script>
								insertReport('AF_zyl_qg_01', 'Rebar=none; Border=none; Ruler=none; PagesTabPercent=0; SeperateBar=none')
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

</body>


</html>