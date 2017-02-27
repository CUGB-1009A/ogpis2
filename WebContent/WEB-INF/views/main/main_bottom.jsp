<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<style>
	#btmdiv{
		margin:0;
		background-color:#DCDCDC
	}
	.grid{
		padding-top:20px;
		display: table;
		background-color:transparent;
		margin:0 auto;
	}
	.row{
		display: table-row;
	}
	.tit{
		display: table-cell;
		text-align:right;
		font-family: "微软雅黑";
		font-size:18px;
		color:#666;
		width:100px;
		padding-right:45px;
		height: 100%;
		vertical-align:top;
	}
	.modal{
		display: table-cell;
		text-align:left;
		height: 100%;
		vertical-align: top;
		padding-top:5px;
		font-family: "微软雅黑";
		font-size:12px;
		color:#666;
		width:190px;
	}
	.m{width:80px}
</style>
<body id="btmdiv" >
<div class="grid">
		<div class="row" id="row1">
			<div class="tit">版权所有</div>
			<div class="modal">国土资源部油气资源战略研究中心 京ICP备120405410号</div>
			<div class="tit">地址</div>
			<div class="modal">北京市西城区兵马司胡同19号</div>
			<div class="tit">邮政编码</div>
			<div class="modal m">100034</div>
		</div>
		<div class="row" id="row2">
			<div class="tit"></div>
			<div class="modal"></div>
			<div class="tit">Email</div>
			<div class="modal">youqizhongxin@163.com</div>
			<div class="tit"></div>
			<div class="modal m"></div>
		</div>
	</div>
</body>

