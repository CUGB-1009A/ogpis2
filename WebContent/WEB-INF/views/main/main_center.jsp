<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>

<body style="text-align:center;margin:0;background:#EBF6FC;">	
<img id="backImg" src="../images/main_center.jpg">
<!-- <div class="easyui-panel"  style="height:10px" data-options="region:'center',iconCls:'icon-home',title:'&nbsp;待办事宜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<a  onclick=\'javascript:add1()\'>更多...</a>)'"></div> -->
<!-- <div align="right"><a href="#"  style="text-align:left;width:50px;color:#000000" onclick="javascript:add1()"></a></div> -->


<!-- <div style="height:300px"> -->
<!-- 	<table  cellspacing="0" cellpadding="0" align="center" width="90%" > -->
<!-- 		<tr><td><br><br></td></tr> -->
<%-- 			<c:forEach items="${sessionScope.syList}" var="sy" varStatus="ggStatus"> --%>
<!-- 				<tr height="25"> -->
<!-- 					<td align="left" valign="top" width="80%"> -->
<%-- 						<a onclick="dbsyWindow('${sy[5]}')" style="cursor:hand;"> --%>
<%-- 							<img src="../images/tip.png" width="12" border="0">&nbsp;&nbsp;<u><c:out value="${sy[1]}" /></u> --%>
<!-- 						 </a> -->
<!-- 					</td> -->
<%-- 				<td valign="middle" width="20%">&nbsp;&nbsp;&nbsp;<c:out value="${sy[2]}" /></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 	</table> -->
<!-- </div> -->

<!-- <div class="easyui-panel"  style="height:10px" data-options="region:'center',iconCls:'icon-home',title:'&nbsp;公告通知&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<a  onclick=\'javascript:add()\'>更多...</a>)'"></div> -->
<!-- <div align="right"><a href="#"  style="text-align:left;width:50px;color:#000000" onclick="javascript:add()"></a></div> -->


<!-- <div style="height:230px"> -->
<!-- 	<table  cellspacing="0" cellpadding="0" align="center" width="90%" > -->
<!-- 		<tr><td><br><br></td></tr> -->
<%-- 			<c:forEach items="${sessionScope.ggList}" var="gg" varStatus="ggStatus"> --%>
<!-- 				<tr height="25"> -->
<!-- 					<td align="left" valign="top" width="80%"> -->
<%-- 						<a onclick="newWindow('${gg.zj}')" style="cursor:hand;"> --%>
<%-- 							<img src="../images/tip.png" width="12" border="0">&nbsp;&nbsp;<u>${gg.ggmc}</u> --%>
<!-- 						 </a> -->
<!-- 					</td> -->
<%-- 					<td valign="middle">${gg.ggsj}</td> --%>
<%-- 					<td valign="middle">&nbsp;&nbsp;&nbsp;<a href="xtgl/downloadAcc.action?id=${gg.zj}">附件下载</a></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 	</table> -->
<!-- </div> -->


<div id="lb2" style="text-align: center; padding: 10px 5px 2px 5px">
	<table id="dd"></table>
</div>
 </body>
 <script type="text/javascript">
 
 function dbsyWindow(bs){
	 if(bs != null && bs == '1'){
		 this.location="<%=path%>/zcdj/listZcdjGdzc.jsp";
	 }else if(bs != null && bs == '2'){
		 this.location="<%=path%>/zcdj/listGlbmGdzcSp.jsp";
	 }else if(bs != null && bs == '3'){
		 this.location="<%=path%>/zcdj/listGlbmWxzcSp.jsp";
	 }else if(bs != null && bs == '4'){
		 this.location="<%=path%>/zcdj/listGlbmTdzcSp.jsp";
	 }else if(bs != null && bs == '5'){
		 this.location="<%=path%>/zctj/listZctjGdzc.jsp";
	 }else if(bs != null && bs == '6'){
		 this.location="<%=path%>/zctj/listYwbmZctjSp.jsp";
	 }else if(bs != null && bs == '7'){
		 this.location="<%=path%>/zctj/listGlbmZctjSp.jsp";
	 }else{
		 this.location="<%=path%>/zcbf/listGlbmGdzcSp.jsp";
	 }
 }
 function newWindow(zj){
	 $('#lb2').dialog({   
		    title: '公告通知',   
		    href: '<%=path%>/Gggl!getGg.action?zj='+zj, 
		    width: 1000,   
		    height: 500,  
		    closed: false, 
		    cache: false,     
		    modal: true
		}); 
 }
 
 /**
	 * 资产明细
	 * 
	 */
	function add() {
		$('#lb2').dialog({   
		    title: '公告通知',   
		    href: '<%=path%>/Gggl!getAllGg.action', 
		    width: 1000,   
		    height: 500,  
		    closed: false, 
		    cache: false,     
		    modal: true
		}); 
	}	
 
	function add1() {
		$('#lb2').dialog({   
		    title: '待办事宜',   
		    href: '<%=path%>/Gggl!getAllSy.action', 
		    width: 1000,   
		    height: 500,  
		    closed: false, 
		    cache: false,     
		    modal: true
		}); 
	}	
 </script>
