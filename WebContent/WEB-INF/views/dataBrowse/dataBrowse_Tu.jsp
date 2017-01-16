<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/data_mould.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/mychart.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/buildReports/bulidReport.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dataBrowse/browseHandle.js"></script>
<style type="text/css">
	tr{
	height:30px;
	}
	td{
	width:200px;
	}
</style>

</head>
<body>
<div data-options="region:'north'" style="height:200px">
	<div id="tt" class="easyui-tabs" style="width:100%;height:100%;">       
	 
	</div>
	
	<div data-options="region:'center' fit:true">
        <div style="text-align:center;">
        	<div id="dataBrowseRepDiv" style="width:45%;height:400px;float:left;padding-left:50px">
				<script>
					insertReport('dataBrowseReport', 'Rebar=none; Border=none; Ruler=none; PagesTabPercent=0; SeperateBar=none')
				</script> 
			</div>
			<div id="dataBrowseChartDiv"style="width:50%;height:450px;float:left;"></div>
        </div>
	</div>
</div>
</body>
<script type="text/javascript">
var first = true ;
var id = '${id}';//level3的id
var ids = new Array();//tab页的id组
var dataSourceArray = new Array();//tab页的数据源组
$(function(){
	$.ajax({
	    url: '<%=path%>/dataBrowse/menutree.xml',
	    dataType: 'xml',
	    async: false,
	    success: function(data){
   				 	var level3 = $(data).find("level3[id='"+id+"']");
   				 	var i = 0 ;
   					level3.find("tab").each(function(){
   						ids[i] = $(this).attr("dataSource");
   						dataSourceArray[i] = $(this).attr("dataSource");
		   				$('#tt').tabs('add',{    
		   				    title:$(this).text(),
			   				closable:false,
			   				content: getDivContent(i,$(this).attr("dataSource"))
	   					});
   						i++;
   					});
	   	}
	});

	
	$('#tt').tabs({
		onSelect:function(title,index){
			$("#btn"+index).click();
		}
	
	});
});

function getDivContent(ii,dataSourceId){
	var content;
	$.ajax({
	    url: '<%=path%>/getTabDimension',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将维度信息添加到tab页上
	    	content ="x坐标:<select id='x"+ii+"'>";
	    	for(var i=0;i<data.coordinate.length;i++){
	    		if(data.coordinate[i].x)
	    			content +=  "<option value ='"+data.coordinate[i].key+"'>"+data.coordinate[i].value+"</option>";
	    	}
	    	content += "</select>";
	    	content +="y坐标:<select id='y"+ii+"'>";
	    	for(var i=0;i<data.coordinate.length;i++){
	    		if(!data.coordinate[i].x)
	    			content +=  "<option value ='"+data.coordinate[i].key+"'>"+data.coordinate[i].value+"</option>";
	    	}
	    	content += "</select><br>";
	    	for(var i=0;i<data.condition.length;i++){
	    		content += data.condition[i].name;
	    		content = content + "<select class='condition"+ii+"' name='"+data.condition[i].name_key+"'>";
	    		for(var j=0;j<data.condition[i].value.length;j++){
	    			content = content + "<option value ='"+data.condition[i].value[j]+"'>"+data.condition[i].value[j]+"</option>";			    		
	    		}
	    		content += "</select><br>";
	    	}
	    	content += "<button id='btn"+ii+"'onclick=\"search("+ii+",'"+data.table+"')\">查询</button>"
	   	}
	});
	return content ;
}

function search(ii,table){
	var sql = writeSQL(ii,table);
	console.log(sql);
	$.ajax({
	    url: '<%=path%>/getDataBySql',
	    data:{"sql":encodeURIComponent(sql)},
	    dataType: 'json',
	    async: false,
	    success: function(data){
	    	var result = {"xName":"","yName":"","ds1":data};
	    	result.xName = $("#x"+ii+" option:selected").text();
	    	result.yName = $("#y"+ii+" option:selected").text();
	    	BrowseHandle.refreshReportAndChart($("#y"+ii+" option:selected").text(),result);
	    }
	});
}

function writeSQL(ii,table){
	var sql = "select ";
	var x = $("#x"+ii).val();
	var y = $("#y"+ii).val();
	console.log(x+y)
	var condition = new Array();
	var value = new Array();
	var i=0;
	 $(".condition"+ii).each(function(){
		condition[i] = $(this).attr("name");
		value[i] = $(this).val();
		i++;	
	});
	sql = sql + x +","+y+" from "+ table +" where " 
	for(var j=0;j<condition.length;j++){
		if(j==condition.length-1)
			sql = sql + condition[j] + "='" + value[j] +"'" 
		else
			sql = sql + condition[j] + "='" + value[j] +"' and " 	
	}
	return sql ;
	
}

function getTabIndex(){
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
	return index ;
}




</script>


</html>