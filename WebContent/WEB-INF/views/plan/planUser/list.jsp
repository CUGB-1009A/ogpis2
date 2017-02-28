<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="<%=path%>/resource/dist/echarts.js"></script>
	<script type="text/javascript" src="<%=path%>/js/plan/planUser/list.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/unslider.js"></script>    
    <link type="text/css" rel="stylesheet" href="<%=path %>/resources/unslider.css">
    <style>
    	.unslider-nav ol {display: none}
    	.unslider-arrow {
            display: block;
            width: 32px;
            height: 32px;
            top: 30%;
            right: -100px;
            left: auto;
            margin-top: -16px;
            overflow: hidden;
            background: rgba(0,0,0,.2) no-repeat 50% 50%;
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAQCAQAAABuQZ3IAAAAi0lEQVR4AU3OISBEQQBAwS0AACS9NxqQgCZpkiYBVddFvWhAAUABAPQCAGC4g/0vTnrBqCfDIZl70J+kMUBPpEwT4FNXxBxz4F1HxHyr4EVTxBLb4EFNxEon4CJSlVNw9AcV9sC16h8osgke1P1ArgXwouVvdQq86ww/GQefusNf7kBviBlxpT8k+gL/Wox4r1d4MwAAAABJRU5ErkJggg==');
            background-size: 7px 11px;
            border-radius: 32px;
            text-indent: -999em;
            opacity: .6;
            transition: opacity .2s;
        }
        .unslider-arrow.prev {
            left: 50%;
            right: auto;
            -ms-transform: rotate(-180deg);
            transform: rotate(-180deg);
        }
    </style>
	<title>完成情况管理</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<div style="margin:10px 80px 10px 10px;">
			<span style="font-size:24px;font-family:微软雅黑">规划概览</span>
			<!-- 查询窗口 -->			
			<div style="float:right;">
				<form action="<%=path%>/plan/userList">
					<input type="hidden" value="${type }" name="type">
					<input type="text"  class="easyui-textbox" id="inputFuzzyQuery" data-options="prompt:'模糊查询条件'" name="condition" value="">
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="easyui-linkbutton">查询</button>					
				</form>			
			</div>
		</div>
		<!-- 规划开始内容 -->
		<div class="easyui-accordion" style="margin:20px 10px 10px 10px;text-align:center" id="sew">
			<c:forEach items="${mapList }" var="item1" varStatus="status">
				<div title="${item1.get('plan').planName }" style="overflow:auto;padding:10px;">
					<div style="width:50%;float:left">
						<textarea class="inputsmain" style="display: none;">${item1.get('plan').indexDataInPlanYear }</textarea>
						<div class="charts charts_${status.index }" id="${item1.get('plan').id }_${listType}"
							style="height: 300px;width: 100%" align="center">
							
						</div>
					</div>
					<div style="width:50%;float:right">
						<textarea class="inputsindex" style="display: none;">${item1.get('plan').indexDataInBoth }</textarea>
						<div id="lunbo${status.index }" class="banner" style="height: 300px;width: 100%">
							<c:set var="temp" value="0"/>
							<ul>
								<c:forEach items="${item1.get('plan').indexs }"	var="indexTemp">
									<c:if test="${indexTemp.track }">
										<li>
											<div class="mainCharts mainCharts_${status.index } first_${temp}"
												style="height: 300px;width: 100%;" id="${item1.get('plan').id}_${listType }">
											</div>
										</li>
										<c:set var="temp" value="${temp+1 }"/>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="test" style="height: 400px;width: 400px;float: left;display: none;"></div>
	</div>	
	<script type="text/javascript">
	
		$(function(){
			var mySlider=$('.banner').unslider({
				speed:500,
	            delay:3000,
	            keys:true,
	            fluid:true,
	            autoplay: true,
	            infinite: true,
	            arrow:true
			});
			data=mySlider.data('unslider');
			$('.banner').hover(function(){
				data.stop();
			},function(){
				data.start();
			})
		})	
	
		function showDetail(){
			var temp=this.id;
			var id=temp.substring(0,temp.indexOf("_"));
			var listType=temp.substring(temp.indexOf("_")+1,temp.length);
			var $expandingMenus=$("ul .in");
			var appendURL="&menus=";
			for(var i=0;i<$expandingMenus.length;i++){
				appendURL+=$expandingMenus[i].id;
				if(i!=$expandingMenus.length-1){
					appendURL+=",";
				}
			}
			window.location.href="<%=path%>/plan/userDetail?id="+id+"&&listType="+listType+appendURL;
			<%-- window.location.href="<%=path%>/plan/userDetail"; --%>
		}
	</script>
</body>
</html>