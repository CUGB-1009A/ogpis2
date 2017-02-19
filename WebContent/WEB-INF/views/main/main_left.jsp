<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<style>
#sider-nav{
	height: 100%;
	background-color:#F2F2F2 ;
	overflow: auto;
}
#sider-nav ul{
	padding: 0px;
	margin:0px;
}
#sider-nav li{
	display:block;
	text-align: center;
	width: 100%;
	height:50px;
	border-bottom:1px solid #CAC6C6;
	list-style: none;
}
#sider-nav li a{
	cursor: pointer;
	text-decoration: none; 
	line-height: 50px;
	font-family: "microsoft yahei";
	color: #959595;
}
#sider-nav li.current{
	background-color: #CAC6C6;
}
#sider-nav li.current a{
	color: #FFF;
}
</style>


<div id="sider-nav">
	<ul>

	</ul>


</div>
<script>

</script>