<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!-- CSS -->
<style type="text/css">
    html, body{ margin:0; height:100%; color: #000;}
    .contentDiv{
        font-family: '宋体';
    	font-size: 16px;
    	font-weight: 300;
    	color: #000;
    	line-height: 30px;
    	text-align: left; 
}
    }
</style>
<link rel="stylesheet" type="text/css" href="<%=path %>/easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/easyui-1.5/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/easyui-1.5/jquery.easyui.min.js"></script> 
<%@ taglib uri="/WEB-INF/taglib/c.tld" prefix="c"%>

<script type="text/javascript">
function main_center_load(url){
	$("#main_center").load("<%=path%>"+url);
}
$(function(){
	$("#wrapper").css("height",document.body.scrollHeight);
});
</script>

 