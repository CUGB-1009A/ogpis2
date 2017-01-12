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
	<div style="margin:10px 10px 10px 10px;">
		<ul>
			<c:if test="<%=isAdd %>">
				<li style="display:block;font-size:24px;font-family:微软雅黑"" class="active">新建指标</li>
			</c:if>
			<c:if test="<%=!isAdd %>">
				<li class="active">修改指标</li>
			</c:if>
		</ul>
	</div>
	<div class="easyui-panel" title="规划指标项" style="padding:10px 60px 20px 60px">
		<form action="<%=path %>/index/save" method="post" onsubmit="return check()">
				<input type="hidden" value="<%=isAdd %>" name="isAdd"/>
				<input type="hidden" value="${index.id }" name="id"/>
			<table cellpadding="5">
				<tr>
					<td>指标项名称</td>
					<td><input class="easyui-textbox" type="text" id="indexName" data-options="prompt:'指标项名称'" name="indexName" value="${index.indexName }"></td>
				</tr>
				<tr>
					<td>指标单位</td>
					<td><input class="easyui-textbox" type="text" id="indexUnit" data-options="prompt:'指标单位'" name="indexUnit" value="${index.indexUnit}"></td>
				</tr>
				<tr>
					<td>指标所属规划类型</td>
					<td>
						<select  id="selectType" name="planType" class="easyui-combobox" <c:if test="<%=!isAdd %>"></c:if>>
							<%-- <option value='GZL' <c:if test="${type.equals('GZL') }">selected</c:if>>工作量</option>
							<option value='CL' <c:if test="${type.equals('CL') }">selected</c:if>>新增探明地质储量</option>
							<option value='CN' <c:if test="${type.equals('CN') }">selected</c:if>>新建产能</option>
							<option value='CL' <c:if test="${type.equals('CL') }">selected</c:if>>产量</option>
							<option value='TZ' <c:if test="${type.equals('TZ') }">selected</c:if>>投资</option>
							<option value='CB' <c:if test="${type.equals('CB') }">selected</c:if>>成本</option> --%>
							<option value='QG' <c:if test="${type.equals('QG') }">selected</c:if>>全国</option>
							<option value='ZSY' <c:if test="${type.equals('ZSY') }">selected</c:if>>中石油</option>
							<option value='ZSH' <c:if test="${type.equals('ZSH') }">selected</c:if>>中石化</option>
							<option value='ZHY' <c:if test="${type.equals('ZHY') }">selected</c:if>>中海油</option>
							<option value='YC' <c:if test="${type.equals('YC') }">selected</c:if>>延长石油</option>
							<option value='ZLM' <c:if test="${type.equals('ZLM') }">selected</c:if>>中联煤</option>
							<option value='QT' <c:if test="${type.equals('QT') }">selected</c:if>>其他</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>指标</td>
					<td>
						<select id="selectMineType" name="mineType" class="easyui-combobox">
							<option class='gzl cb' value='二维地震' <c:if test="${index.mineType.equals('二维地震') }">selected</c:if>>二维地震</option>
							<option class='gzl cb' value='三维地震' <c:if test="${index.mineType.equals('三维地震') }">selected</c:if>>三维地震</option>
							<option class='gzl' value='探井井数' <c:if test="${index.mineType.equals('探井井数') }">selected</c:if>>探井井数</option>
							<option class='gzl' value='探井进尺' <c:if test="${index.mineType.equals('探井进尺') }">selected</c:if>>探井进尺</option>
							<option class='gzl' value='开发井井数' <c:if test="${index.mineType.equals('开发井井数') }">selected</c:if>>开发井井数</option>
							<option class='gzl' value='开发井进尺' <c:if test="${index.mineType.equals('开发井进尺') }">selected</c:if>>开发井进尺</option>
							<option class='ty' value='石油' <c:if test="${index.mineType.equals('石油') }">selected</c:if>>石油</option>
							<option class='ty' value='天然气(含致密气)' <c:if test="${index.mineType.equals('天然气(含致密气)') }">selected</c:if>>天然气(含致密气)</option>
							<option class='ty' value='页岩气' <c:if test="${index.mineType.equals('页岩气') }">selected</c:if>>页岩气</option>
							<option class='ty' value='煤层气' <c:if test="${index.mineType.equals('煤层气') }">selected</c:if>>煤层气</option>
							<option class='tz' value='勘探' <c:if test="${index.mineType.equals('勘探') }">selected</c:if>>勘探</option>
							<option class='tz' value='开发' <c:if test="${index.mineType.equals('开发') }">selected</c:if>>开发</option>
							<option class='cb' value='钻井' <c:if test="${index.mineType.equals('钻井') }">selected</c:if>>钻井</option>
							<option class='cb' value='油气发现' <c:if test="${index.mineType.equals('油气发现') }">selected</c:if>>油气发现</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>储产量</td>
					<td>
						<select id="selectIndexType" name="indexType" class="easyui-combobox">
							<option value='GZL' <c:if test="${index.indexType.equals('GZL') }">selected</c:if>>工作量</option>
							<option value='DZCL' <c:if test="${index.indexType.equals('DZCL') }">selected</c:if>>新增探明地质储量</option>
							<option value='CN' <c:if test="${index.indexType.equals('CN') }">selected</c:if>>新建产能</option>
							<option value='CL' <c:if test="${index.indexType.equals('CL') }">selected</c:if>>产量</option>
							<option value='TZ' <c:if test="${index.indexType.equals('TZ') }">selected</c:if>>投资</option>
							<option value='CB' <c:if test="${index.indexType.equals('CB') }">selected</c:if>>成本</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>是否跟踪</td>
					<td>
						<input type="radio" name="track" value="<%=true %>" <c:if test="${index.track }">checked</c:if>>是
						<input type="radio" name="track" value="<%=false %>" <c:if test="${!index.track }">checked</c:if>>否
					</td>
				</tr>
				<tr>
					<td>优先级</td>
					<td><input class="easyui-textbox" type="text" id="priority" data-options="prompt:'优先级'" name="priority" value="${index.priority}"></td>
				</tr>
				<tr>
					<td><button type="submit" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</button></td>
					<td><button class="easyui-linkbutton" type="button" onclick="back()" data-options="iconCls:'icon-back'">返回</button></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	
		$(function(){
			var planType=$('#selectType').val();
			if(planType=='GZL'){
				$('.ty').remove();
			}
		});
	
		function back(){
			window.location.href="<%=path%>/index/list?type=${type}";
		}
		
		function check(){
			var indexName=$('#indexName').val();
			var indexUnit=$('#indexUnit').val();
			var indexType=$('#indexType').val();
			var indexValue=$('#indexValue').val();
			if(indexName==''||indexUnit==''||indexType==''||indexValue==''){
				alert('请填写完整信息再提交');
				return false;
			}
		}
	</script>
</body>
</html>