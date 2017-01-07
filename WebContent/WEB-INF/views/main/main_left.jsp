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

<%-- <div class="easyui-accordion" style="height: 100%;" >
	<div title="历史数据要览" iconCls="" style="overflow:auto;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/dataBrowse" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-globe"></i>资源量专题</a></span>
			</li>
			<li >
				<span class="sider-nav-title"><a href="" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-stack-overflow"></i>储量专题</a></span>
			</li>
			<li >
				<span class="sider-nav-title"><a href="" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-search"></i>产量专题</a></span>
			</li>
			<li >
				<span class="sider-nav-title"><a href="" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-wrench"></i>勘探专题</a></span>
			</li>
			<li >
				<span class="sider-nav-title"><a href="" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-credit-card"></i>油气贸易专题</a></span>
			</li>
		</ul>
	</div>

	<div title="规划辅助编制" iconCls="" style="overflow:auto"selected="true">
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/forecast/toPredictionPage" target=main_center>上版预测</a></span>
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/forecast/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-line-chart"></i>趋势预测</a></span>

			</li>


			<li>
				<span class="sider-nav-title"><a href="<%=path%>/forecast/finishedList" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>预测管理</a></span>
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/model/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-server"></i>模型管理</a></span>
			</li>
		</ul>
	</div>

    <div title="规划管理" iconCls="" style="overflow:auto;" >
		<ul class="sider-nav">
			<li>
				<span><a href="<%=path%>/index/list?type=GZL" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-file-text"></i>规划指标管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/indexData/list?type=GZL&id=0" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-line-chart"></i>规划完成情况管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/plan/list?type=All&&condition=" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>规划管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/document/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>资料管理</a></span>
			</li>
		</ul>
	</div>
    <div title="规划展示" iconCls="" style="overflow:auto;" >
		<ul class="sider-nav">
			<li>
				<span><a href="<%=path%>/plan/userList" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-file-text"></i>规划概览</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/indexData/list?type=GZL&id=0" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-line-chart"></i>规划指标</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/document/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>规划资料</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/plan/list?type=All&&condition=" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>实施情况</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/plan/list?type=All&&condition=" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>收藏管理</a></span>
			</li>
		</ul>
	</div>

	<div title="规划实施跟踪评估" iconCls="" style="overflow:auto;" >
		<ul class="sider-nav">
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/track/indexTrackContents" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-pie-chart"></i>指标跟踪</a></span>				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/track/targetTrackContents" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-pie-chart"></i>规模跟踪</a></span>				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/track/layoutTrackContents" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-pie-chart"></i>布局跟踪</a></span>				

			</li>
		</ul>
	</div>

	
	<div title="数据管理" iconCls="" style="overflow:auto;">
		<ul class="sider-nav">
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/baseinfo/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>基础信息维护</a></span>				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/dataSource/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>数据源维护</a></span>				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/data/dataMaintain" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>数据维护</a></span>				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/dataCache/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>缓存维护</a></span>				
			</li>
		</ul>
	</div> --%>


<div id="sider-nav">
	<ul>
<!-- 		<li>
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
		</li> -->
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