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
	<div title="历史数据查询分析"  style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
					
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-history"></i>资源量专题</a></span>	
						
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-stack-overflow"></i>储量专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-search"></i>产量专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-wrench"></i>勘探专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-credit-card"></i>油气贸易专题</a></span>
				
			</li>
		</ul>
	</div>
	<div title="趋势预测分析"   style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-globe"></i>资源量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-stack-overflow"></i>储量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-line-chart"></i>产量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-bar-chart"></i>勘探预测</a></span>
				
			</li>
		</ul>
	</div>
    <div title="规划成果管理" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-edit"></i>资料规划录入</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-area-chart"></i>规划查询统计</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-list-alt"></i>规划展示</a></span>
				
			</li>
		</ul>
	</div>
	<div title="规划实施跟踪评估" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center><i class="fa fa-angle-right" style="float:right;padding-top:13px"></i><i class="fa fa-pie-chart"></i>规划实施跟踪评估</a></span>				
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