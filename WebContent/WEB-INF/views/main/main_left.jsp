<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="easyui-accordion" style="height: 100%;">
	<div title="模块一" iconCls="icon-ok" style="overflow:auto;padding:10px; height:100%;"  >
		<li>
			<span><a href="<%=path%>/demo" target=main_center>Demo</a></span>
		</li>
	</div>
	<div title="系统管理" iconCls="icon-tip" style="overflow:auto; padding:10px; height:100%;" selected="true" class="easyui-accordion" fit="true" border="false">
		<ul>
			<li>
				<span><a href="<%=path%>/system/user/list" target=main_center>用户管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/system/role/list" target=main_center>权限管理</a></span>
			</li>
		</ul>
	</div>
</div>
