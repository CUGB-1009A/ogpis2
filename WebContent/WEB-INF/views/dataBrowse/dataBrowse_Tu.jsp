<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

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
	<div id="tt" class="easyui-tabs" style="width:100%;height:40%;">       
	 
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
   						i++;
		   				$('#tt').tabs('add',{    
		   				    title:$(this).text(),
			   				closable:false
	   					});
   					});
	   	}
	});
	
	$('#tt').tabs({
		onSelect:function(title,index){
			if(!first){
						
					}
			first = false ;	
			var dataSourceId = dataSourceArray[index];
			var tab = $('#tt').tabs('getSelected');  
	    	$('#tt').tabs('update', {
	    		tab: tab,
	    		options: {
	    			content: getDivContent(dataSourceId)
	    		}
	    	});	
		}
	
	});
});

function getDivContent(dataSourceId){
	var content;
	$.ajax({
	    url: '<%=path%>/getTabDimension',
	    data:{"id":dataSourceId},
	    dataType: 'json',
	    async: false,
	    success: function(data){//将维度信息添加到tab页上
	    	content ="x坐标:<select id='x'>";
	    	for(var i=0;i<data.coordinate.length;i++){
	    		if(data.coordinate[i].x)
	    			content +=  "<option value ='"+data.coordinate[i].key+"'>"+data.coordinate[i].value+"</option>";
	    	}
	    	content += "</select>";
	    	content +="y坐标:<select id='y'>";
	    	for(var i=0;i<data.coordinate.length;i++){
	    		if(!data.coordinate[i].x)
	    			content +=  "<option value ='"+data.coordinate[i].key+"'>"+data.coordinate[i].value+"</option>";
	    	}
	    	content += "</select><br>";
	    	for(var i=0;i<data.condition.length;i++){
	    		content += data.condition[i].name;
	    		content = content + "<select class='condition' name='"+data.condition[i].name_key+"'>";
	    		for(var j=0;j<data.condition[i].value.length;j++){
	    			content = content + "<option value ='"+data.condition[i].value[j]+"'>"+data.condition[i].value[j]+"</option>";			    		
	    		}
	    		content += "</select><br>";
	    	}
	    	content += "<button onclick=\"search('"+data.table+"')\">查询</button>"
	   	}
	});
	return content ;
}

function search(table){
	var sql = writeSQL(table);
	alert(sql)
}

function writeSQL(table){
	var sql = "select ";
	var x = $("#x").val();
	var y = $("#y").val();
	console.log(x+y)
	var condition = new Array();
	var value = new Array();
	var i=0;
	 $(".condition").each(function(){
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