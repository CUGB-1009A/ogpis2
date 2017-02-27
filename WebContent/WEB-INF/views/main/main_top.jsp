<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>

<style>
	#backdiv{
		height: 100%;
		position:relative;
        background: url(<%=path%>/image/newimg/background.png) no-repeat  center;
        background-size:100% 100%;
        color: #fff; 
        text-align:center;
	}
	img{
		margin-top:55px;
	}
	#nav{
		background-color:rgba(0,0,0,0.2);
		height:45px;
		width:100%;
		position:absolute;
		bottom:0px
	}
	#nav ul{
		margin-top:10px;
		margin-bottom:0px;
		padding: 0px; 
		font-size: 16px; 
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
		padding: 10px 3% 10px;
		border-bottom-width:3px;
		border-bottom-style:solid;
		border-bottom-color:rgba(0,0,0,0.1); 
	} 
	#nav li.current a {
		background-color:rgba(0,0,0,0.2);
		border-bottom-color:#f19149;
	}
</style>
<div  id="backdiv" >
    <img  src="<%=path%>/image/newimg/logo.png">
    <div id="nav">
    	<ul>
    		<li class="current">
    			<a id="mainPage">首页</a>
    		</li>
    	</ul>
    </div>  
</div>
<script>

$(document).on('click', '#nav li', function() {
    $('#nav li').removeClass('current');
    $(this).addClass('current');
    
});
</script>

