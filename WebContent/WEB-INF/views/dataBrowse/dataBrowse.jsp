<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="../init.jsp"%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/supcan1.0.95.0/binary/dynaload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataBrowse/bulidReport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataBrowse/creatReport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/echart/echarts.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/echart/myEcharts.js"></script>
</head>
<body>
	<div style="position:relative;width:100%;height:900px"> 
		<script type="text/javascript">		
			insertReport('A0000', '');
		</script>		
	</div>
</body>
<script type="text/javascript">
</script>
</html>