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
	<div>
		<form action="<%=path %>/index/save" method="post" onsubmit="return check()">
			<input type="hidden" value="<%=isAdd %>" name="isAdd"/>
			<input type="hidden" value="${index.id }" name="id"/>
			<div>
				<label>指标项名称</label>
				<div>
					<input class="easyui-validatebox" type="text" id="indexName" placeholder="指标项名称" name="indexName" value="${index.indexName }">
				</div>
			</div><br/>
			<div>
				<label>指标单位</label>
				<div>
					<input type="text" id="indexUnit" placeholder="指标单位" name="indexUnit" value="${index.indexUnit}">
				</div>
			</div><br/>
			<div>
				<label>指标类型</label>
				<div>
					<select id="selectType" name="planType" <c:if test="<%=!isAdd %>">disabled</c:if>>
						<option value='QG' <c:if test="${type.equals('QG') }">selected</c:if>>全国</option>
						<option value='ZSH' <c:if test="${type.equals('ZSH') }">selected</c:if>>中石化</option>
						<option value='ZSY' <c:if test="${type.equals('ZSY') }">selected</c:if>>中石油</option>
						<option value='ZHY' <c:if test="${type.equals('ZHY') }">selected</c:if>>中海油</option>
						<option value='YC' <c:if test="${type.equals('YC') }">selected</c:if>>延长石油</option>
						<option value='ZLM' <c:if test="${type.equals('ZLM') }">selected</c:if>>中联煤</option>
						<option value='QT' <c:if test="${type.equals('QT') }">selected</c:if>>其他</option>
					</select>
				</div>
			</div><br/>
			<div>
				<label>矿种类型</label>
				<div>
					<select id="selectMineType" name="mineType">
						<option value='1' <c:if test="${index.mineType.equals('1') }">selected</c:if>>石油</option>
						<option value='2' <c:if test="${index.mineType.equals('2') }">selected</c:if>>天然气</option>
						<option value='3' <c:if test="${index.mineType.equals('3') }">selected</c:if>>煤层气</option>
						<option value='4' <c:if test="${index.mineType.equals('4') }">selected</c:if>>页岩气</option>
						<option value='5' <c:if test="${index.mineType.equals('5') }">selected</c:if>>其他</option>
					</select>
				</div>
			</div><br/>
			<div>
				<label>储产量</label>
				<div>
					<select id="selectIndexType" name="indexType">
						<option value='1' <c:if test="${index.indexType.equals('1') }">selected</c:if>>新增探明地质储量</option>
						<option value='2' <c:if test="${index.indexType.equals('2') }">selected</c:if>>产量</option>
						<option value='3' <c:if test="${index.indexType.equals('3') }">selected</c:if>>其他</option>
					</select>
				</div>
			</div><br/>
			<div>
				<label>是否跟踪</label>
				<div>
					<label>
						<input type="radio" name="track" value="<%=true %>" <c:if test="${index.track }">checked</c:if>>是
					</label>					
					<label>
						<input type="radio" name="track" value="<%=false %>" <c:if test="${!index.track }">checked</c:if>>否
					</label>					
				</div>
			</div><br/>
			<div>
				<label>优先级</label>
				<div>
					<input type="text" id="priority" placeholder="优先级" name="priority" value="${index.priority}">
				</div>
			</div><br/>
			
			<div>
				<button type="submit">
					确认
				</button>
			</div>
			<div>
				<button type="button" onclick=window.location.href=<%=path %>/index/list?type=${type}>
					返回
				</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
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