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
		<li>
			<a>历史数据要览</a>
		</li>
		<li>
			<a>规划辅助编制</a>
		</li>
		<li>
			<a>规划展示</a>
		</li>
		<li>
			<a>规划跟踪评估</a>
		</li>
		<li>
			<a>规划管理</a>
		</li>
		<li>
			<a>系统管理</a>
		</li>
	</ul>
</div>
<script>
$(document).on('click', '#sider-nav li', function() {
	$('#sider-nav li').find("a i").remove();
    $('#sider-nav li').removeClass('current');
    $(this).addClass('current');
    $(this).find("a").prepend('<i class="fa fa-angle-right" style="float:right;padding:16px 10px 0 0;"></i>');
});
//var text="";
//$(function(){
//		$.ajax({
//        url: '../dataBrowse/menutree.xml',
//        dataType: 'xml',
//        async: false,
//        success: function(data){
//        	$(data).find("theme").each(function(){
//        		var theme=$(this);
//        		$('.easyui-accordion').accordion('add', {
//					title: theme.attr("id")+"专题",
//					content: GetContent(theme.attr("id")),
//					selected: false
//				});
//        	});
//        }
//    });
//});
//function GetContent(pid){
// 	 var content='<ul class="sider-nav">';
// 	 $.ajax({
//        url: '../dataBrowse/menutree.xml',
//        dataType: 'xml',
//        async: false,
//        success: function(data){
//           $(data).find("theme[id="+pid+"] > district").each(function(){			                
//           	var district=$(this);
//           	text='<li>';
//           	text+='<span class="sider-nav-title">';
//           	text+='<a href="" target=main_center>';
//           	text+='<i class="fa fa-angle-right" style="float:right;padding-top:13px"></i>';
//           	text+='<i class="fa fa-globe"></i>';
//           	text+=district.attr("id");
//           	text+='</a></span></li>';
//           	content+=text;
//           });
//        }
//    });
//    content+="</ul>";
//    return content;
//}
</script>