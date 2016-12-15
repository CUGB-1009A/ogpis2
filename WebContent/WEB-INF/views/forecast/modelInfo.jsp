<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div style="width:50%;height:90%;float:left;">
		<div style="width:100%;height:100%;float:left">
			<div style="padding:10px">
				模型列表：<br>
				<table class="easyui-datagrid" style="width:300px;height:200px"
					data-options="url:'',fitColumns:true,singleSelect:true">   
				    <thead>   
				        <tr>   
				            <th data-options="field:'modelChoice',width:50">选择</th>   
				            <th data-options="field:'modelName',width:200">模型名称</th>   
				            <th data-options="field:'modelInfo',width:200,align:'right'">模型信息</th>   
				        </tr>
				        </thead>
				        <tbody id="modelList">  
				        <c:forEach items="${modelInfoList}" var="item" varStatus="status">
							<tr>   
					            <td>
									<input name="modelId" type="radio" value="${item.id}"<c:if test="${status.first}">checked</c:if>/>
								</td>   
					            <td>${item.modelName}</td>   
					            <td></td>   
				       		</tr>  
						</c:forEach> 
				   </tbody> 
				</table> 
			</div>
			<div style="padding:10px">
				拟合方法列表：<br>
				<table id="pemList" class="easyui-datagrid" style="width:300px;height:200px"
				  data-options="url:'',fitColumns:true,singleSelect:true">   
				    <thead>   
				        <tr>   
				            <th data-options="field:'pemNum',width:50">编号</th>   
				            <th data-options="field:'pemName',width:200">拟合方法名称</th>   
				        </tr> 
			        </thead>
			        <tbody>
				        <c:forEach items="${pemList}" var="item" varStatus="status">
							<tr>   
					            <td>${item.value}</td>   
					            <td>${item.key}</td>   
				       		</tr>  
						</c:forEach> 
				     </tbody>   
				</table> 
			</div>
		</div>
	</div>
	
	<div style="width:50%;height:90%;float:left;">
		<div style="width:100%;height:100%;float:left">
			<div style="padding:10px">
				模型相关信息：<br>
				<div class="col-sm-10">
				    <script id="container" name="modelDescription" type="text/plain" style="height:300px">${tempModel.modelDescription}</script>
					<!-- 配置文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.config.js"></script>
				    <!-- 编辑器源码文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.all.js"></script>
				    <!-- 实例化编辑器 -->
				    <script type="text/javascript">
				    var ue = UE.getEditor('container',{
				        	toolbars:[],
				        	wordCount:false,  
			                //关闭elementPath  
			                elementPathEnabled:false,
			                readonly:true
		        			 });
	    			</script>
				</div>
			</div>
		</div>
	</div>