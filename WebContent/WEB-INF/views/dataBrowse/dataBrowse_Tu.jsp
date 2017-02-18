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
var titles = new Array();//每个tab页的图标的标题的固定部分
var date = new Date();
var currentYear =  "" + date.getFullYear();
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
   						titles[i] = $(this).attr("title");
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
	var content="";
	$.ajax({
	    url: '<%=path%>/getTabDimension1',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将选择的表信息、字段信息、维度信息添加到tab页上
	    	for(var i=0;i<data.condition.length;i++){
	    		if(data.condition[i].type =="interfaceTable"){
	    			content += "<span class='interfaceTable"+ii+"'>"+ data.condition[i].name +":</span><select class='interfaceTable"+ii+"' onchange='dataSourceChange("+ii+")'>";
	    			for(var ll=0;ll<data.condition[i].tableArray.length;ll++){
	    				content +=  "<option value ='"+data.condition[i].tableArray[ll].id+"'>"+data.condition[i].tableArray[ll].key+"</option>";
	    			}
	    			content += "</select><br class='interfaceTable"+ii+"'>";
	    		}
	    		if(data.condition[i].type =="choice"){
	    			content += "<span class='choice"+ii+"'>"+data.condition[i].name +":</span><select class='choice"+ii+"'>";
	    			for(var jj=0;jj<data.condition[i].choiceArray.length;jj++){
	    				content +=  "<option value ='"+data.condition[i].choiceArray[jj].key+"'>"+data.condition[i].choiceArray[jj].value+"</option>";
	    			}
	    			content += "</select><br class='choice"+ii+"'>";
	    		}
	    		if(data.condition[i].type =="condition"){
	    			if(data.condition[i].isYear){//选择条件为时间
							if(data.condition[i].yearType=="point"){//时间为时间点的处理分支
								content += "<span class='condition"+ii+"'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='year condition"+ii+"'>";
				    			for(var kk=1949;kk<currentYear;kk++){
				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    			}
				    			content += "</select><br class='condtion"+ii+"'>";
	    					}
							else{//时间为时间段的处理分支
								content += "<span class='condition"+ii+"'>"+"起始年份"+":</span><select name='"+data.condition[i].key+"'class='year condition"+ii+"'>";
				    			for(var kk=1949;kk<currentYear;kk++){
				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    			}
				    			content += "</select><br class='condtion"+ii+"'>";
				    			content += "<span class='condition"+ii+"'>"+"终止年份" +":</span><select name='"+data.condition[i].key+"'class='year condition"+ii+"'>";
				    			for(var kk=1949;kk<currentYear;kk++){
				    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
				    			}
				    			content += "</select><br class='condtion"+ii+"'>";
							}
	    			}
	    			else{//不是年份的处理分支
		    				content += "<span class='condition"+ii+"'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='notYear condition"+ii+"'>";
			    			for(var kk=0;kk<data.condition[i].value.length;kk++){
			    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
			    			}
			    			content += "</select><br class='condtion"+ii+"'>";
	    				}	
	    		}
	    		
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
	    	var result = {"xName":data.xName,"yName":data.yName+"("+data.unit+")","ds1":data.data};
	    	var title = titles[ii]+$(".interfaceTable"+ii+" option:selected").text()+$(".notYear .condition"+ii+" option:selected").text()+data.yName;
	    	var temp = $("select[class='year condition"+ii+"']");
	    	if(temp.length==1){
	    		title += $(temp[0]).find("option:selected").text()+"年";
	    	}
	    	if(temp.length==2){
		    		title += $(temp[0]).find("option:selected").text()+"──"+$(temp[1]).find("option:selected").text()+"年";
	    	}
	    	BrowseHandle.refreshReportAndChart(title,result);
	    }
	});
}

function writeSQL(ii,table){
	var sql = "select ";
	var temp = $("select[class='choice"+ii+"']");
	var feilds = new Array();
	for(var i=0;i<temp.length;i++){
		feilds[i] = temp[i].value;
	}	
	for(var jj=0;jj<feilds.length;jj++){
		if(jj==feilds.length-1)
			sql = sql + feilds[jj] + " from " 
		else
			sql = sql + feilds[jj] + ", " 	
	}
	var condition = new Array();
	var value = new Array();
	var i=0;
	$("select[class='notYear condition"+ii+"']").each(function(){
		condition[i] = $(this).attr("name");
		value[i] = $(this).val();
		i++;	
	});
	sql = sql + table +" where " 
	for(var j=0;j<condition.length;j++){
		if(j==condition.length-1)
			sql = sql + condition[j] + "='" + value[j] +"'" 
		else
			sql = sql + condition[j] + "='" + value[j] +"' and " 	
	}
	if($("select[class='year condition"+ii+"']").length==1){//说明是时间点
		sql = sql + "and "+$("select[class='year condition"+ii+"']")[0].name+"="+$("select[class='year condition"+ii+"']")[0].value;
	}
	if($("select[class='year condition"+ii+"']").length==2){//说明是时间区间
		sql = sql + "and "+$("select[class='year condition"+ii+"']")[0].name+">="+$("select[class='year condition"+ii+"']")[0].value+" and "+$("select[class='year condition"+ii+"']")[1].name+"<="+$("select[class='year condition"+ii+"']")[1].value;
	}
	return sql ;
	
}

