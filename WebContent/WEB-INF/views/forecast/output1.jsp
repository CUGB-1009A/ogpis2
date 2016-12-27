<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产量预测--new</title>
	<script type="text/javascript" src="<%=path%>/js/sz/fillReportData.js"></script>
	<style type="text/css">
		a{ text-decoration: none;}
		a:hover{txt-decoration:underline;} 
	</style>
</head>
<body>
<div style="width:30%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			<select name="mineType" id="mineType" onchange="dataCollectionChanged()">
				<c:forEach items="${dataCollectionList}" var="item">
					<option value="${item.id}">${item.dataCollectionName}</option>
				</c:forEach>
			</select><br>
		</div>
	</div>
</div>
<div style="width:40%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px;float:left">
			我的数据集：<br>
			<div id="unshared" style="width:100%;height:50%;float:left">
				未共享：<br>
					<c:forEach items="${selfDataCollection}" var="item">
								<c:if test="${!item.shared}">
									<span id="${item.id}"><a href="javascript:selfDataShow('${item.id}')">${item.dataCollectionName}</a>
									<button onclick="share('${item.id}')">共享</button>
									<button onclick="deleteUnshared('${item.id}')">删除</button><br></span>
								</c:if>
					</c:forEach>
			</div>
			<div id="shared" style="width:100%;height:50%;float:left">
				已共享：<br>
					<c:forEach items="${selfDataCollection}" var="item">
							<c:if test="${item.shared}">
							<span id="${item.id}">
								<a href="javascript:selfDataShow('${item.id}')">${item.dataCollectionName}</a><button onclick="disshare('${item.id}')">取消共享</button><br></span>
							</c:if>
					</c:forEach>
			</div>
		</div>
	</div>
</div>
<div style="width:30%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			共享数据集:<br>
				<c:forEach items="${otherDataCollection}" var="item">
						<a href="javascript:selfDataShow('${item.id}')">${item.dataCollectionName}</a><br>
				</c:forEach>
		</div>
	</div>
</div>

<div style="width:30%;height:60%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			<script type="text/javascript">
				insertReport('AF', "");
			</script>
		</div>	
	</div>
</div>

<div style="width:70%;height:60%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			<div id="historyDataChart" style="width:100%;height:100%;">
			
			</div>
		</div>
	</div>
</div>
<div>
<button onclick="testSupcan()">测试硕正报表</button>
</div>
</body>
<script type="text/javascript">
function testSupcan(){
	AF.func("DeleteRows", "3 \r\t 1")
}
/* 
 * 此页面的全局变量 
 historyData:从后台传过来的数据  "historyData": [{"year": 1949,"value": 12},{"year": 1950, "value": 20},{"year": 1951,"value": 31}]
 historyData:填充硕正报表的数据，historyData=JSON.stringify(historyData);
 historyDataJson:画图用的数据源，historyData.historyData
 x:画图的横轴的年份值[1949,1950,1951]
 y:画图的纵轴的完成值[1,2,3]
 myChart:历史数据展示曲线图
 option:画图的option
 */
