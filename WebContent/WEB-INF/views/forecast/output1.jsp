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
			原始数据集：<br>
			<c:forEach items="${dataCollectionList}" var="item">
						<a href="">${item.dataCollectionName}</a><br>
			</c:forEach>
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
								<a href="">${item.dataCollectionName}</a><button onclick="disshare('${item.id}')">取消共享</button><br></span>
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
						<a href="">${item.dataCollectionName}</a><br>
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
	
		
		

<script type="text/javascript">
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
				$("#shared").append("<span id='"+result.selfDataCollectionId+"'><a href=''>"+result.selfDataCollectionName+"</a><button onclick=disshare('"+result.selfDataCollectionId+"')>取消共享</button><br></span>");
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
				$("#unshared").append("<span id='"+result.selfDataCollectionId+"'><a href=''>"+result.selfDataCollectionName+"</a><button onclick=share('"+result.selfDataCollectionId+"')>共享</button><button onclick=deleteUnshared('"+result.selfDataCollectionId+"')>删除</button><br></span>");
				alert("取消共享成功");
			},
			error:function(){
				alert("取消共享数据失败");
			}
		});
}

function deleteUnshared(id){
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

var historyData = ${historyData};//object格式的历史数据，不变的
var historyDataString = JSON.stringify(historyData);
var historyDataJson = historyData.historyData ;

function OnReady(id){	
	window[id].func("Build", "<%=request.getContextPath()%>/sz/historyData.xml");
	var unit = '万吨';
	if(id=='AF')
	fillReportData(id,'全国石油产量',unit,historyDataString);
} 

var myChart = echarts.init(document.getElementById("historyDataChart"));
//解析historyDataJson:将{["year":1949,"value":1],["year":1950,"value":2],["year":1951,"value":3]}
//                        ||
//         解析为{"year":[1949,1950,1951],"value":[1,2,3]}
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
var x = eval("(" + historyYear + ")").year;
var y = eval("(" + historyValue + ")").value;

var option = {
 title: { 
			 text: '全国石油产量',
			 left:'center'
		 },
 tooltip: {
	 		 trigger: 'axis'
 },
 toolbox: {
   show : true,
   feature : {
       saveAsImage : {show: true},
       myButtons:{//自定义按钮 danielinbiti,这里增加，selfbuttons可以随便取名字    
	                      show:true,//是否显示    
	                      title:'保存为我的数据集', //鼠标移动上去显示的文字    
	                      icon:'image://<%=path%>/image/icon/save.png',
	                      option:{},    
	                      onclick:function(option1) {//点击事件,这里的option1是chart的option信息    
	                            var name = prompt("请输入数据集名", ""); 
						   if(name){
							  $.ajax({
					    			url:"<%=path%>/forecast/saveSelfDataCollection",
					    			dataType:"json",
					    			async:true,
					    			data:{
					    				"selfDataCollectionName":name,
					    				"year":option1.option.xAxis[0].data+"",
					    				"value":option1.option.series[0].data+""
					    				},
					    			type:"GET",
					    			success:function(result){
					    				alert(result.result)
					    			},
					    			error:function(){
					    				alert("保存数据失败");
					    			}
					    		});
						   }
		    	  
	                            }    
	                       },
       dataView:{show:true}
      
   }
},
 xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            name:"年份",
	            data : x
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
			     data: y
	          }
          ]
}
myChart.setOption(option);

function OnEvent(id,Event,p1,p2){
	var data;//画图所用的数据
	if(Event=='RowDeleted'){//删除列表行后响应时间
	alert('删除行')
		
	}
	if(Event=='ColInserted'){
		alert('插入行')
	}

} 
 window.onresize = function(){
	var bodyWidth = document.body.clientWidth;
	var bodyHeight = document.body.clientHeight;
	$("#historyDataChart").css('width',Math.floor(bodyWidth*0.7));
	$("#historyDataChart").css('height',Math.floor(bodyHeight*0.6));
} 

</script>
</body>
</html>