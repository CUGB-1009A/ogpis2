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
	<div id="tt" class="easyui-tabs" style="width:100%;height:100%;">   
	    <div title="数据预处理" style="padding:20px;display:none;width:100%;height:100%;">   
	            <%@ include file="dataCollection.jsp"%>	
	    </div>   
	    <div title="模型选择" data-options="closable:false" style="overflow:auto;padding:20px;display:none;">   
	       		<%@ include file="modelInfo.jsp"%>  
	    </div>   
	    <div title="预测结果" data-options="closable:false" style="padding:20px;display:none;">   
	       		<%@ include file="predictResult.jsp"%>  
	    </div>   
	</div> 
</body>
<script type="text/javascript">
function testSupcan(){
	AF.func("DeleteRows", "3 \r\t 1")
}
/* 
 **********此页面的全局变量**********
 historyData:从后台传过来的数据  "historyData": [{"year": 1949,"value": 12},{"year": 1950, "value": 20},{"year": 1951,"value": 31}]
 historyData:填充硕正报表的数据，historyData=JSON.stringify(historyData);
 historyDataJson:画图用的数据源，historyData.historyData
 x:画图的横轴的年份值[1949,1950,1951]
 y:画图的纵轴的完成值[1,2,3]
 myChart:历史数据展示曲线图
 option:画图的option
 */
var dataCollectionId ;//图标显示的数据集的id
var historyData;
var historyDataString;
var historyDataJson;
var x;
var y;
var myChart;
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
								   console.log(option1.option.dataCollectionId)
								  $.ajax({
						    			url:"<%=path%>/forecast/saveSelfDataCollection",
						    			dataType:"json",
						    			async:true,
						    			data:{
						    				"dataCollectionName":encodeURIComponent(name),
						    				"year":option1.option.xAxis[0].data+"",
						    				"value":option1.option.series[0].data+"",
						    				"dataCollectionId":option1.option.dataCollectionId
						    				},
						    			type:"GET",
						    			success:function(result){
						    				$("#unshared").append("<span id='"+result.id+"'><a href=\"javascript:dataShow('"+result.id+"')\">"+name+"</a><button onclick=share('"+result.id+"')>共享</button><button onclick=deleteUnshared('"+result.id+"')>删除</button><br></span>");
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
		          ],
		 dataCollectionId:''
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
				$("#"+result.dataCollectionId).remove();
				$("#shared").append("<span id='"+result.dataCollectionId+"'><a href=\"javascript:dataShow('"+result.dataCollectionId+"')\">"+result.dataCollectionName+"</a><button onclick=disshare('"+result.dataCollectionId+"')>取消共享</button><br></span>");
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
				$("#"+result.dataCollectionId).remove();
				$("#unshared").append("<span id='"+result.dataCollectionId+"'><a href=\"javascript:dataShow('"+result.dataCollectionId+"')\">"+result.dataCollectionName+"</a><button onclick=share('"+result.dataCollectionId+"')>共享</button><button onclick=deleteUnshared('"+result.dataCollectionId+"')>删除</button><br></span>");
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
				$("#"+result.dataCollectionId).remove();
				alert("删除成功");
			},
			error:function(){
				alert("删除失败");
			}
		});
}

function dataShow(id){//显示自定义数据，包括我的数据集和他人共享数据集
	$.ajax({
		url:"<%=path%>/dataShow/dataShow",
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
			option.dataCollectionId = id;
			myChart.setOption(option);
		},
		error:function(){
			alert("数据集不符合格式要求，查看失败");
		}
	});
}

$(function(){//首次进入
	dataCollectionId = ${dataCollectionId};
	historyData = ${historyData};
	Chart2Report();
	myChart = echarts.init(document.getElementById("historyDataChart"))
	option.xAxis[0].data = x;
	option.series[0].data = y;	
	option.dataCollectionId = dataCollectionId;
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


/* var resizeContainer = function(){
	var bodyWidth = document.body.clientWidth; //设置echarts容器宽度与高度
	var bodyHeight = document.body.clientHeight;
	myDiv.style.width = Math.floor(bodyWidth*0.7)+'px';
	myDiv.style.height = Math.floor(bodyHeight*0.6)+'px';
} */

/* window.onresize = function(){
	resizeContainer();
	myChart.resize;
} */


/*
 * 第二个模型选择页面的事件处理函数
 */
 $(function(){
	 $("input[name='modelId']").change(function(){
		 var id = $("input[name='modelId']:checked").val();//选中的模型id 
		 $.ajax({
				url:"<%=path%>/model/modelChanged",
				dataType:"json",
				async:true,
				data:{
					"id":id
					},
				type:"GET", 
				success:function(result){
					$('#pemList').datagrid('loadData',result.pemList);  
					UE.getEditor('container').setContent(result.modelDescription);
				},
				error:function(){
					alert("模型查看失败");
				}
			});   
	 });
	   });

 
</script>
</html>