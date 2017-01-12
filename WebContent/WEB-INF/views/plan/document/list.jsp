<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="<%=path%>/assets/upload/webuploader.js"></script>
	<title>规划指标管理</title>
</head>
<body>	
	<div class="title" style="font-size:24px; font-family:微软雅黑;margin:10px 10px 10px 10px;">
		<span>文档管理</span>
      	<a href="javascript:void(0)" onclick="uploadDocOpen()" class="easyui-linkbutton">上传文档</a> 
      	<div style="float:right;">  
               <input type="text" class="easyui-textbox" data-options="prompt:'请输入查询条件'" style="width:130px;vertical-align:middle;"></input>  
               <a href="javascript:void(0)" class="easyui-linkbutton">高级检索</a>  
        </div>     		
	</div>
	<div style="text-align:right;margin:0 10px 0 10px">
		
		<table class="easyui-datagrid" title="资料管理" id="docManage"></table>
		<div class="easyui-window" id="uploadDoc" title="文档上传">
       		<div>
       			<div id="thelist" class="uploader-list"></div>
       			<table>
       				<tbody>
       					<tr>
       						<td><span>文档类型</span></td>
       						<td><input type="text" class="easyui-textbox"></td>
       					</tr>
       				</tbody>
       			</table>
        		<button id="picker" class="easyui-linkbutton" value="选择文件">选择文件</button>
        		<button id="ctlBtn" class="easyui-linkbutton">开始上传</button>
       		</div>
		</div>
	</div>
	<script type="text/javascript">	
		$(function(){
			$('#uploadDoc').window('close');
		});
		var h = $('body').height() - $('#listTb').height() - 97;
		$("#docManage").datagrid({
			height:h,
			pagination:true,
			fitColumns : true,
			rownumbers:true,
			singleSelect : true,
			border:false,
			url : '<%=path%>/document/getData',
			columns : [ [
							{
								field : 'documentName',
								title : '文档名称',
								width : 40
							},
							{
								field : 'documentSize',
								title : '文档大小',
								width : 5 
							},
							{
								field : 'uploadDate',
								title : '上传时间',
								width : 10,
								formatter : function(value,row,index){									
 									var uploadYear=value.year+1900+'-';
									var uploadMonth=value.month+1+'-';
									var uploadDay=value.day+1;
									var uploadTime=uploadYear+uploadMonth+uploadDay;
									return uploadTime;
								}
							},
							{
								field : 'plan',
								title : '对应规划',
								width : 20,
								formatter : function(value,row,index){
									return row.plan.planName;
								}
							},
							{
								field : '_operate',
								title : '操作',
								width : 20,
								align : 'center',
								formatter : function(value,row,index) {
									var btn = '<a class="easyui-linkbutton" onclick="" href="javascript:void(0)">编辑</a>'+
											  '<a class="easyui-linkbutton" onclick="" href="javascript:void(0)">删除</a>'+
											  '<a class="easyui-linkbutton" onclick="" href="javascript:void(0)">下载</a>';
									return btn;
								}
							} ] ]
		});
		//上传文档
		var uploader;
		function  uploadDocOpen(){
			$('#uploadDoc').window('open');
			$('#thelist').empty();
			uploader=WebUploader.create({
				swf:'<%=path%>/assets/upload/Uploader.swf',
				server:'<%=path%>/plan/uploadFiles?',
				pick:"#picker"
			});
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
	</script>
</body>
</html>