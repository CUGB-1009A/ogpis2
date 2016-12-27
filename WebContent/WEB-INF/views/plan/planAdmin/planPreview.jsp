<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>新建规划</title>
</head>
<body>
	<div>
		<div style="margin:10px 10px 10px 10px;">
			<span style="font-size:24px;font-family:微软雅黑">十二五规划详细信息</span>
		</div>
		<div style="margin: 50px 10px 0 10px">
			<div style="margin-left:150px">			
				<span>规划每年完成情况</span>
			</div><br>
			<div  style="float:left">
				<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
			</div>
		</div>
		<div style="margin: 50px 100px 100px 10px">
			<div style="text-align:center"><h3>概述</h3></div>
			<div>
				<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"十二五"是从2011年到20015年。全国“十二五”油气勘探开发规划是由国家发改委、国家能源局共同发布的关于我国油气资源勘探开发规划的文件，
					文件基于“十一五”油气资源勘探开发的完成情况，结合当前油气资源勘探开发的背景，对“十二五”期间油气资源勘探开发面临的形势进行了评估。
				</p>					
			</div>
		</div>
		<div>
			<div class="easyui-tabs" style="margin:200px 10px 10px 10px">
				<div title="规划背景" style="padding:10px">
					<p style="font-size:14px">
						 "十二五"是从2011年到20015年。全国“十二五”油气勘探开发规划是由国家发改委、国家能源局共同发布的关于我国油气资源勘探开发规划的文件， 
							文件基于“十一五”油气资源勘探开发的完成情况，结合当前油气资源勘探开发的背景，对“十二五”期间油气资源勘探开发面临的形势进行了评估。 
					</p>					
				</div>
				<div title="相关历史数据" style="padding:10px">
					<div style="text-align:center">
						<h1>规划指定参考相关历史数据</h1>
					</div>
					<div>
						<span>1、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
						<span>2、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg"><br>
						<span>3、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
						<span>4、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg"><br>
						<span>5、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
						<span>6、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg"><br>
						<span>7、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
						<span>8、新增石油探明地质储量</span>
						<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg">
					</div>
				</div>
				<div title="规划目标" style="padding:10px">
					<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg" style="margin-left:100px">
					<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg" style="float:right;margin-right:100px"><br><br><br>
					<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg" style="margin-left:100px">
					<img alt="规划每年完成情况" src="<%=path%>/resources/images/eg_tulip.jpg" style="float:right;margin-right:100px">
				</div>
				<div title="相关文档" style="padding:10px">
					<div>
						<a><font size="3">天然气发展十二五规划.pdf</font></a>
						<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="float:right;margin-right:100px">下载</a>
					</div><br><br>
					<div>
						<a><font size="3">我国三大石油公司的天然气发展战略.pdf</font></a>
						<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="float:right;margin-right:100px">下载</a>
					</div><br><br>
					<div>
						<a><font size="3">中石油发布“十二五”油气资源勘探开发规划.pdf</font></a>
						<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="float:right;margin-right:100px">下载</a>
					</div><br><br>
					<div>
						<a><font size="3">国家能源十二五规划.pdf</font></a>
						<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="float:right;margin-right:100px">下载</a>
					</div><br><br>
					<div>
						<a><font size="3">十二五油气勘察重大进展分布图.pdf</font></a>
						<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" style="float:right;margin-right:100px">下载</a>
					</div>
				</div>
				<div title="规划跟踪与评价" style="padding:10px">
					<a href="<%=path%>/track/index">进行跟踪</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>