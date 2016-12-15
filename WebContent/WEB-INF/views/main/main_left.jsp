<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="easyui-accordion" style="height: 100%;">
	<div title="模块一" iconCls="icon-ok" style="overflow:auto;padding:10px; height:100%;">
		<ul>
			<li>
				<span><a href="<%=path%>/demo" target=main_center>Demo</a></span>
			</li>
		</ul>
	</div>
	<div title="系统管理" iconCls="icon-tip" style="overflow:auto; padding:10px; height:100%;" class="easyui-accordion" fit="true" border="false">

		<ul>

			<li><span><a href="<%=path%>/demo" target=main_center>Demo</a></span>

			<li>
				<span><a href="<%=path%>/system/user/list" target=main_center>用户管理</a></span>
			</li>

			<li>
				<span><a href="<%=path%>/forecast" target=main_center>预测</a></span>
			</li>
		</ul>
	</div>
	
	<div title="模块三" iconCls="icon-reload"
		style="overflow: auto; padding: 10px; height: 100%;">
		<ul>
			<li><span><a href="<%=path%>/demo" target=main_center>Demo</a></span></li>
			
			<li><span><a href="<%=path%>/" target=main_center>资源管理</a></span></li>
			<li><span><a href="<%=path%>/xtgl/listOper.jsp" target=main_center>权限管理</a></span></li>
			<li><span><a href="<%=path%>/xtgl/listRole.jsp" target=main_center>角色管理</a></span></li>
		</ul>
	</div>
	<!-- 数据要览 -->
	<div title="数据要览" data-options="iconCls:'icon-reload'"
		style="overflow: auto; padding: 10px; height: 100%;">
		<ul>
			<li><span><a href="<%=path%>/dataBrowse"
					target=main_center>资源量专题</a></span></li>
			<li><span><a href="<%=path%>/" target=main_center>储量专题</a></span>

			</li>
			<li><span><a href="<%=path%>/xtgl/listOper.jsp"
					target=main_center>储量专题</a></span></li>
			<li><span><a href="<%=path%>/xtgl/listRole.jsp"
					target=main_center>勘探开发专题</a></span></li>
		</ul>
	</div>
	
	<!-- 趋势预测分析 -->
	<div title="趋势预测分析" iconCls="icon-reload" style="overflow:auto; padding:10px; height:100%;" selected="true" class="easyui-accordion" fit="true" border="false">
		<ul>
			<li><span><a href="" target=main_center>数据管理</a></span></li>
			<li><span><a href="<%=path%>/model/list" target=main_center>模型管理</a></span></li>
			<%-- <li><span><a href="<%=path%>/forecast/toOutputPredictionPage?dataCollectionType=output" target=main_center>产量预测-old</a></span></li> --%>
			<li><span><a href="<%=path%>/forecast/toPredictionPage" target=main_center>趋势预测</a></span></li>
		</ul>
	</div>
</div>
