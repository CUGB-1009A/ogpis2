<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/report.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/bulidReport.js"></script>
	
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

<div id="username">sssssss</div>
	<div id="tt_zyl_dq" class="easyui-tabs" data-option="fit:true">   
	    <div title="年度大区各盆地油气资源量" style="display:none;">   
	        <div data-options="region:'center'">   
		        <div class="easyui-layout" style="width:100%;height:900px;">   
		            <div data-options="region:'north',split:true" style="height:110px;z-index=9999">
		            	<iframe src="<%=request.getContextPath()%>/js/dataBrowse/browse_center.html" width="100%" height="100%"></iframe>
		            </div>
		               
		            <div data-options="region:'center'">
		            
		            	<div id="report" style="width:100%;height:100%">
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