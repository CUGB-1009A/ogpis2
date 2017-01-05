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
	<title>规划管理</title>
	<%-- <%
		String type=request.getAttribute("type").toString();
		String flag=request.getAttribute("flag").toString();
	%> --%>
</head>
<body >
	<div>
		<div>
			<span>规划编辑</span>
		</div>
		<div id="detail" class="easyui-tabs">
			 <div title="规划概述" style="padding:20px;display:none;">   
        		<div class="easyui-panel">
					<form method="post" action="<%=path%>/plan/save" id="planFrom">	
						<input type="hidden" value="${type }" name="type">		
						<input type="hidden" value="false" name="isAdd">
						<input type="hidden" value="${plan.id }" name="id">
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
										style="width: 50%;height:32px" value="startTime">
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
   			 <!-- 文档资料tab页 -->  
		    <div title="文档资料" style="overflow:auto;padding:20px;display:none;">
		        	<div style="float:right;margin-right:30px">
		        		<a href="javascript:void(0)" onclick="uploadDocOpen()" class="easyui-linkbutton">上传文档</a>
		        		<a class="easyui-linkbutton" href="javascript:delChonseDoc();">批量删除</a>
		        	</div>
		        	<div class="easyui-window" id="uploadDoc" title="文档上传" 
		        		style="width:200px;height:100px">
		        		<div>
		        			<div id="thelist" class="uploader-list"></div>
			        		<button id="picker">选择文件</button>
			        		<button id="ctlBtn" class="easyui-linkbutton">开始上传</button>
		        		</div>
		        	</div>
		        	<div style="margin-top:35px">		        	
		        		<table id="docTable" class="easyui-datagrid" title="next" 
		        			data-options="singleSelect:true,collapsible:true,fitColumns:true,pagination:true">
		        			<thead>
		        				<tr>
		        					<th field='itemid' width="5%"><input type="checkbox" name="checkboxFirst"/>全选</th>
		        					<th field='itemid1' width="30%">文档名称</th>
		        					<th field='itemid2' width="20%">文档大小</th>
		        					<th field='itemid3' width="20%">上传时间</th>
		        					<th field='itemid4' width="25%">操作</th>
		        				</tr>
		        			</thead>
		        			<tbody>
		        				<tr>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        				</tr>
		        			</tbody>
		        		</table>
		        	</div> 
		    </div>   
		    <!-- 规划指标tab页 -->
		    <div title="规划指标" data-options="" style="padding:20px;display:none;">   
		        <div>
		        	<a href="javascript:void(0)" onclick="$('#selectWindow').window('open')">指定指标项</a>
		        </div>
		        <div class="easyui-window" id="selectWindow" title="指定指标项">
		        	<div>
		        		<form action="<%=request.getContextPath()%>/plan/admin/selectIndex" method="post">
		        			<%-- <input type="hidden" name="planId" value="${plan.id }">
		        			<input type="hidden" name="type" value="${type }"> --%>
		        			<table id="indexSelect">
		        				<thead>
		        					<tr>
		        						<th><input type="checkbox"></th>
		        						<th>指标项名称</th>
		        						<th>类型</th>
		        						<th>单位</th>
		        					</tr>
		        				</thead>
		        				<tbody>
		        					<td>wwwwwwww</td>
		        					<td>wwwwwwww</td>
		        					<td>wwwwwwww</td>
		        					<td>wwwwwwww</td>
		        				</tbody>
		        			</table>
		        			<button type="submit" class="easyui-linkbutton">确认</button>
		        		</form>
		        	</div>
		        </div>    
		        <div>
		        	<table id="index" class="easyui-datagrid" title="指标项" data-options="singleSelect:true,collapsible:true">
		        		<thead>
		        				<tr>		        					
		        					<th field='itemid' width="30%">指标项</th>
		        					<th field='itemid1' width="5%">类型</th>
		        					<th field='itemid2' width="10%">单位</th>
		        					<th field='itemid3' width="10%">目标值</th>
		        					<th field='itemid4' width="15%">是否跟踪</th>
		        					<th field='itemid5' width="30%">操作</th>
		        				</tr>
		        			</thead>
		        			<tbody>
		        				<tr>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        					<td>w</td>
		        				</tr>
		        			</tbody>
		        	</table>
		        </div>
		    </div> 
		</div>
	</div>	
	<script type="text/javascript">
		var uploader;
		var flag=${flag};
		var id="${plan.id}";
		var type="${type}";
	
		$(function(){
			$('#selectWindow').window('close');
		});
		$(function(){
			$('#uploadDoc').window('close');
		});
		
		function  uploadDocOpen(){
			$('#uploadDoc').window('open');
			$('#thelist').empty();
			uploader=WebUploader.create({
				swf:'<%=path%>/assets/upload/Uploader.swf',
				server:'<%=path%>/plan/uploadFiles?type=${type}&time=1&planId=${plan.id}',
				pick:"#picker"
			});
			console.log('<%=path%>/plan/uploadFiles?type=${type}&time=1&planId=${plan.id}');
			var total=0;
			var success=0;
			var f=1;
			var hasFile=0;
			var fileId="";
			
			//webuploader注册监听事件，添加文件前先重置uploader
			uploader.on('beforeFileQueued',function(file){
				if(f==1){
					totle=0;
					uploader.reset();
					$("#thelist").empty();
					f=0;
				}
			});
			//文件加入队列之后触发
			uploader.on('fileQueued',function(file){
				fileId=fileId+file.id;
				total=total+1;
				$("#thelist").append('<div class="item">'+
						'<h4 class="info">'+file.name+'</h4><div id="'+file.id+'1">');
			});
			//一批文件添加进队列以后触发   
			uploader.on('filesQueued',function(files){
				hasFile=1;
				f=1;
			});
			
			uploader.on('uploaderComplete',function(file){
				if(total==success){
					$('#uploadDoc').window('close');
				}
			});
			
			uploader.on('uploadProgress',function(file,percentage){
				$('#'+file.id+'1').css('width',percentage*100+''+'%');
				//$('#'+file.id)[0].innerHTML=percentage*100;
			});
			
			$("#ctlBtn").on("click",function(){
				if(hasFile==0)
					alert('请选择文件再上传');
				else{
					uploader.upload();
				}
			})
		}
		
		/* $(function(){
			$("#uploadDoc").onClose(function(){
				$("#ctlBtn").off("click");
				uploader.destory();
			})
		}); */
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