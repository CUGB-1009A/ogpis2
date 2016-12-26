<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
li{
	height: 38px;
	line-height: 38px;
	border-bottom: 1px solid #dcdcdc;
	text-align: center;
	display: block;
}
.sider-nav{
   padding-left: 0px;
   margin:0px;
}
.sider-nav li a {
	display: block;
	padding: 0 15px;
	height: 100%;
	color: #434343;
	font-size: 16px;
	text-decoration: none;
	text-align: left;
	font-family:"微软雅黑",arial;
	text-overflow: ellipsis;
	overflow: hidden;
}
.sider-nav li .sider-nav-title {
	width: 112px;
	overflow: hidden;
	font-size: 13px
}
.sider-nav li .iconfont {
	float: right;
	font-size: 12px;
	color: #b9c1be
}
.sider-nav li.current {
	border-left: 3px solid #BDC0BA;
	border-bottom: none;
	height: 39px;
	background: #0e98e7
}
.sider-nav li.current a {
	padding-left: 12px;
	color: #fff
}
.sider-nav li.current .iconfont {
	color: #fff
}
.accordion .accordion-header{
  height:26px;
  font-size:medium;
}
.accordion .accordion-body{
	padding: 0px;
}
.accordion .accordion-header-selected{
	background:#3969b7
}
.panel-title{
font-size:18px;
line-height: 26px;}
.panel-header{
text-align: left;
white-space: nowrap;
text-overflow: ellipsis;}
i{
padding-right:10px;
}

</style>
<div class="easyui-accordion" style="height: 100%;" >
	<div title="历史数据查询分析" iconCls="" style="overflow:auto;" >
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

	<div title="趋势预测分析" iconCls="" style="overflow:auto;" selected="true">
		<ul class="sider-nav">
			<%-- <li >
				<span class="sider-nav-title"><a href="<%=path%>/forecast/toPredictionPage" target=main_center>上版预测</a></span>
			</li> --%>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/forecast/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-history"></i>成果管理</a></span>
			</li>
			<li>
				<span class="sider-nav-title"><a href="<%=path%>/track/DataSource" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-database"></i>数据管理</a></span>
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/model/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-server"></i>模型管理</a></span>
			</li>
		</ul>
	</div>

    <div title="规划成果管理" iconCls="" style="overflow:auto;" >
		<ul class="sider-nav">
			<li>
				<span><a href="<%=path%>/index/list?type=QG" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-file-text"></i>规划指标管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/indexData/list?type=QG&id=0" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-line-chart"></i>规划完成情况管理</a></span>
			</li>
			<li>
				<span><a href="<%=path%>/plan/list?type=All&&condition=" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>规划管理</a></span>
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

</div>
<script>
$(document).on('click', '.sider-nav li', function() {
    $('.sider-nav li').removeClass('current');
    $(this).addClass('current');
    //$('iframe').attr('src', $(this).data('src'));
});
</script>