<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div style="width:50%;height:90%;float:left;">
		<div style="width:100%;height:100%;float:left">
			<div style="padding:10px">
				模型列表：<br>
				<table class="easyui-datagrid" style="width:300px;height:200px"   
				        data-options="url:'datagrid_data.json',fitColumns:true,singleSelect:true">   
				    <thead>   
				        <tr>   
				            <th data-options="field:'code',width:100">选择</th>   
				            <th data-options="field:'name',width:100">模型名称</th>   
				            <th data-options="field:'price',width:100,align:'right'">模型信息</th>   
				        </tr>  
				        <c:forEach items="${modelInfoList}" var="item">
							<tr>   
					            <th data-options="field:'code',width:100">${item.id}</th>   
					            <th data-options="field:'name',width:100">${item.modelName}</th>   
					            <th data-options="field:'price',width:100,align:'right'"></th>   
				       		</tr>  
						</c:forEach> 
				    </thead>   
				</table> 
			</div>
			<div style="padding:10px">
				拟合方法列表：<br>
				<table class="easyui-datagrid" style="width:300px;height:200px"   
				        data-options="url:'datagrid_data.json',fitColumns:true,singleSelect:true">   
				    <thead>   
				        <tr>   
				            <th data-options="field:'code',width:100">选择</th>   
				            <th data-options="field:'name',width:100">拟合方法名称</th>   
				            <th data-options="field:'price',width:100,align:'right'">拟合方法信息</th>   
				        </tr>  
				        <c:forEach items="${pemList}" var="item">
							<tr>   
					            <th data-options="field:'code',width:100">${item.value}</th>   
					            <th data-options="field:'name',width:100">${item.key}</th>   
					            <th data-options="field:'price',width:100,align:'right'"></th>   
				       		</tr>  
						</c:forEach> 
				    </thead>   
				</table> 
			</div>
		</div>
	</div>
	
	<div style="width:50%;height:90%;float:left;">
		<div style="width:100%;height:100%;float:left">
			<div style="padding:10px">
				模型相关信息：<br>
				<div class="col-sm-10">
					<%-- <script id="container" name="modelDescription" type="text/plain" style="height:300px"></script>
										 <!-- 配置文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.config.js"></script>
				    <!-- 编辑器源码文件 -->
				    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.all.js"></script>
				    <!-- 实例化编辑器 -->
				    <script type="text/javascript">
				        var ue = UE.getEditor('container');
				    </script>  --%>
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