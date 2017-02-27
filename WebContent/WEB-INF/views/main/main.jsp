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
	            				show2($(this).attr("class"));//三级菜单
	            			else
	            				show1($(this).attr("class"));//二级菜单
	            		});	            	
		            });
		         }
		}) ;
	}
	
function show1(classId){
	$("#main_center").attr("src","<%=path%>/main/center1");	
 	document.getElementById("main_center").onload = function(){//加载完成再执行添加操作
 		$.ajax({
	         url: '<%=path%>/dataBrowse/menutree.xml',
	         dataType: 'xml',
	         async: false,
	         success: function(data){
	        	 var clickNode = $(data).find("level1[id='"+classId+"']");
	        	 var titleCN = clickNode.attr("name");
	        	 var titleEN = clickNode.attr("nameEN");
	        	 $("#main_center").contents().find('#titleCN').html(titleCN);
	        	 $("#main_center").contents().find('#titleEN').html(titleEN);
	        	 clickNode.find("level2").each(function(){
	        		 var url = $(this).attr("url");
	        		 var imgName =  $(this).attr("imgName");
	        		 var name =  $(this).attr("name"); 	
	        		 var description = "通过对历史数据的分析，预测未来几年可能发生的情况。将上面的预测结果管理起来在预测过程中用到的一些具体的数学方法展示规划的总体信息";
	        		 $("#main_center").contents().find('#showTwo').append("<div class='grid'><div class='row'><a href='<%=path%>"+url+"'><div class='modal'>"
								+"<img src='<%=path%>/image/"+imgName+"'/></div><div class='modal1'><span class='titi'>"+name+"</span><br/><span class='coco'>"+description+"</span></div></a></div><br /></div>") 
	        		 
	        	 });	 
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
	        	 var titleEN = clickNode.attr("nameEN");
	        	 $("#main_center").contents().find('#titleCN').html(titleCN);
	        	 $("#main_center").contents().find('#titleEN').html(titleEN);
	        	 var i=0;
	        	 clickNode.find("level2").each(function(){
	        		 var name =  $(this).attr("name"); 
	        		 var id = $(this).attr("id");
	        		if(i==0){
	        	 		$("#main_center").contents().find('#leftdiv').find("ul").append("<li class='current'><a href='#' class='two' id="+id+"><span>"+name+"</span></a></li>"); 
	        	 		showTh(id);
	        	 	}
	        		else
	        			 $("#main_center").contents().find('#leftdiv').find("ul").append("<li><a href='#' class='two' id="+id+"><span>"+name+"</span></a></li>"); 
	        	 	i++;
	        	 });
	         }
 		});	
 		$("#main_center").contents().find('#leftdiv').find(".two").click(function(){
 			showTh($(this).attr("id"));
 		});
	}
}

function showTh(id){
	
	$.ajax({
        url: '<%=path%>/dataBrowse/menutree.xml',
        dataType: 'xml',
        async: false,
        success: function(data){
       	 var clickNode = $(data).find("level2[id='"+id+"']");	
       	 $("#main_center").contents().find('#rightdiv').empty();
       	 clickNode.find("level3").each(function(){
       		
       		 var url = $(this).attr("url");
    		 var imgName =  $(this).attr("imgName");
    		 var name =  $(this).attr("name"); 
    		 var description = "通过对历史数据的分析，预测未来几年可能发生的情况。将上面的预测结果管理起来在预测过程中用到的一些具体的数学方法展示规划的总体信息";
    		 $("#main_center").contents().find('#rightdiv').append("<div class='grid'><div class='row'><a href='<%=path%>"+url+"'><div class='modal'>"
						+"<img src='<%=path%>/image/"+imgName+"'/></div><div class='modal1'><span class='titi'>"+name+"</span><br/><span class='coco'>"+description+"</span></div></a></div><br /></div>") 
 		 
       	 });
        }
	});	
	
}

	
</script>

</html>