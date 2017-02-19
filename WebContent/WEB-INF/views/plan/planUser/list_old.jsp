<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="<%=path%>/resources/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=path%>/resource/dist/echarts.js"></script>
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
					<input type="text"  class="easyui-textbox" id="inputFuzzyQuery" data-options="prompt:'模糊查询条件'" name="condition">
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
						<div id="lunbo${status.index }" class="carousel slide" style="height: 300px;width: 100%">
							<div class="carousel-inner activeCharts">
								<c:set var="temp" value="0"/>
								<c:forEach items="${item1.get('plan').indexs }"	var="indexTemp">
									<c:if test="${indexTemp.track }">
										<div class="item">
											<div class="mainCharts mainCharts_${status.index } first_${temp}"
												style="height: 300px;width: 100%;" id="${item1.get('plan').id}_${listType }">
												<p>This is Why we play!</p>
											</div>
										</div>
										<c:set var="temp" value="${temp+1 }"/>
									</c:if>
								</c:forEach>
							</div>
							<a class="carousel-control left" href="#lunbo${status.index }"
								data-slide="prev" style="padding-top: 15%">&lsaquo;</a>
							<a class="carousel-control right" href="#lunbo${status.index }"
								data-slide="next" style="padding-top: 15%">&rsaquo;</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="test" style="height: 400px;width: 400px;float: left;display: none;"></div>
	</div>	
	<script type="text/javascript">
		function showDetail(){
			/*var temp=this.id;
			var id=temp.substring(0,temp.indexOf("_"));
			var listType=temp.substring(temp.indexOf("_")+1,temp.length);
			var $expandingMenus=$("ul .in");
			var appendURL="&menus=";
			for(var i=0;i<$expandingMenus.length;i++){
				appendURL+=$expandingMenus[i].id;
				if(i!=$expandingMenus.length-1){
					appendURL+=",";
				}
			}*/
			<%-- window.location.href="<%=path%>/plan/userDetail?id="+id+"&&listType="+listType+appendURL; --%>
			window.location.href="<%=path%>/plan/userDetail";
		}
	</script>
	<script type="text/javascript" src="<%=path%>/js/plan/planUser/list.js"></script>
	<script type="text/javascript">

	</script>
</body>
</html>