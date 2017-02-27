
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
	.headdiv a{
		color:#0e69a2;
		text-decoration:none;
		float:right;
	}
	.hds3{
		line-height:65px;
		font-size:14px;
	}
	.bodydiv1{
		margin-top:10px;
	}
    .gridtable{
    	display:table;
    	border-collapse:separate;
    	border-spacing:20px;
    }
    .cell{
    	display:table-cell;
    }
    .cell a{
    	text-decoration:none;
    	text-align:center;
    }
    .cell a img{
    	height:100px;
    	width:100px;
    }
    .cell a p{
    	font-family: "微软雅黑";
		font-size:15px;
		color:#555;
    }
	.ldiv{
		width:49%;
		margin-right:1%;
	}
	.rdiv{
		width:49%;
		margin-left:1%;
		float:right;
	}
	.bodydiv2{
		background:url(<%=path%>/image/newimg/13.png) no-repeat center;
		margin-top:30px;
	}
	.txt1{
		height:144px;
		width:210px;
		line-height:1.5;
		text-align:center;
		padding-top:10px;
		padding-left:25px;
		margin-bottom:30px;
		display:block;
		text-decoration:none;
	}
	.txt2{
		height:100px;
		width:210px;
		line-height:1.5;
		text-align:center;
		margin-left:260px;
		display:block;
		text-decoration:none;
	}
	.ti{
		font-family: "微软雅黑";
		font-size:18px;
		color:#fff;
	}
	.co{
		font-family: "微软雅黑";
		font-size:12px;
		color:#fff;
		text-align:left;
		width:210px;
	}
	.co:first-letter{margin-left:2em}
	.grid{
		display: table;		
	}
	.row{
		display: table-row;
	}
	.row a{
		text-decoration:none;
		display:table-cell;
	}
	.row a .modal{
		display: table-cell;
		width:100px;
		padding:0 5px 0 8px;
	}
	.row a .modal img{
		max-height:100px;
		line-height:1.5;
		text-align:left;	
	}
	.row a .modal1{
		display:table-cell;
		width:130px;
		padding-top:20px
	}
	.titi{
		font-family: "微软雅黑";
		font-size:14px;
		color:#666666;
		vertical-align:top;
	}
	.coco{
		font-family: "微软雅黑";
		font-size:12px;
		color:#999999;
		vertical-align:top;
	}
	.bodydiv3{
		margin-top:33px;
	}
</style>
<body id="ctdiv">	
	<div id="tp">
		<div class="headdiv">
			<span class="hds1">历史数据要览</span>
			<span class="hds2">Historical Data Is Key</span>
			<a  href=""><span class="hds3">更多</span></a>
		</div>
		<div class="bodydiv1">
			<div class="gridtable">
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/01.jpg" /><br/>
						<p>资源量</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/02.jpg"><br/>
						<p>储量</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/03.jpg"><br/>
						<p>产量</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/04.jpg"><br/>
						<p>油气贸易</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/05.jpg"><br/>
						<p>能源消费</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/06.jpg"><br/>
						<p>矿权</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/07.jpg"><br/>
						<p>非油气</p>
					</a>
				</div>
				<div class="cell">
					<a href="">
						<img src="<%=path%>/image/newimg/08.jpg"><br/>
						<p>定制分析</p>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="btm">
		<div class="rdiv">
			<div class="headdiv">
				<span class="hds1">规划跟踪评估</span>
				<span class="hds2">planning Follow-up Assessments</span>
				<a  href=""><span class="hds3">更多</span></a>
			</div> 
			<div class="bodydiv3">
				<div class="grid">
					<div class="row" id="row1">
						<a href="">
							<div class="modal">
								<img src="<%=path%>/image/newimg/09.png" />							
							</div>
							<div class="modal1">
								<span class="titi">石油储量完成情况</span><br/>
		 						<span class="coco">Completion of oil reserves</span>
							</div>
						</a>
						<a href="">
							<div class="modal">
								<img src="<%=path%>/image/newimg/10.png">
							</div>
							<div class="modal1">
								<span class="titi">石油产量完成情况</span><br/> 
		 						<span class="coco">Oil production complete status</span>
							</div>
						</a>
					</div>
					<br/><br/><br/><br/>
					<div class="row" id="row1">
						<a href="">
							<div class="modal">
								<img src="<%=path%>/image/newimg/11.png">	
							</div>
							<div class="modal1">
								<span class="titi">天然气储量完成情况</span><br/> 
		 						<span class="coco">Completion of natural gas reserves</span>
							</div>
						</a>
						<a href="">
							<div class="modal">
								<img src="<%=path%>/image/newimg/12.png">
							</div>
							<div class="modal1">
								<span class="titi">天然气产量完成情况</span><br/> 
		 						<span class="coco">Gas production is complete</span>
							</div>
						</a>
					</div>
				</div>
			</div>   
	    </div>
		<div class="ldiv">
			<div class="headdiv">
				<span class="hds1">资源规划</span>
				<span class="hds2">Resources Planning</span>
			</div>
			<div class="bodydiv2">
				<a class="txt1" href=""> 
	 				<span class="ti">规划辅助编制</span><br/> 
	 				<p class="co">通过对历史数据的分析，预测未来几年可能发生的情况。将预测结果管理起来、在预测过程中用到的一些具体的模型。</p>
	 			</a> 
				<a class="txt2" href="">
					<span class="ti">规划展示</span>
					<p class="co">系统中用到的一些基础数据，对一种数据的基本属性信息描述。</p>
				</a> 
			</div>	
		</div>	
	</div>
</body>
