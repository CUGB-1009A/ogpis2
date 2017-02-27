
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
	.rightdiv{
		width:870px;
		float:right;
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
		width:750px;
		
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
	.leftdiv{
		width:100px;
		margin-right:30px;
	}
	ul{
		padding:0;
		font-family: "微软雅黑";
		font-size:16px;
	}
	li{
		list-style-type:none;
		margin-bottom:20px;
	}
	li a {
		text-decoration: none;
		color:#666; 
	} 
	li.current a {
		color:#0e5197;
	}
</style>
<body id="ctdiv">
	<div class="headdiv">
		<span class="hds1" id="titleCN"></span>
		<span class="hds2" id="titleEN"></span>
	</div>
	<div class="bodydiv" id="showThree">
		<div class="rightdiv" id="rightdiv">
			<div class="grid">
				<div class="row" >
					<a href="">
						<div class="modal">
							<img src="<%=path%>/image/newimg/2-001.png" />							
						</div>
						<div class="modal1">
							<span class="titi">世界</span><br/>
	 						<span class="coco">通过对历史数据的分析，预测未来几年可能发生的情况。将上面的预测结果管理起来在预测过程中用到的一些具体的数学方法展示规划的总体信息。</span>
						</div>
					</a>
				</div>
				<br />
			</div>
		</div>
		<div class="leftdiv" id="leftdiv">
			<ul>
				
			</ul>
		</div>
	</div>   
</body>
<script>
$(document).on('click', 'li', function() {
    $('li').removeClass('current');
    $(this).addClass('current');
    
});
</script>