<!-- 这是数据缓存维护jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 $(function(){
	 //加载维度信息表
	var datagridDataSource = $('#dataSourceGrid');
	var h = $('body').height()-$('#haha').height()-170;
	datagridDataSource.datagrid({
				border : false,
				height:h,
				fitColumns : true,
				remoteSort:false,
				singleSelect : true,
				rownumbers:true,
				url : '<%=path%>/dataSourceList',
				pagination:true,
				rowStyler: function(index,row){
					if (index==1){
						return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
					}
				},
				columns : [ [
						{
							field : 'id',
							title : '<input name="dataSourceAll" type="checkbox" value=""/>',
							width : 0,
							formatter : function(value,row,index) {
								var option = '<input name="dataSource" type="checkbox" value="'+value+'" />';
								return option;
							}
						},
						{
							field : 'name',
							sortable:true,
							title : '数据源名称',
							width : 20
						},
						{
							field : 'createTime',
							title : '创建时间',
							width : 20,
							formatter : function(value,row,index) {
								var year = value.year+1900;
								var month = value.month+1;
								var date = value.date;
								return year+"-"+month+"-"+date;
							}
						},
						{
							field : 'description',
							title : '描述信息',
							width : 20,
						},
						 {
							field:'subject',
							title:'所属主题',
							width:20,
							formatter : function(value,row,index){
								return value.name;
							}
						}] ],
				onLoadSuccess : function(data) {
					$('#dataSourceGrid').datagrid('fixRowHeight');//为了对齐行号
				}
			});
 
 var datagridDataCache = $('#dataCacheGrid');
	datagridDataCache.datagrid({
				border : false,
				height:h,
				fitColumns : true,
				remoteSort:false,
				singleSelect : true,
				rownumbers:true,
				url : '<%=path%>/dataSourceList',
				pagination:true,
				rowStyler: function(index,row){
					if (index==1){
						return 'selected:true';    // rowStyle是一个已经定义了的ClassName(类名)
					}
				},
				columns : [ [
						{
							field : 'id',
							title : '<input name="dataSourceAll" type="checkbox" value=""/>',
							width : 0,
							formatter : function(value,row,index) {
								var option = '<input name="dataSource" type="checkbox" value="'+value+'" />';
								return option;
							}
						},
						{
							field : 'name',
							title : '缓存参数',
							width : 20
						},
						{
							field : 'createTime',
							title : '缓存创建时间',
							width : 20,
							formatter : function(value,row,index) {
								var year = value.year+1900;
								var month = value.month+1;
								var date = value.date;
								return year+"-"+month+"-"+date;
							}
						},
						 {
							field:'_count',
							title:'计数',
							sortable:true,
							width:20,
							formatter : function(value,row,index){
								return index+1;
							}
						}] ],
				onLoadSuccess : function(data) {
					$('#dataSourceGrid').datagrid('fixRowHeight');//为了对齐行号
				}
			});
});
 </script>
</head>
<body>
	<div id="test" style="width:600px; height: 400px; display: none"><!-- 弹出框 -->
		<div id="cacheChart" style="width:550px; height: 320px;">
			
		</div>
	</div>
	<div class="easyui-panel" title="缓存维护" style="width:100%;height:100%;background:#fafafa;"data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">  
	    <div style="width:50%;height:100%;float:left"> 
	   		<div style="padding:20px">
	   			<div id="haha" style="padding-bottom:10px;height:40px">
		   			数据源主题：<br/><br/> 
						<label><input name="dataSourceSubject" type="radio" value="1" checked/>储量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="2" />产量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="3" />资源量 </label> 
						<label><input name="dataSourceSubject" type="radio" value="4" />消费量</label> 
						<label><input name="dataSourceSubject" type="radio" value="5" />进出口 </label> 
						<label><input name="dataSourceSubject" type="radio" value="6" />其他 </label> 
				</div>  			
	   		</div>
	   		<div style="padding-left:10px;border-top:2px solid grey;border-bottom:2px solid grey;border-right:1px solid grey;">
	   			<table id="dataSourceGrid" class="easyui-datagrid .datagrid-btable"></table>
	   		</div>
	   		<div style="padding-top:20px;text-align:center">
	   			<button>刷新缓存列表</button>
	   		</div> 
		</div> 
		    <div style="width:50%;height:100%;float:left"> 
	   		<div style="padding:20px">
	   			<div id="haha1" style="padding-bottom:10px;height:40px">
		   			<span style="font-size:25px">缓存列表</span>
				</div>  			
	   		</div>
	   		<div style="padding-right:10px;border-top:2px solid grey;border-bottom:2px solid grey;border-left:1px solid grey;">
	   			<table id="dataCacheGrid" class="easyui-datagrid .datagrid-btable"></table>
	   		</div>
	   		<div style="padding-top:20px;text-align:center">
	   			<button onclick="showCacheData()">显示统计图</button>
	   			<button>更新缓存</button>
	   			<button>删除缓存</button>
	   		</div> 
		</div>  
	</div>
</body>
<script type="text/javascript">
function showCacheData(){
	var historyData = ${historyData};
	var historyDataString;
	var historyDataJson;
	var x;
	var y;
	historyDataString = JSON.stringify(historyData);
	historyDataJson = historyData.historyData ;	
	var historyYear="{\"year\":[";
	var historyValue="{\"value\":[";
	for(i=0;i<historyDataJson.length;i++){
		historyYear = historyYear + historyDataJson[i].year+",";
		historyValue = historyValue + historyDataJson[i].value+",";
	}
	historyYear = historyYear.substring(0,historyYear.length-1);
	historyValue = historyValue.substring(0,historyValue.length-1);
	historyYear = historyYear + "]}";
	historyValue = historyValue + "]}";
	x = eval("(" + historyYear + ")").year;
	y = eval("(" + historyValue + ")").value;

 var option = {
	        		 title: { 
	        					 text: '石油新增探明地质储量',
	        					 left:'center'
	        				 },
	        		 tooltip: {
	        			 		 trigger: 'axis'
	        		 },
	        		 toolbox:{
	        			 show : true,
		      		   		feature : {
		      		       		saveAsImage : {show: true}
	        		 		}
	        		 },
	        		 xAxis : [
	        			        {
	        			            type : 'category',
	        			            boundaryGap : false,
	        			            name:"年份",
	        			            data : []
	        			        }
	        			    ],
	        			    yAxis : [
	        					        {
	        					            type : 'value',
	        					            name:'万吨'
	        					        }
	        					    ],
	        		 series: [
	        			          {
	        					     type: 'line',
	        					     data: []
	        			          }
	        		          ]
	        		}
	var myChart = echarts.init(document.getElementById("cacheChart"));
 	option.xAxis[0].data = x;
	option.series[0].data = y;	
	myChart.setOption(option);
	$('#test').dialog({
		title : '缓存数据图',
		closed : false,
		cache : false,
		modal : true,
		resizable:true,
		buttons:[{
			text:'确定',
			handler:function(e)
			{close(e);}
		},{
			text:'取消',
			handler:function(e){close(e)}
		}]
	});
}

function close(e){//关闭添加、修改维度信息对话框，清空所填信息
	$('#test ').dialog({
		closed : true,
	});
}
	
</script>
</html>