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
	<%
		String type=request.getAttribute("type").toString();
		//String flag=request.getAttribute("flag").toString();
	%>
</head>
<body >
	
	<script type="text/javascript">
		
	</script>
	<div>
		<div>
			<span>规划编辑</span>
		</div>
		<div id="detail" class="easyui-tabs" data-options="narrow:true,tabWidth:250,tabHeight:35">
			 <div title="规划概述" style="padding:20px;display:none;">   
        		<div class="easyui-panel">
					<form method="post" action="<%=path%>/plan/save" id="planFrom">	
						<input type="hidden" value="${type }" name="type" id="type">		
						<input type="hidden" value="false" name="isAdd">
						<input type="hidden" value="${plan.id }" name="id" id="planId">
						<table cellpadding="5" style="margin:0 auto;text-align:center">
							<tr>
								<td>规划名称</td>
								<td><input class="easyui-textbox" type="text" data-options="prompt:'规划名称'" id="planName" 
									name="planName" style="width: 50%;height:32px" value="${plan.planName }">
								</td>
							</tr>
							<tr>
								<td>规划代号</td>
								<td><input class="easyui-textbox" type="text" data-options="prompt:'规划代号'" id="planCode" 
									name="planCode" style="width: 50%;height:32px" value="${plan.planCode }">
								</td>
							</tr>
							<tr>
								<td>发布单位</td>
								<td><input class="easyui-textbox" type="text" data-options="prompt:'发布单位'" 
									id="releaseUnit" name="ReleaseUnit" style="width: 50%;height:32px" value="${plan.releaseUnit }">
								</td>
							</tr>
							<tr>
								<td>发布时间</td>
								<td>
									<input id="releaseDate" class="easyui-datebox" name="releaseDate" 
										data-options="formatter:myformatter,parser:myparser,prompt:'发布时间'"
										style="width: 50%;height:32px" value="${plan.releaseDate }">
								</td>
							</tr>
							<tr>
								<td>规划起始时间</td>
								<td>
									<input id="startTime" class="easyui-datebox" name="startTime" 
										data-options="formatter:myformatter,parser:myparser,prompt:'规划起始时间'"
										style="width: 50%;height:32px" value="${plan.startTime }">
								</td>
							</tr>
							<tr>
								<td>规划截止时间</td>
								<td>
									<input id="endTime" class="easyui-datebox" name="endTime" 
										data-options="formatter:myformatter,parser:myparser,prompt:'规划截止时间'"
										style="width: 50%;height:32px" value="${plan.endTime }">
								</td>
							</tr>
							<tr>
								<td>储量完成情况</td>
								<td>
									<input class="easyui-textbox" type="text" data-options="prompt:'储量完成情况...',multiline:true" id="storageDescription" 
									 name="storageDescription" style="width:60%;height:100px" value="${plan.storageDescription }">
								</td>
							</tr>
							<tr>
								<td>产量完成情况</td>
								<td>
									<input class="easyui-textbox" type="text" data-options="prompt:'产量完成情况...',multiline:true" id="outputDescription" 
									 name="outputDescription" style="width:60%;height:100px" value="${plan.outputDescription }">
								</td>
							</tr>
							<tr>
								<td>规划目标和总体情况</td>
								<td>
									<input class="easyui-textbox" type="text" data-options="prompt:'规划目标和总体情况',multiline:true" id="targetAndFinished" 
									 name="targetAndFinished" style="width:60%;height:100px" value="${plan.targetAndFinished }">
								</td>
							</tr>
							<tr>
								<td>规划概述</td>
								<td>
									<input class="easyui-textbox" type="text" data-options="prompt:'规划概述',multiline:true" id="planShortDescription" 
									 name="planShortDescription" style="width:60%;height:100px" value="${plan.planShortDescription }">
								</td>
							</tr>
							<tr>
								<td>规划背景和依据</td>
								<td>
									<div style="width:1000px;height:300px">
										<script id="container" name="planDescription" type="text/plain" >${plan.planDescription}</script>
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
		    <!-- 规划指标tab页 -->
		    <div title="规划指标" data-options="" style="padding:20px;display:none;">   
		        <div>
		        	<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#selectWindow').window('open')">指定指标项</a>
		        </div>
		        <div class="easyui-window" id="selectWindow" title="指定指标项" style="width: 598px;height: 600px;">
		        	<div>
	        			<table id="indexSelect" class="easyui-datagrid">
	        				
	        			</table>
	        			<div align="center" style="margin-top: 10px;">
		        			<button type="button" class="easyui-linkbutton" style="width: 100px;">确认</button>
	        			</div>
		        	</div>
		        </div>    
		        <div>
		        	<table id="index" class="easyui-datagrid" title="指标项">
		        		 <thead>
		        		 	<tr>
		        		 		<th field="item1" width="30%" align="center">指标项</th>
		        		 		<th field="item2" width="20%" align="center">类型</th>
		        		 		<th field="item3" width="10%" align="center">单位</th>
		        		 		<th field="item4" width="5%" align="center">目标值</th>
		        		 		<th field="item5" width="5%" align="center">是否跟踪</th>
		        		 		<th field="item6" width="30%" align="center">操作</th>
		        		 	</tr>
		        		 </thead>
		        		 <tbody>
		        		 	<c:forEach items="${plan_indexs }" var="item">
		        		 		<tr>
		        		 			<td>${item.index.indexName }</td>
		        		 			<td>${item.index.indexType }</td>
		        		 			<td>${item.index.indexUnit }</td>
		        		 			<td>${item.targetValue }</td>
		        		 			<td>
		        		 				<c:if test="${item.index.track }">跟踪</c:if>
		        		 				<c:if test="${!item.index.track }">不跟踪</c:if>
		        		 			</td>
		        		 			<td>
		        		 				<p>
		        		 					<a href="<c:url value='/plan/targetValueEdit?planId=${item.plan.id }&indexId=${item.index.id }'/>"
		        		 						style="width: 50px;" class="easyui-linkbutton">
		        		 					编辑</a>
		        		 					<a href="<c:url value='/plan/deleteIndex?planId=${item.plan.id }&indexId=${item.index.id }&&type=${type }'/>"
		        		 						style="width: 50px;" class="easyui-linkbutton">
		        		 					删除</a>
		        		 			</td>
		        		 	</c:forEach>
		        		 </tbody>		        			
		        	</table>
		        </div>
		    </div> 
		</div>
	</div>
	<script type="text/javascript">
		
		/* $("#index").datagrid({
			url:'../plan/getAllIndexs',
			columns:[[
			       {field:'indexName',title:'指标项名称',width:'20%',align:'center'},
			       {field:'indexType',title:'类型',width:'20%',align:'center'},
			       {field:'indexUnit',title:'单位',width:'5%',align:'center'},
			       {field:'targetValue',title:'目标值',width:'10%',align:'center'},
			       {
			    	   field:'track',title:'是否跟踪',width:'15%',align:'center',
			    	   formatter:function(value,row,index){
			    		   if(value){
			    			   return "跟踪"			    			   
			    		   }else{
			    			   return "不跟踪"
			    		   }			    			   
			    	   }
			       },
			       {
			    	   field:'_operate',title:'操作',width:'30%',align:'center',
			    	   formatter : function(value,row,index) {
							var btn = '<a class="editcls" onclick="" href="javascript:void(0)">编辑</a>'+
									  '<a class="deletecls" onclick="" href="javascript:void(0)">删除</a>';
							return btn;
						}
			       },
			  ]],
			  rownumbers:true,
			  fitColumns : true,
			  singleSelect : true,
			  pagination:true,
			  height:h,
			  queryParams:{
				  planId:planId,
				  type:type
			  }
		})
	});	 */
	</script>
</body>
</html>