function getTabIndex(){
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
	return index ;
}

function dataSourceChange(ll){
	var tab = $('#tt').tabs('getSelected');  // 获取选择的面板
	var dataSourceId = $("select[class='interfaceTable"+ll+"']").val();
	var temp = $('.interfaceTable'+ll);
	content = '';
	for(var i=0;i<temp.length;i++){
		content += temp[i].outerHTML;
	}	
	$.ajax({
	    url: '<%=path%>/getTabDimension1',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将选择的表信息、字段信息、维度信息添加到tab页上
	    	for(var i=0;i<data.condition.length;i++){
	    		if(data.condition[i].type =="interfaceTable"){
	    			content += "<span class='interfaceTable"+ll+"'>"+ data.condition[i].name +":</span><select class='interfaceTable"+ll+"' onchange='dataSourceChange("+ll+")'>";
	    			for(var ii=0;ii<data.condition[i].tableArray.length;ii++){
	    				content +=  "<option value ='"+data.condition[i].tableArray[ii].id+"'>"+data.condition[i].tableArray[ii].key+"</option>";
	    			}
	    			content += "</select><br class='interfaceTable"+ll+"'>";
	    		}
	    		if(data.condition[i].type =="choice"){
	    			content += "<span class='choice"+ll+"'>"+data.condition[i].name +":</span><select class='choice"+ll+"'>";
	    			for(var jj=0;jj<data.condition[i].choiceArray.length;jj++){
	    				content +=  "<option value ='"+data.condition[i].choiceArray[jj].key+"'>"+data.condition[i].choiceArray[jj].value+"</option>";
	    			}
	    			content += "</select><br class='choice"+ll+"'>";
	    		}
	    		if(data.condition[i].type =="condition"){
	    			if(data.condition[i].isYear){//选择条件为时间
						if(data.condition[i].yearType=="point"){//时间为时间点的处理分支
							content += "<span class='condition"+ll+"'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='year condition"+ll+"'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion"+ll+"'>";
    					}
						else{//时间为时间段的处理分支
							content += "<span class='condition"+ll+"'>"+"起始年份"+":</span><select name='"+data.condition[i].key+"'class='year condition"+ll+"'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion"+ll+"'>";
			    			content += "<span class='condition"+ll+"'>"+"终止年份" +":</span><select name='"+data.condition[i].key+"'class='year condition"+ll+"'>";
			    			for(var kk=1949;kk<currentYear;kk++){
			    				content +=  "<option value ='"+kk+"'>"+kk+"</option>";
			    			}
			    			content += "</select><br class='condtion"+ll+"'>";
						}
    			}
    			else{//不是年份的处理分支
	    				content += "<span class='condition"+ll+"'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='notYear condition"+ll+"'>";
		    			for(var kk=0;kk<data.condition[i].value.length;kk++){
		    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
		    			}
		    			content += "</select><br class='condtion"+ll+"'>";
    				}
	    			/* content += "<span class='condition"+ll+"'>"+data.condition[i].name +":</span><select name='"+data.condition[i].key+"'class='condition"+ll+"'>";
	    			for(var kk=0;kk<data.condition[i].value.length;kk++){
	    				content +=  "<option value ='"+data.condition[i].value[kk]+"'>"+data.condition[i].value[kk]+"</option>";
	    			}
	    			content += "</select><br class='condtion"+ll+"'>"; */
	    		}
	    		
	    	}   
	    	content += "<button id='btn"+ll+"'onclick=\"search("+ll+",'"+data.table+"')\">查询</button>"
	   	}
	});
	$('#tt').tabs('update', {
		tab: tab,
		options: {
			content: content  // 新内容的URL
		}
	});
	$(".interfaceTable"+ll).val(dataSourceId);

}



</script>


</html>