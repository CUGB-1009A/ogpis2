<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<title>油气资源规划管理系统</title>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 158px; padding: 0px">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_top
			name=main_top src="<%=path%>/main/top"></IFRAME>
	</div>
	
<!-- 	<div data-options="region:'west',split:false" -->
<!-- 		style="width: 200px; padding: 0px;"> -->

<!-- 		<IFRAME width="100%" height="100%" frameBorder=0 id=main_left -->
<%-- 			name=main_left src="<%=path%>/main/left"></IFRAME> --%>
<!-- 	</div>   -->
	<div data-options="region:'center'">
		<IFRAME width="100%" height="100%" frameBorder=0 id=main_center
			name=main_center src="<%=path%>/main/center"></IFRAME>
	</div>
	<div data-options="region:'south',border:false"
		style="height:50px;">

		<IFRAME width="100%" height="100%" frameBorder=0 id=main_bottom
			name=main_bottom src="<%=path%>/main/bottom"></IFRAME>
	</div>
</body>
<script>

	window.onload = function(){//读取xml显示上方上方、左侧、中间菜单	
		$("#main_top").contents().find("#mainPage").click(function(){
			$("#main_center").attr("src","<%=path%>/main/center");
		});
				 $.ajax({
			         url: '<%=path%>/dataBrowse/menutree.xml',
			         dataType: 'xml',
			         async: false,
			         success: function(data){
			        	var level1Num = $(data).find("level1").length;
			        	var i = 0;
		           		$(data).find("level1").each(function(){	
						i++;
		            	var district=$(this);
		            	var name = district.attr("name");
		            	var id = district.attr("id");
		            	var imgName = district.attr("imgName");
		            	var hasTri = district.attr("hasTri");
	            		$("#main_top").contents().find("#nav").children("ul").append("<li><a class='"+id+"'>"+name+"</a></li>");
	            		$("#main_top").contents().find("#nav ."+id).click(function(){
	            			if(hasTri=="true")
	            				show1($(this).attr("class"));//针对有三级菜单的
	            			else
	            				show2($(this).attr("class"));//针对只有二级菜单的
	            		});	            	
		            });
		         }
		}) ;
	}
	
function show1(classId){//针对有三级菜单的
	$("#main_center").attr("src","<%=path%>/main/center2");	
 	document.getElementById("main_center").onload = function(){//加载完成再执行添加操作
 		$.ajax({
	         url: '<%=path%>/dataBrowse/menutree.xml',
	         dataType: 'xml',
	         async: false,
	         success: function(data){
	        	 var clickNode = $(data).find("level1[id='"+classId+"']");
	        	 var titleCN = clickNode.attr("name");
	        	 var titleEN = clickNode.attr("name");
	        	 $("#main_center").contents().find('#titleCN').html(titleCN);
	        	 $("#main_center").contents().find('#titleEN').html(titleEN);
	         }
 		});	
	}	
}

function show2(classId){//针对只有二级菜单的
	$("#main_center").attr("src","<%=path%>/main/center2");	
 	document.getElementById("main_center").onload = function(){//加载完成再执行添加操作
 		$.ajax({
	         url: '<%=path%>/dataBrowse/menutree.xml',
	         dataType: 'xml',
	         async: false,
	         success: function(data){
	        	 var clickNode = $(data).find("level1[id='"+classId+"']");
	        	 var titleCN = clickNode.attr("name");
	        	 var titleEN = clickNode.attr("name");
	        	 $("#main_center").contents().find('#titleCN').html(titleCN);
	        	 $("#main_center").contents().find('#titleEN').html(titleEN);
	        	 clickNode.find("level2").each(function(){
	        		 var url = $(this).attr("url");
	        		 var imgName =  $(this).attr("imgName");
	        		 var name =  $(this).attr("name");
	        		 $("#main_center").contents().find('#showTwo').append("<div class='modal'><a href='<%=path%>"+url+"'><img src='<%=path%>/image/"+imgName+"'><br/>"+name+"</a></div>") 
	        		 
	        	 });
	        	 
	         }
 		});	
	}
}


	
</script>

</html>