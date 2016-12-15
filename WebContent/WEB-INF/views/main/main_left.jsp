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
	color: #000;
	font-size: 14px;
	text-decoration: none;
	text-align: center;
	font-family:"微软雅黑",arial
}
.sider-nav li .sider-nav-title {
	width: 112px;
	white-space: nowrap;
	text-overflow: ellipsis;
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
	background: #58b2dc
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
	background:#0098d2
}
.panel-title{
font-size:18px;
line-height: 26px;}
.panel-header{
text-align: left;}

</style>
<div class="easyui-accordion" style="height: 100%;" >
	<div title="历史数据查询分析" iconCls="" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center>资源量专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>储量专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>产量专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>勘探专题</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>油气贸易专题</a></span>
				
			</li>
		</ul>
	</div>
	<div title="趋势预测分析" iconCls="" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center>资源量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>储量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>产量预测</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>勘探预测</a></span>
				
			</li>
		</ul>
	</div>
    <div title="规划成果管理" iconCls="" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li >
				<span class="sider-nav-title"><a href="<%=path%>/system/user/list" target=main_center>资料规划录入</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>规划查询统计</a></span>
				
			</li>
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>规划展示</a></span>
				
			</li>
		</ul>
	</div>
	<div title="规划实施跟踪评估" iconCls="" style="overflow:auto; height:100%;" >
		<ul class="sider-nav">
			<li> 
				<span class="sider-nav-title"><a href="<%=path%>/system/role/list" target=main_center>规划实施跟踪评估</a></span>				
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