var historyData;
var historyDataString;
var historyDataJson;
var x;
var y;
var myChart = echarts.init(document.getElementById("historyDataChart"));
var option = {
		 title: { 
					 text: '石油产量',
					 left:'center'
				 },
		 tooltip: {
			 		 trigger: 'axis'
		 },
		 toolbox: {
		   show : true,
		   feature : {
		       saveAsImage : {show: true},
		       myButtons1:{//自定义按钮，将图中显示的数据保存到库里作为我的数据  
		                      show:true,//是否显示    
		                      title:'保存为我的数据集', //鼠标移动上去显示的文字    
		                      icon:'image://<%=path%>/image/icon/save.png',
		                      option:{},    
		                      onclick:function(option1) {
		                       var name = prompt("请输入数据集名", ""); 
							   if(name){
								  $.ajax({
						    			url:"<%=path%>/forecast/saveSelfDataCollection",
						    			dataType:"json",
						    			async:true,
						    			data:{
						    				"selfDataCollectionName":encodeURIComponent(name),
						    				"year":option1.option.xAxis[0].data+"",
						    				"value":option1.option.series[0].data+""
						    				},
						    			type:"GET",
						    			success:function(result){
						    				$("#unshared").append("<span id='"+result.id+"'><a href=\"javascript:selfDataShow('"+result.id+"')\">"+name+"</a><button onclick=share('"+result.id+"')>共享</button><button onclick=deleteUnshared('"+result.id+"')>删除</button><br></span>");
						    				alert("保存数据成功");
						    			},
						    			error:function(){
						    				alert("保存数据失败");
						    			}
						    		});
							     }
			    	         }    
			               },
			   myButtons2:{//自定义按钮，根据硕正报表数据刷新echarts图 
		                      show:true,//是否显示    
		                      title:'刷新图数据',  
		                      icon:'image://<%=path%>/image/icon/refresh.jpg',
		                      option:{},    
		                      onclick:function(option1) {
									
		                            }    
				           }
		       
		      
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

function Chart2Report(){//将
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
}

function share(id){//共享我的数据集
	 $.ajax({
			url:"<%=path%>/dataShow/dataShare",
			dataType:"json",
			async:true,
			data:{
				"id":id
				},
			type:"GET",
			success:function(result){
				$("#"+result.selfDataCollectionId).remove();
				$("#shared").append("<span id='"+result.selfDataCollectionId+"'><a href=\"javascript:selfDataShow('"+result.selfDataCollectionId+"')\">"+result.selfDataCollectionName+"</a><button onclick=disshare('"+result.selfDataCollectionId+"')>取消共享</button><br></span>");
				alert("共享成功");
			},
			error:function(){
				alert("共享数据失败");
			}
		});
}

function disshare(id){//取消共享我的数据集
	 $.ajax({
			url:"<%=path%>/dataShow/dataDisshare",
			dataType:"json",
			async:true,
			data:{
				"id":id
				},
			type:"GET",
			success:function(result){
				$("#"+result.selfDataCollectionId).remove();
				$("#unshared").append("<span id='"+result.selfDataCollectionId+"'><a href=\"javascript:selfDataShow('"+result.selfDataCollectionId+"')\">"+result.selfDataCollectionName+"</a><button onclick=share('"+result.selfDataCollectionId+"')>共享</button><button onclick=deleteUnshared('"+result.selfDataCollectionId+"')>删除</button><br></span>");
				alert("取消共享成功");
			},
			error:function(){
				alert("取消共享数据失败");
			}
		});
}

function deleteUnshared(id){//删除未共享的数据集
	 $.ajax({
			url:"<%=path%>/dataShow/deleteUnshared",
			dataType:"json",
			async:true,
			data:{
				"id":id
				},
			type:"GET",
			success:function(result){
				$("#"+result.selfDataCollectionId).remove();
				alert("删除成功");
			},
			error:function(){
				alert("删除失败");
			}
		});
}

function selfDataShow(id){//显示自定义数据，包括我的数据集和他人共享数据集
	$.ajax({
		url:"<%=path%>/dataShow/selfDataShow",
		dataType:"json",
		async:true,
		data:{
			"id":id
			},
		type:"GET",
		success:function(result){
			historyData = result;
			Chart2Report();
			fillReportData('AF','全国石油产量','unit',historyDataString);
			option.xAxis[0].data = x;
			option.series[0].data = y;	
			myChart.setOption(option);
		},
		error:function(){
			alert("数据集不符合格式要求，查看失败");
		}
	});
}

$(function(){//首次进入
	historyData = ${historyData};
	Chart2Report();
	option.xAxis[0].data = x;
	option.series[0].data = y;	
	myChart.setOption(option);
});


function OnReady(id){	
	window[id].func("Build", "<%=request.getContextPath()%>/sz/historyData.xml");
	var unit = '万吨';
	if(id=='AF')
	fillReportData(id,'全国石油产量',unit,historyDataString);
} 

function OnEvent(id,Event,p1,p2){
	var data;//画图所用的数据
	if(Event=='RowDeleted'||Event=='ColInserted'){//删除列表行后响应时间
		var supcanDataXML = AF.func("GetChangedXML", "");	
	    var totalRows = AF.func("GetRows", "");
	    var totalCols = AF.func("GetCols", "");
	alert(supcanDataXML)
	alert(totalRows+"---"+totalCols);
	}
} 
 window.onresize = function(){
	var bodyWidth = document.body.clientWidth;
	var bodyHeight = document.body.clientHeight;
	$("#historyDataChart").css('width',Math.floor(bodyWidth*0.7));
	$("#historyDataChart").css('height',Math.floor(bodyHeight*0.6));
} 

</script>
</html>