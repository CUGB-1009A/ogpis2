<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>添加指标项</title>
	<%
		boolean isAdd=request.getAttribute("index")==null;
	%>
</head>
<body>
	<div>
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/index/list?type=${type}">指标项管理</a>
			</li>
			<c:if test="<%=isAdd %>">
				<li class="active">新建指标</li>
			</c:if>
			<c:if test="<%=!isAdd %>">
				<li class="active">修改指标</li>
			</c:if>
		</ul>
	</div>
</body>
</html>