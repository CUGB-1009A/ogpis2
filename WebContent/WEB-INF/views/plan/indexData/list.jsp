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
<body>
	<div>
		<div>
			<span>完成情况管理</span>
		</div>
		<div>
			<span>指标类型：</span>
			<select id="selectType" name="planType">
				<option value="QG" <c:if test="${type.equals('QG')}">selected</c:if>>全国</option>
				<option value="ZSY" <c:if test="${type.equals('ZSY')}">selected</c:if>>中石油</option>
				<option value="ZSH" <c:if test="${type.equals('ZSH')}">selected</c:if>>中石化</option>
				<option value="ZHY" <c:if test="${type.equals('ZHY')}">selected</c:if>>中海油</option>
				<option value="YC" <c:if test="${type.equals('YC')}">selected</c:if>>延长石油</option>
				<option value="ZLM" <c:if test="${type.equals('ZLM')}">selected</c:if>>中联煤</option>
				<option value="QT" <c:if test="${type.equals('QT')}">selected</c:if>>其他</option>
			</select>
			&nbsp;&nbsp;
			<span>指标项名称：</span>
			<select id="selectIndex" name="selectCondition">
				<c:if test="${id.equals('0') }"><option value='0' selected>没有指标项</option></c:if>
				<c:forEach items="${indexList }" var="item" varStatus="status">
					<option value="${item.id }"<c:if test="${item.id==id }">selected</c:if>>${item.indexName }</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;
			<c:if test="${!id.equals('0') }">
				<a class="easyui-linkbutton" data-options="size:'large'" href="javascript:void(0)" onclick="$('#add').window('open')">
					<i>录入信息</i>
				</a>				
			</c:if>
		</div>
		
		<div>
			<div style="text-align:right;margin:0 10px 0 10px">
				<table id="indexDataGrid" class="easyui-datagrid" title="完成情况" data-options="striped:true,singleSelect:true">
					<thead>
						<tr>
							<th field='indexYear'>年度</th>
							<th field="finished">完成量</th>
							<th field="operate">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${indexDataList }" var="item1" varStatus="status">
							<tr class="tr_${item1.id }">
								<td>
									<fmt:formatDate value="${item1.collectedTime }" pattern="YYYY"/>
								</td>
								<%-- <td><input value="${item1.collectedTime }"></td> --%>
								<td><input id="input_${item1.id }" class="input_${item1.id }" type="text" value="${item1.finishedWorkload }" lastValue="${item1.finishedWorkload }" disabled="true"></td>
								<td>
									<p>
										<a href="javascript:saveEditIndexData('${item1.id }')" id="ok_${item1.id }" style="display:none" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">
											<i>ok</i>
										</a>&nbsp;
										<a href="javascript:cancleIndexData('${item1.id }')" id="cancle_${item1.id }" style="display:none" class="easyui-linkbutton" data-options="iconCls:'icon-no'">
											<i>cancle</i>
										</a>&nbsp;
										<a href="javascript:editIndexData('${item1.id }')" id="edit_${item1.id }" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">
											编辑
										</a>&nbsp;
										<a href="javascript:deleteIndexData('${item1.id }');" id="delete_${item1.id }" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">
											删除
										</a>&nbsp;
									</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>		
	</div>
	
	<div id="add" class="easyui-window" title="完成情况录入" >
		<form onsubmit="return check()">
			<table>
				<tr>
					<td>年份</td>
					<td>
						<input id="collectedTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser">
					</td>
				</tr>
				<tr>
					<td>完成量</td>
					<td>
						<input class="easyui-textbox" type="text" id="finishedWorkload" data-options="prompt:'完成量'"  name="finishedWorkload">
					</td>
				</tr>
			</table>
			<div style="margin-top:10px;margin-left:90px">
				<button data-options="iconCls:'icon-add',size:'middle'" class="easyui-linkbutton" type="button" onclick="addIndexData('${id}')">录入</button>			
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#add').window('close');
		});
	
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
		
		
		$('#selectIndex').change(function(){
			var id=$('#selectIndex').val();
			window.location.href="<%=path%>/indexData/list?type=${type}&&id="+id;
		});
		$('#selectType').change(function(){
			var type=$('#selectType').val();
			window.location.href="<%=path%>/indexData/list?id=0&&type="+type;
		});
		
		//编辑按钮
		function editIndexData(id){
			$('.input_'+id).attr("disabled",false);
			$('.input_'+id).focus();
			document.getElementById('ok_'+id).style.display=" ";
			document.getElementById('cancle_'+id).style.display=" ";
			document.getElementById('edit_'+id).style.display="none";
			document.getElementById('delete_'+id).style.display="none";
		}
		//取消按钮
		function cancleIndexData(id){
			var lastValue=$('.input_'+id).attr("lastValue");
			$('#input_'+id).val(lastValue);
			document.getElementById('ok_'+id).style.display="none";
			document.getElementById('cancle_'+id).style.display="none";
			document.getElementById('edit_'+id).style.display="";
			document.getElementById('delete_'+id).style.display="";
			$('.input_'+id).attr("disabled",true);
		}
		//确定编辑按钮
		function saveEditIndexData(id){
			var value=$('#input_'+id).val();
			$.ajax({
				url:"<%=path%>/indexData/save",
				type:"get",
				async:true,
				data:{"id":id,"value":value},
				dataType:"json",
				contentType:"application/json",
				success:function(){
					$('.input_'+id).attr("lastValue",value);
					document.getElementById('ok_'+id).style.display="none";
					document.getElementById('cancle_'+id).style.display="none";
					document.getElementById('edit_'+id).style.display="";
					document.getElementById('delete_'+id).style.display="";
					$('.input_'+id).attr("disabled",true);
					alert('修改成功');
				},
				error:function(){
					alert('修改失败');
				}
			});
		}
		//删除按钮
		function deleteIndexData(id){
			var type=$('#selectType').val();
			var index=$('#selectIndex').val();
			var isDel=confirm("确定删除该条记录？","确认对话框");
			if(isDel){
				$.ajax({
					url:"<%=path%>/indexData/delete",
					type:"get",
					async:true,
					data:{"id":id},
					dataType:"json",
					contentType:"application/json",
					success:function(){
						window.location.href="<%=path%>/indexData/list?id="+index+"&&type="+type;
						alert('删除成功');
					},
					error:function(){
						alert('删除失败');
					}
				});
			}
		}
		
		//为id=id的指标添加完成情况
		function addIndexData(id){
			var collectedTime=$("#collectedTime").datebox('getValue');
			var finishedWorkload=$("#finishedWorkload").val();
			console.log(collectedTime+finishedWorkload);
			if(finishedWorkload==''||collectedTime==''){
				alert('请填写完整信息再提交');
				return false;
			}
			$.ajax({
				url:"<%=path%>/indexData/addIndexData",
				type:"get",
				async:true,
				data:{
					"id":id,
					"collectedTime":collectedTime,
					"finishedWorkload":finishedWorkload
				},
				contentType:"application/json",
				success:function(result){
					if(result.result=='success')
						window.location.href="<%=path%>/indexData/list?id=${id}&&type=${type}";
						else
							alert('该年份的记录已经存在，不能再次添加');
				},error:function(){
					alert('添加失败');
				}
			});
		}
	</script>
</body>
</html>