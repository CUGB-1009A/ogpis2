
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<style>
.grid{
	display: table;
	border-spacing:80px 35px;
	margin:0 15%;
}
.row{
	display: table-row;
}
.modal{
	display: table-cell;
	width:250px;
	background-color: #fff;
}
.modal a{
	color:#000;
	cursor: pointer;
	font-family: "微软雅黑";	
}
.modal a img{
	max-height: 150px;
	max-width: 150px;
	margin:10px 30px;	
}
</style>
<body style="text-align:center;margin:0;background:#fff;">	
	<div class="grid">
		<div class="row">
			<div class="modal"><a><img src="<%=path%>/image/历史数据要览.png"><br/>历史数据要览</a></div>
			<div class="modal"><a><img src="<%=path%>/image/规划辅助编制.png"><br/>规划辅助编制</a></div>
		</div>
		<div class="row">
			<div class="modal"><a><img src="<%=path%>/image/规划展示.png"><br/>规划展示</a></div>
			<div class="modal"><a><img src="<%=path%>/image/规划跟踪评估.png"><br/>规划跟踪评估</a></div>
		</div>
	</div>

</body>
