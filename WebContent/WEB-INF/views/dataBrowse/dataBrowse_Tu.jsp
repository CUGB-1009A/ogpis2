<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../init.jsp"%>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

			<title>Insert title here</title>

			<style type="text/css">
				tr{
				height:30px;
				}
				td{
				width:200px;
				}
				label{
				padding:0 5px;
				margin-top:3px;
				width:50px;
				line-height:14px;
				font-size:14px
				}
				select{
				margin:3px 2% 0 5px;
				width:100px;
				
				}
				.easyui-tabs .tabs-title{
				font-size:14px
				}
			</style>

		</head>

		<body>
			<!--<div id="tt" class="easyui-tabs" style="width:100%;height:30%;">

			</div>  -->
			
			<div data-options="region:'north'" style="height:110px">
				<div id="browsett" class="easyui-tabs" data-options="fit:true">
				</div>
			</div>
		</body>
		<script type="text/javascript">
			//var first = true ;
			//var id = '${id}';//level3的id
			//var ids = new Array();//tab页的id组
			//var dataSourceArray = new Array();//tab页的数据源组
			//$(function(){
			//	$.ajax({
			//	    url: '<%=path%>/dataBrowse/menutree.xml',
			//	    dataType: 'xml',
			//	    async: false,
			//	    success: function(data){
			// 				 	var level3 = $(data).find("level3[id='"+id+"']");
			// 				 	var i = 0 ;
			// 					level3.find("tab").each(function(){
			// 						ids[i] = $(this).attr("dataSource");
			// 						dataSourceArray[i] = $(this).attr("dataSource");
			// 						i++;
			//		   				$('#tt').tabs('add',{    
			//		   				    title:$(this).text(),
			//			   				closable:false
			//	   					});
			// 					});
			//	   	}
			//	});
			//	
			//	$('#tt').tabs({
			//		onSelect:function(title,index){
			//			if(!first){
			//						
			//					}
			//			first = false ;	
			//			var dataSourceId = dataSourceArray[index];
			//			$.ajax({
			//			    url: '<%=path%>/getTabDimension',
			//			    data:{"id":dataSourceId},
			//			    dataType: 'json',
			//			    async: false,
			//			    success: function(data){//将维度信息添加到tab页上
			//			    	var content ;
			//			    	for(var i=0;i<data.length;i++){
			//			    		var dimension = data[i];
			//			    	}
			//					
			//			    	var tab = $('#tt').tabs('getSelected');  
			//			    	$('#tt').tabs('update', {
			//			    		tab: tab,
			//			    		options: {
			//			    			content: content 
			//			    		}
			//			    	});
			//
			//		   				 	
			//			   	}
			//			})
			//		}
			//	
			//	});
			//});
			//
			//function getDivContent(dataSoruce){
			//	
			//}
			//function getTabIndex(){
			//	var tab = $('#tt').tabs('getSelected');
			//	var index = $('#tt').tabs('getTabIndex',tab);
			//	return index ;
			//}
			
			$(function(){
				$.ajax({
				    url: '<%=path%>/dataBrowse/menutree.xml',
				    dataType: 'xml',
				    async: false,
				    success: function(data){
			   				 	var level3 = $(data).find("level3[id='zyl_gndq']");
			   					level3.find("tab").each(function(){
			   						
					   				$('#browsett').tabs('add',{    
					   				    title:$(this).text(),
						   				closable:false,
						   				content:getContent
				   					});
			   					});
				   	}
				});
			});
			var j;
			function getContent(){
				var content="";
				$.ajax({
					url:"<%=path%>/dataBrowse/new.json",
					dataType:"json",
					async:false,
					success:function(data){
						var temp=eval(data);
						$.each(data.condition,function(i,item){
							content+="<label>"+item.name+"</label>";
							content+="<select id="+item.name_key+">";
							for (j=0;j<item.value.length;j++){
								content+="<option value="+item.value[j]+">"+item.value[j]+"</option>";
							}
							content+="</select>";
						});
					}
					
				});
				return content;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
			}
		</script>

		</html>