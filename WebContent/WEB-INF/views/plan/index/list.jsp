<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>规划指标管理</title>
</head>
<body>
	<div class="title">
		<c:forEach items="${planType }" var="item">
			<c:if test="${item.key.equals(type) }"><h3><b>${item }规划指标项定制</b></h3></c:if>
		</c:forEach>
	</div>
	<div style="text-align:right;margin:0 10px 0 10px">
	
		<select id="selectType" name="planType">
			<c:forEach items="${planType }" var="item">
				<option value="${item.key }"<c:if test="${item.key.equals(type) }">selected</c:if>>${item}</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add',size:'large'" href="<%=path%>/index/add?type=${type}">添加指标</a>
	</div>
	<div style="text-align:right;margin:0 10px 0 10px">
		<table class="easyui-datagrid" title="指标项管理">
			<thead>
				<tr>
					<th field='indexName'>指标名称</th>
					<th field="indexUnit">指标单位</th>
					<th field="mineType">矿种类型</th>
					<th field="indexType">指标类型</th>
					<th field="priority">显示顺序</th>
					<th field="operate">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${indexList }" var="item1" varStatus="status">
					<tr>
						<td>${item1.indexName }</td>
						<td>${item1.indexUnit }</td>
						<td>
							<c:if test="${item1.mineType.equals('1') }">石油</c:if>
							<c:if test="${item1.mineType.equals('2') }">天然气</c:if>
							<c:if test="${item1.mineType.equals('3') }">煤层气</c:if>
							<c:if test="${item1.mineType.equals('4') }">页岩气</c:if>
							<c:if test="${item1.mineType.equals('5') }">其他</c:if>
						</td>
						<td>
							<c:if test="${item1.indexType.equals('1') }">新增探明地质储量</c:if>
							<c:if test="${item1.indexType.equals('2') }">产量</c:if>
							<c:if test="${item1.indexType.equals('3') }">其他</c:if>
						</td>
						<td>${item1.priority }</td>
						<td>
							<p>
							<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" href="<%=path %>/index/edit?id=${item1.id}">编辑</a>&nbsp;
							<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'" href="javascript:deleteIndex('${item1.id }','${item1.plan_indexs.size() }')">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
	<script type="text/javascript">
		
		$('#selectType').change(function(){
			var type=$('#selectType').val();
			window.location.href='<%=path%>/index/list?type='+type;
		})
	
		function deleteIndex(id,isDelete){
			var isDel=confirm('确定删除该指标吗？删除后将不在提供给新的规划使用','确认对话框');
			if(isDel){
				if(isDelete==0){
					
					window.location.href="<%=path%>/index/delete?id="+id;
				}else{
					alert('该指标已经在使用中，不能删除');
				}	
			}
		}
	</script>
</body>
</html>