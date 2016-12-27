<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/bulidReport.js"></script>
<style type="text/css">
	tr{
	height:30px;
	}
	td{
	width:200px;
	}
</style>

</head>
<body>

	<div id="tt_zyl_dq" class="easyui-tabs" data-option="fit:true">   
	    <div title="年度大区各盆地油气资源量" style="display:none;">   
	        <div data-options="region:'center'">   
		        <div class="easyui-layout" style="width:100%;height:600px;">   
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

</body>


</html>