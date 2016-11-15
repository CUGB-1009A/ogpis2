<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/easyui-1.5/themes/icon.css">
<script type="text/javascript" src="<%=path %>/easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/easyui-1.5/jquery.easyui.min.js"></script>
 <script type="text/javascript">
</script>
</head>
<body>
	<div class="easyui-layout" style="width: 100%;height:800px;">
		<div data-options="region:'north'" style="height:50px"></div>
		<div region="west" split="true" title="Navigator" style="width: 20%;">
			<div class="easyui-accordion" style="height: 100%;">
				<div title="模块一" iconCls="icon-ok" style="overflow:auto;padding:10px;">
					<h3 style="color:#0099FF;">Accordion for jQuery</h3>
					<p>Accordion is a part of easyui framework for jQuery. It lets you define your accordion component on web page more easily.</p>
				</div>
				<div title="模块二" iconCls="icon-reload" selected="true" style="padding:10px;" class="easyui-accordion" fit="true" border="false">
					<div id="mm" class="" style="width:120px; height:100%">
					    <div>New</div>
					    <div>
							<span>Open</span>
							<div style="width:150px;">
								<div><b>Word</b></div>
								<div>Excel</div>
								<div>PowerPoint</div>
							</div>
					    </div>
					    <div data-options="iconCls:'icon-save'">Save</div>
					    <div class="menu-sep"></div>
					    <div>Exit</div>
					</div>
				</div>
				<div title="模块三" iconCls="icon-ok">
					<ul id="tt1" class="easyui-tree">
						<li>
							<span>Folder1</span>
							<ul>
								<li>
									<span>Sub Folder 1</span>
									<ul>
										<li><span>File 11</span></li>
										<li><span>File 12</span></li>
										<li><span>File 13</span></li>
									</ul>
								</li>
								<li><span>File 2</span></li>
								<li><span>File 3</span></li>
							</ul>
						</li>
						<li><span>File2</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content" region="center" title="Language" style="padding: 5px; width:80%"></div>
		<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        	<div class="footer">版权所有：国土资源部油气中心</div>
    	</div>
		
	</div>
</body>
</html>