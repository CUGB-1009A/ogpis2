<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="<%=path%>/assets/upload/webuploader.js"></script>
    <script type="text/javascript" src="<%=path%>/js/plan/planAdmin/detail.js"></script>
	<title>规划管理</title>
</head>
<body >	
	<div>
		<div style="width: 100px;float: left;margin-left: 20px;">
			<span>修改指标项</span>
		</div>
		<div align="center" style="margin: 20px 20px 0 20px;border: 2px;">
			<form action="<%=path%>/plan/savePlan_Index" method="post">
				<input type="hidden" value="${plan_Index.index.id }" name="indexId"/>
				<input type="hidden" value="${plan_Index.plan.id }" name="planId"/>
				<input type="hidden" value="${plan_Index.id }" name="plan_IndexId"/>
				<table cellpadding="5" style="margin:0 auto;text-align:center">
					<tr>
						<td>指标项</td>
						<td>
							<input type="text" id="indexName" name="indexName" value="${plan_Index.index.indexName }"
								data-options="prompt:'指标项名称'" class="easyui-textbox"
								style="width:500px;height: 40px"/>
						</td>
					</tr>
					<c:if test="${plan_Index.index.track }">
						<tr>
							<td>目标值</td>
							<td>
								<input type="text" id="targetValue" name="targetValue" data-options="prompt:'目标值...'"
									value="${plan_Index.targetValue }" class="easyui-textbox"
									style="width:500px;height: 40px"/>
							</td>
						</tr>
						<tr>
							<td>完成情况</td>
							<td>
								<input id="indexPerformance" name="indexPerformance" data-options="prompt:'完成情况...',multiline:true"
									value="${plan_Index.indexPerformance }" class="easyui-textbox"
									style="width:500px;height: 250px">
									
							</td>
						</tr>
					</c:if>
					<tr>
						<td>历史数据描述</td>
						<td>
							<input id="historyDescription" name="historyDescription" data-options="prompt:'历史数据描述...',multiline:true"
								value="${plan_Index.historyDescription }" class="easyui-textbox"
								style="width:500px;height: 250px">
								
						</td>
					</tr>
				</table>
				<div>
					<button type="submit">确认</button>
					<button type="button" onclick="back()">返回</button>
				</div>
			</form>
			<div>
				this is ${plan_Index.index.track }
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>