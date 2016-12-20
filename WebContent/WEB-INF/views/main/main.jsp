<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<title>油气资源规划管理系统</title>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 80px; padding: 0px">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_top
			name=main_top src="<%=path%>/main/top"></IFRAME>
	</div>
	<div data-options="region:'west',split:false"
		style="width: 220px; padding: 0px;">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_left
			name=main_left src="<%=path%>/main/left"></IFRAME>
	</div>
	<div data-options="region:'center'">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_center
			name=main_center src="<%=path%>/main/center"></IFRAME>
	</div>
	<div data-options="region:'south',border:false" style="height: 32px;">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_bottom
			name=main_bottom src="<%=path%>/main/bottom"></IFRAME>
	</div>
</body>
</html>