<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>

<style>
	#backdiv{
		overflow: hidden; 
		height: 100%;
		position:relative;
        background: url(<%=path %>/image/banner.png) #0050A3 no-repeat  center;
        background-size:100% 100%;
        color: #fff; 
        font-family:"楷体";
	}
	img{
		max-height:100px;
		max-width:100px;
		position:absolute;
		left:15%;
		top:15px
	}
	#topic1{
		font-size:45px;
		font-weight:bold;
		padding-top:35px;
		display:block;
		position:absolute;
		left:20.5%;
	}
	#topic2{
		font-size:15px;
		font-family:"lucida console",Arial;
		padding-top:92px;
		display:block;
		position:absolute;
		left:21%;
	}
	#nav{
		background-color:#0066CC;
		height:50px;
		width:100%;
		position:absolute;
		bottom:0px
	}
	#nav ul{
		margin: 0 0 0 13%; 
		padding: 0px; 
		font-size: 16px; 
		color: #FFF; 
		line-height: 50px; 
		white-space: nowrap; 
	}
	#nav li{
		list-style-type: none; 
		display: inline; 			
	}
	#nav li a {
		cursor: pointer;
		text-decoration: none; 
		font-family: "Microsoft YaHei",Arial, Helvetica, sans-serif; 
		font-weight: bold;
		padding: 15px 33px; 
		margin:0 15px;
		color: #FFF; 
	} 

	#nav li.current a {
		background-color: #27577F;
	}
</style>
<div  id="backdiv" >
    <img  src="<%=path%>/image/logo2.png">
    <span id="topic1"> 油气资源规划信息管理系统</span>
    <span id="topic2"> Oil and Gas Resources Planning Information Management System</span>
    <div id="nav">
    	<ul>
    		<li class="current">
    			<a href="javascript:loadAgain()">首页</a>
    		</li>
    	</ul>
    </div>
</div>
<script>
function loadAgain(){
	alert(1)
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
	            				showMenu($(this).attr("class"));
	            			});
            			}
            		
            	}
            });
     }
}) ;
}

$(document).on('click', '#nav li', function() {
    $('#nav li').removeClass('current');
    $(this).addClass('current');
    
});
</script>

