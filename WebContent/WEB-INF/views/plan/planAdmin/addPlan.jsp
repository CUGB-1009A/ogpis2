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
			
				<input type="hidden" value="true" name="isAdd">
				<input type="hidden" name="indexIds">
				<table cellpadding="5" style="margin:0 auto;text-align:center">
					<tr>
						<td>规划名称</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'规划名称'" id="planName" name="planName" style="width: 60%;height:32px"></td>
					
						<td>规划代号</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'规划代号'" id="planCode" name="planCode" style="width: 60%;height:32px"></td>
					</tr>
					<tr>
						<td>发布单位</td>
						<td><input class="easyui-textbox" type="text" data-options="prompt:'发布单位'" 
							id="releaseUnit" name="ReleaseUnit" style="width: 60%;height:32px"></td>
					
						<td>发布时间</td>
						<td>
							<input id="releaseDate" class="easyui-datebox" name="releaseDate" 
								data-options="formatter:myformatter,parser:myparser,prompt:'发布时间'"
								style="width: 60%;height:32px">
						</td>
					</tr>
					<tr>
						<td>规划起始时间</td>
						<td>
							<input id="startTime" class="easyui-datebox" name="startTime" 
								data-options="formatter:myformatter,parser:myparser,prompt:'规划起始时间'"
								style="width: 60%;height:32px">
						</td>
					
						<td>规划截止时间</td>
						<td>
							<input id="endTime" class="easyui-datebox" name="endTime" 
								data-options="formatter:myformatter,parser:myparser,prompt:'规划截止时间'"
								style="width: 60%;height:32px">
						</td>
					</tr>
					<tr>
						<td>规划类型</td>
						<td>
							<select id="planType" name="planType" class="select" style="width:60%;height:32px">
								<c:forEach items="${planType }" var="item">
									<option value="${item.key }">${item }</option>
								</c:forEach>
							</select>
						</td>
					
						<td>规划概述</td>
						<td>
							<input class="easyui-textbox" type="text" data-options="prompt:'规划概述',multiline:true" id="planShortDescription" 
								name="planShortDescription" style="width:60%;height:100px">
						</td>
					</tr>
					<tr>
						<td>规划背景和依据</td>
						<td colspan="3">
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
					<button type="submit" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="easyui-linkbutton" type="button" onclick="back()" data-options="iconCls:'icon-back'">返回</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function back(){
			window.location.href="<%=path%>/plan/list?type=All&&condition=";
		}
		
		function check(){
			var planName=$('#planName').val();
			var releaseDate=$('#releaseDate').val();
			var planCode=$('#planCode').val();
			var startTime=$('#startTime').val();
			var releaseUnit=$('#releaseUnit').val();
			var endTime=$('#endTime').val();
			var planShortDescribtion=$('#planShortDescribtion').val();
			var ueContent=UE.getEditor('container').getPlainTxt()
				//alert(UE.getEditor('container').getContentLength(true));
			if(planName==''||releaseDate==''||planCode==''||startTime==''||releaseUnit==''||endTime==''||planShortDescribtion==''){
				alert('请填写完整信息再提交');
				return true;
			}
			if(startTime>endTime){
				alert('规划起始时间不对');
				return false;
			}
			if(UE.getEditor('container').getContentLength(true)>10000){
				alert('你输入的背景过长，请精简内容再试！');
				return false;
			}
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