<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!-- CSS -->
<style type="text/css">
html, body {
	margin: 0;
	height: 100%;
	color: #000;
}

.contentDiv {
	font-family: '宋体';
	font-size: 16px;
	font-weight: 300;
	color: #000;
	line-height: 30px;
	text-align: left;
}

</style>

<link rel="stylesheet" type="text/css" href="<%=path %>/resource/easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/resource/easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/resource/easyui-1.5/themes/bootstrap/easyui.css">
<!-- FontAwesome 4.3.0 -->
<link href="<%=path %>/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=path %>/dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path %>/resource/easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/resource/easyui-1.5/jquery.easyui.min.js"></script> 
<script type="text/javascript" src="<%=path %>/resource/supcan1.0.95.0/binary/dynaload.js"></script>
<script type="text/javascript" src="<%=path%>/resource/echart/echarts.js"></script>
<script src="<%=path %>/dist/js/app.min.js" type="text/javascript"></script>


<%@ taglib uri="/WEB-INF/taglib/c.tld" prefix="c"%>

<script type="text/javascript">
function main_center_load(url){
	$("#main_center").load("<%=path%>"+url);
}
$(function(){
	$("#wrapper").css("height",document.body.scrollHeight);
});
</script>

