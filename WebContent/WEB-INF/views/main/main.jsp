<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<%
	String path1 = request.getContextPath();
%>
<title>油气资源规划管理系统</title>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 200px; padding: 0px">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_top
			name=main_top src="<%=path%>/main/top"></IFRAME>
	</div>
	<div data-options="region:'west',split:false"
		style="width: 200px; padding: 0px;">

		<IFRAME width="100%" height="100%" frameBorder=0 id=main_left
			name=main_left src="<%=path%>/main/left"></IFRAME>
	</div>
	<div data-options="region:'center'">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_center
			name=main_center src="<%=path%>/main/center"></IFRAME>
	</div>
	<!--<div data-options="region:'south',border:false"
		style="height: 32px;">

		<IFRAME width="100%" height="100%" frameBorder=0 id=main_bottom
			name=main_bottom src="<%=path%>/main/bottom"></IFRAME>
	</div>-->
</body>
<script>

	window.onload = function(){//读取xml显示上方上方、左侧、中间菜单	
				 $.ajax({
			         url: '<%=path%>/dataBrowse/menutree.xml',
			         dataType: 'xml',
			         async: false,
			         success: function(data){
			        	 var level1Num = $(data).find("level1[center='true']").length;
			        	 var i = 0;
			        	 $("#main_center").contents().find('body').append("<div class='grid'><div class='row' id='row1'></div><div class='row' id='row2'></div></div>")
			            $(data).find("level1").each(function(){	
							i++;
			            	var district=$(this);
			            	var top = district.attr("top");
			            	var left = district.attr("left");
			            	var center = district.attr("center");
			            	var name = district.attr("name");
			            	var id = district.attr("id");
			            	var imgName = district.attr("imgName");
			            	if(top=="true"){//上方nav显示
			            		$("#main_top").contents().find("#nav").children("ul").append("<li><a class='"+id+"'>"+name+"</a></li>");
			            		$("#main_top").contents().find("#nav ."+id).click(function(){
			            			showMenu($(this).attr("class"));
			            		});
			            	}
			            	if(left=="true"){
			            		$("#main_left").contents().find("#sider-nav").children("ul").append("<li><a class='"+id+"'>"+name+"</a></li>");
			            		$("#main_left").contents().find("#sider-nav ."+id).click(function(){
			            			showMenu($(this).attr("class"));
			            		});
			            	}
			            	if(center=="true"){
			            		if(i<=Math.ceil(level1Num/2))
			            			{
				            			$("#main_center").contents().find("#row1").append("<div class='modal'><a class='"+id+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				            			$("#main_center").contents().find("#row1 ."+id).click(function(){
				            				showMenu($(this).attr("class"));
				            			});
			            			}
			            		else
			            			{
				            			$("#main_center").contents().find("#row2").append("<div class='modal'><a class='"+id+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				            			$("#main_center").contents().find("#row2 ."+id).click(function(){
				            				$("#main_top").contents().find("#nav ."+id).addClass("current");
				            				showMenu($(this).attr("class"));
				            			});
			            			}
			            		
			            	}
			            });
		         }
		}) ;
	}
	
	function showMenu(classId){
		$("#main_left").contents().find("#sider-nav ul").empty();
	 	$("#main_center").attr("src","<%=path%>/main/center");
	 	var first = true;
	 	document.getElementById("main_center").onload = function(){
	 		if(first){
			 		$.ajax({
				         url: '<%=path%>/dataBrowse/menutree.xml',
				         dataType: 'xml',
				         async: false,
				         success: function(data){
				        	 var clickNode = $(data).find("level1[id='"+classId+"']");
				        	 console.log(clickNode)
				        	 var hasTri = clickNode.attr("hasTri");
				        	 $("#main_center").contents().find('body').append("<div class='grid'><div class='row' id='row1'></div><div class='row' id='row2'></div></div>")
				        	 if(hasTri=="false"){
				        		 var level2Num = clickNode.find("level2").length;
				        		 var i2 = 0;
				        		 clickNode.find("level2").each(function(){	
				        			 	i2++;
					        	 		var url = $(this).attr("url");
					        	 		var name = $(this).attr("name");
					        	 		var imgName = $(this).attr("imgName");
					        	 		$("#main_left").contents().find("#sider-nav").children("ul").append("<li><a target=main_center href='<%=path%>"+url+"'>"+name+"</a></li>");
					        	 		if(i2<=Math.ceil(level2Num/2))
				            			{
											$("#main_center").contents().find("#row1").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				            			}
				            			else
				            			{
				            				$("#main_center").contents().find("#row2").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				            			}
					        	 	}) ; 
				        	 }
				        	 if(hasTri=="true"){
				        		 var isFirst = true;
				        		 var select = true ;
				        		 clickNode.find("level2").each(function(){
				        			 
				        			 if(isFirst){
				        				 var level3Num = $(this).find("level3").length;
				        				 var i3=0;
				        				 $(this).find("level3").each(function(){
				        					var url = $(this).attr("url");
				 		        	 		var name = $(this).attr("name");
				 		        	 		var imgName = $(this).attr("imgName");
				        					 i3++;
				        					 if(i3<=Math.ceil(level3Num/2)){
				        						 $("#main_center").contents().find("#row1").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				        					 }
				        					 else{
				        						 $("#main_center").contents().find("#row2").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				        						 }
				        					
				        				 });
				        				isFirst = false; 
				        			 }
				        	 		var name = $(this).attr("name");
				        	 		var id = $(this).attr("id");
				        	 		var url = $(this).attr("url");
				        	 		if(url==undefined)//二级菜单下有三级菜单
				        	 			{
				        	 				$("#main_left").contents().find("#sider-nav").children("ul").append("<li><a class='"+id+"'>"+name+"</a></li>");
				        	 				$("#main_left").contents().find("#sider-nav ."+id).click(function(){
				        	 					level2tolevel3($(this).attr("class"));
					            			});
				        	 			}
				        	 		else//二级菜单下没有菜单
			        	 				{
			        	 					$("#main_left").contents().find("#sider-nav").children("ul").append("<li><a target=main_center href='<%=path%>"+url+"'>"+name+"</a></li>");
			        	 				}
					        	 			
				        		 }) ; 
				        	 }
				         }
				     });
			 		first = false ;
	 		}
	     };
	 
	}
	
	function level2tolevel3(classId){
		$("#main_center").attr("src","<%=path%>/main/center");
	 	var first = true;
	 	document.getElementById("main_center").onload = function(){
		 		if(first){
					$.ajax({
				         url: '<%=path%>/dataBrowse/menutree.xml',
				         dataType: 'xml',
				         async: false,
				         success: function(data){
				        				 var clicklevel2Node = $(data).find("level2[id='"+classId+"']"); 
				        				 var level3Num =  clicklevel2Node.find("level3").length;
				        				 var i4=0
				        				 $("#main_center").contents().find('body').append("<div class='grid'><div class='row' id='row1'></div><div class='row' id='row2'></div></div>");
				        				 clicklevel2Node.find("level3").each(function(){
				        					 i4++;
				        					 var name = $(this).attr("name");
						        	 		 var id = $(this).attr("id");
						        	 		 var url = $(this).attr("url");
						        	 		var imgName = $(this).attr("imgName");
				        					 if(i4<=Math.ceil(level3Num/2)){
				        						 $("#main_center").contents().find("#row1").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				        					 }
				        					 else{
				        						 $("#main_center").contents().find("#row2").append("<div class='modal'><a target=main_center href='<%=path%>"+url+"'><img src=<%=path%>/image/"+imgName+"><br/>"+name+"</a></div>");
				        					
				        				 }
				       		  });
				         }
					});
					first = false;
		 		}
		};
	}

	
</script>

</html>