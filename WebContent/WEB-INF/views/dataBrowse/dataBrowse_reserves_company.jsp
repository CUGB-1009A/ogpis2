<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/reserves_Com.js"></script>
</head>
<body>
	<div id="reserves11"  style="width:100%;height:100%">
		<script>
			insertReport('reserves_company_tab1', '')
		</script>
	</div>
</body>
</html>