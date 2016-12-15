<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>新建规划</title>
</head>
<body style="text-align:center">
	<div>
		<div class="easyui-panel" title="新建规划">
			<form method="post" action="<%=path%>/plan/save" id="planFrom">
				<table cellpadding="5" style="margin:0 auto;text-align:center">
					<tr>
						<td>规划名称</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'规划名称'" id="planName" name="planName" style="width: 50%;height:32px"></td>
					</tr>
					<tr>
						<td>规划代号</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'规划代号'" id="planCode" name="planCode" style="width: 50%;height:32px"></td>
					</tr>
					<tr>
						<td>发布单位</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'发布单位'" id="releaseUnit" name="releaseUnit" style="width: 50%;height:32px"></td>
					</tr>
					<tr>
						<td>发布时间</td>
						<td>
							<input id="releaseTime" class="easyui-datebox" name="releaseTime" 
								data-options="formatter:myformatter,parser:myparser,prompt:'发布时间'"
								style="width: 50%;height:32px">
						</td>
					</tr>
					<tr>
						<td>规划起始时间</td>
						<td>
							<input id="startTime" class="easyui-datebox" name="startTime" 
								data-options="formatter:myformatter,parser:myparser,prompt:'规划起始时间'"
								style="width: 50%;height:32px">
						</td>
					</tr>
					<tr>
						<td>规划截止时间</td>
						<td>
							<input id="endTime" class="easyui-datebox" name="endTime" 
								data-options="formatter:myformatter,parser:myparser,prompt:'规划截止时间'"
								style="width: 50%;height:32px">
						</td>
					</tr>
					<tr>
						<td>矿种类型</td>
						<td>
							<select id="planType" name="planType">
								<c:forEach items="${planType }" var="item">
									<option value="${item.key }">${item }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>规划概述</td>
						<td>
							<input class="easyui-textbox" type="text" data-options="prompt:'规划概述',multiline:true" id="planShortDescription" name="planShortDescription" style="width:60%;height:100px">
						</td>
					</tr>
					<tr>
						<td>规划背景和依据</td>
						<td>
							<div style="width:1000px;height:300px">
								<script id="container" name="planDescription" type="text/plain" ></script>
								<script type="text/javascript" src="<%=path%>/assets/ueditor/ueditor.config.js"></script>
								<script type="text/javascript" src="<%=path%>/assets/ueditor/ueditor.all.js"></script>
								<script type="text/javascript">
									var ue=UE.getEditor('container',{elementPathEnable:false});
								</script>
							</div>
						</td>
					</tr>
				</table>
				<div style="margin:0 auto;text-align:center">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" iconCls="icon-ok">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path%>/plan/list?type=All&&condition=" class="easyui-linkbutton" iconCls="icon-back">返回</a>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function submitForm(){
			$('#planFrom').form('submit');
		}
	
		//自定义日期格式
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		//解析时间格式
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
</body>
</html>