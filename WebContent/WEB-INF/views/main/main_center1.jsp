<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<style>
	#ctdiv{
		width:1000px;
		margin:0 auto;
	}
	.headdiv{
		height:65px;
		vertical-align:middle;
		border-bottom:solid 1px #DCDCDC;
	}
	.hds1{
		font-family: "微软雅黑";
		font-size:26px;
		color:#555555;
		line-height:65px;
	}
	.hds2{
		font-family: "微软雅黑";
		font-size:14px;
		color:#999999;
	}
	.bodydiv{
		margin-top:33px;
	}
	.rdiv{
		width:100%;
	}
	.grid{
		display: table;		
	}
	.row{
		display: table-row;
	}
	.row a{
		text-decoration:none;
		display:table-cell;
		text-align:left;
		line-height:2
	}
	.row a .modal{
		display: table-cell;
		width:100px;
		padding-right:20px;
	}
	.row a .modal img{
		max-height:100px;
	}
	.row a .modal1{
		display:table-cell;
		width:880px;
		
	}
	.titi{
		font-family: "微软雅黑";
		font-size:20px;
		color:#666666;
		vertical-align:top;
	}
	.coco{
		font-family: "微软雅黑";
		font-size:14px;
		color:#999999;
		vertical-align:top;
		display:inline-block;
		text-indent:2em;
	}
</style>
<body id="ctdiv">
		<div class="headdiv">
			<span class="hds1" id="titleCN"></span>
			<span class="hds2" id="titleEN"></span>
		</div>
		<div class="bodydiv" id="showTwo">

		</div>
</body>
