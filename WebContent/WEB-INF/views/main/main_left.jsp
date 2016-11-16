<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="easyui-accordion" style="height: 100%;">
	<div title="模块一" iconCls="icon-ok" style="overflow:auto;padding:10px; height:100%;"  >
		
	</div>
	<div title="模块二" iconCls="icon-reload" style="overflow:auto; padding:10px; height:100%;" selected="true" class="easyui-accordion" fit="true" border="false">
		<ul>
			<li>
				<span><a href="<%=path%>/demo" target=main_center>Demo</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/forecast" target=main_center>预测</a></span>
			</li>
		</ul>
	</div>
</div>
