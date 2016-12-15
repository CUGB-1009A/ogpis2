<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产量预测--new</title>
	<script type="text/javascript" src="<%=path%>/js/sz/fillReportData.js"></script>
	<style type="text/css">
		a{ text-decoration: none;}
		a:hover{txt-decoration:underline;} 
	</style>
</head>
<body>
	<div id="tt" class="easyui-tabs" style="width:100%;height:100%;">   
	    
	    <div title="模型选择" data-options="closable:false" style="overflow:auto;padding:20px;display:none;">   
	       		<div style="width:50%;height:90%;float:left;">
		<div style="width:100%;height:100%;float:left">
			<div style="padding:10px">
				模型相关信息：<br>
				<div class="col-sm-10">
					<%-- <script id="container" name="modelDescription" type="text/plain" style="height:300px"></script>
										 <!-- 配置文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.config.js"></script>
				    <!-- 编辑器源码文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.all.js"></script>
				    <!-- 实例化编辑器 -->
				    <script type="text/javascript">
				        var ue = UE.getEditor('container');
				    </script>  --%>
				    <script id="container" name="haha" type="text/plain" style="height:300px"></script>
					<!-- 配置文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.config.js"></script>
				    <!-- 编辑器源码文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.all.js"></script>
				    <!-- 实例化编辑器 -->
				    <script type="text/javascript">
				    var ue = UE.getEditor('container');
	    			</script>
				</div>
			</div>
		</div>
	</div>
	    </div>   
	    
	</div> 
</body>
<script type="text/javascript">

</script>
</html>