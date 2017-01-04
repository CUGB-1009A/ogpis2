<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>完成情况管理</title>
</head>
<body >
	<div>
		<div style="margin:10px 10px 10px 10px;">
			<span style="font-size:24px;font-family:微软雅黑">规划管理</span>
			<div style="float:right">
				<form action="<%=path%>/plan/list">
					<input type="hidden" value="${type }" name="type">
					<input type="text"  class="easyui-textbox" id="inputFuzzyQuery" data-options="prompt:'模糊查询条件'" name="condition" value="${condition }">
					<button type="submit" class="easyui-linkbutton">查询</button>&nbsp;&nbsp;&nbsp;
					<a href="<%=path %>/plan/toEditPage"  class="easyui-linkbutton" 
						data-options="size:'middle'"><i class="fa fa-plus" style="margin-right:3px"></i>
						添加规划
					</a>
					<a href="<%=path %>/plan/toEditPage"  class="easyui-linkbutton" 
						data-options="size:'middle'"><i class="fa fa-plus" style="margin-right:3px"></i>
						删除规划
					</a>
				</form>			
			</div>
		</div>
		<div style="margin:20px 10px 10px 10px;text-align:center">
			<table class="easyui-datagrid table" title="规划管理" cellpadding="5" style="margin:0 auto;text-align:center">
				<thead>
					<tr>
						<th field="全选" width="5%" class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxFirst"/>全选</th>
						<th field="规划名称" width="20%">规划名称</th>
						<th field="规划类型" width="20%">规划类型</th>
						<th field="信息" width="30%">信息</th>
						<th field="操作" width="25%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mapList }" var="item1" varStatus="status">
						<tr class="tr_${item1.get('plan').id }"> 
							<td class="check_all">
								<c:if test="${!item1.get('plan').released }">
									<input type="checkbox" class="checkboxes" name="checkbox" value="${item1.get('plan').id }"/>
								</c:if>
							</td>
							<td>${item1.get('plan').planName }</td>
							<td>
								<c:forEach items="${planType }" var="item">
									<c:if test="${item1.get('plan').planType.equals(item.key) }">${item }</c:if>
								</c:forEach>							
							</td>
							<td>
								文档 ${item1.get('plan').planDocument.size() }&nbsp;&nbsp;
								指标个数 ${item1.get('plan').indexs.size() }
								收藏
								<span class="concernNum_${item1.get('plan').id }">${item1.get('plan').users.size() }</span>
							</td>
							<td>
								<p>
									<a href="<c:url value='/plan/show?flag=1&&type=${type }&&id=${item1.get("plan").id }'/>"
										class="editPlan_${item1.get('plan').id } easyui-linkbutton">
										编辑
									</a>
									<c:if test="${item1.get('plan').released }">
										<a href="javascript:releasePlan('${item1.get('plan').id }')" class="release_${item1.get('plan').id } easyui-linkbutton" style="display:none">
											发布
										</a>
										<a href="javascript:disreleasePlan('${item1.get('plan').id }')" class="disrelease_${item1.get('plan').id } easyui-linkbutton">
											取消发布
										</a>
										<a href="javascript:deletePlan('${item1.get('plan').id }')" class="deletePlan_${item1.get('plan').id } easyui-linkbutton" style="display:none">
											删除
										</a>
									</c:if>
									<c:if test="${!item1.get('plan').released }">
										<a href="javascript:releasePlan('${item1.get('plan').id }')" class="release_${item1.get('plan').id } easyui-linkbutton">
											发布
										</a>
										<a href="javascript:disreleasePlan('${item1.get('plan').id }')" class="disrelease_${item1.get('plan').id } easyui-linkbutton" style="display:none">
											取消发布
										</a>
										<a href="javascript:deletePlan('${item1.get('plan').id }')" class="deletePlan_${item1.get('plan').id } easyui-linkbutton">
											删除
										</a>
									</c:if>
									<a href="<%=path%>/plan/preview?id=${item1.get('plan').id}" class="editPlan_${item1.get('plan').id } easyui-linkbutton">
										预览
									</a>
								</p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		${mapList }<br>
	</div>	
	<script type="text/javascript">
		var tempType="${type}";
		function deletePlan(id){		
			var getTimestamp=new Date().getTime();
			var isDel=confirm('确认删除该规划吗？','确认对话框');
			if(isDel){
				$.ajax({
					url:"<%=request.getContextPath()%>/plan/deletePlan?time="+getTimestamp,
					dataType:"json",
					async:true,
					data:{"planId":id},
					type:"GET",
					success:function(result){
						$(".tr_"+id).remove();
						alert('删除规划成功');
					},
					error:function(){
						alert('删除失败');
					}
				});
			}
		}
		function releasePlan(id){		
			var getTimestamp=new Date().getTime();
				$.ajax({
					url:"<%=request.getContextPath()%>/plan/release?time="+getTimestamp,
					dataType:"json",
					async:true,
					data:{"planId":id},
					type:"GET",
					success:function(result){
						//发布按钮取消、显示取消发布按钮、删除按钮取消
						$("input[value="+id+"]").remove();
						$(".release_"+id).get(0).style.display="none";
						$(".disrelease_"+id).get(0).style.display="";
						$(".deletePlan_"+id).get(0).style.display="none";
						alert('发布成功');
					},
					error:function(){
						alert('发布失败');
					}
				});
		}
		function disreleasePlan(id){		
			var getTimestamp=new Date().getTime();
				$.ajax({
					url:"<%=request.getContextPath()%>/plan/disrelease?time="+getTimestamp,
					dataType:"json",
					async:true,
					data:{"planId":id},
					type:"GET",
					success:function(result){
						//发布按钮取消、显示取消发布按钮、删除按钮取消 
						$(".tr_"+id).find("td:first").append("<input type='checkbox' class='checkboxes' name='checkbox' value='"+id+"'/>");
						console.log($(".tr_"+id).find("td:first").append("<input type='checkbox' class='checkboxes' name='checkbox' value='"+id+"'/>"));
						$(".release_"+id).get(0).style.display="";
						$(".disrelease_"+id).get(0).style.display="none";
						$(".deletePlan_"+id).get(0).style.display="";
						alert('撤销发布成功');
					},
					error:function(){
						alert('撤销发布失败');
					}
				});
		}
	</script>
</body>
</html>