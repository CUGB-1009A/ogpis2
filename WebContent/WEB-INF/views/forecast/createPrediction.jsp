<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产量预测--new</title>
	<script type="text/javascript" src="<%=path%>/js/sz/fillReportData.js"></script>
</head>
<body>
<div id="step2" class="easyui-layout" style="width:100%;height:100%;display:none;">   
    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center;">
    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
    	<span style="color:black;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
    	<span style="color:LightGrey;">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
    	<span style="color:LightGrey;">完成</span>
    </div>   
    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
    	<div style="height:20%">
    		<div style="width:40%;height:100%;float:left;">
				<div style="width:100%;height:100%;float:left">
					<div style="padding:10px">
					数据集：
						<select name="mineType" id="mineType" onchange="dataCollectionChanged()">
							<c:forEach items="${dataCollectionList}" var="item">
								<option value="${item.id}">${item.dataCollectionName}</option>
							</c:forEach>
						</select><br>
					</div>
				</div>
			</div>
			<div style="width:40%;height:100%;float:left;">
				<div style="width:100%;height:100%;float:left">
					<div style="padding:10px">
				   时间选择：<br>
						<input class="easyui-slider" style="width:300px" data-options="
							showTip: true,
							range: true,
							value: [60,80],
							rule: [1949,'|',1969,'|',1989,'|',2009,'|',2016]
						">
					</div>
				</div>
			</div>
			<div style="width:20%;height:100%;float:left;">
				<div style="width:100%;height:100%;float:left">
					<div style="padding:10px">
				 		<button>选定</button>
					</div>
				</div>
    		</div>
    	</div> 
    	<div style="height:70%">
    		<div style="width:40%;height:100%;float:left;"><!-- 硕正图 -->
				<div style="width:100%;height:100%;float:left">
					<div style="padding:10px">
					 		<script type="text/javascript">
							insertReport('AF', "Rebar=Main");
						</script>
					</div>
				</div>
    		</div>
    		<div style="width:60%;height:100%;float:left;"><!-- echarts表 -->
				<div id="historyDataChart" style="width:550px;height:300px;">
				</div>
    		</div>
    	</div>
    	<div style="height:10%;text-align:right">
    		<button onclick="toRecordList()">返回列表</button>
    		<button onclick="step2_next()">下一步</button>
    	</div>   
</div>
</div>
	
	<div id="step3" class="easyui-layout" style="width:100%;height:100%;display:none">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center;">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
	    	<div style="height:90%">
				 <div style="width:50%;height:90%;float:left;">
					<div style="width:100%;height:100%;float:left">
						<div style="padding:10px">
							模型列表：<br>
							<table class="easyui-datagrid" style="width:300px;height:150px"
								data-options="url:'',fitColumns:true,singleSelect:true">   
							    <thead>   
							        <tr>   
							            <th data-options="field:'modelChoice',width:50">选择</th>   
							            <th data-options="field:'modelName',width:200">模型名称</th>   
							            <th data-options="field:'modelInfo',width:200,align:'right'">模型信息</th>   
							        </tr>
							        </thead>
							        <tbody id="modelList">  
							        <c:forEach items="${modelInfoList}" var="item" varStatus="status">
										<tr>   
								            <td>
												<input name="modelId" type="radio" value="${item.id}" onclick="modelRadioChanged()" <c:if test="${status.first}">checked</c:if>/>
											</td>   
								            <td>${item.modelName}</td>   
								            <td>${item.modelName}</td>   
							       		</tr>  
									</c:forEach> 
							   </tbody> 
							</table> 
						</div>
						<div style="padding:10px">
							拟合方法列表：<br>
							<table id="pemList" class="easyui-datagrid" style="width:300px;height:150px"
							  data-options="url:'',fitColumns:true,singleSelect:true">   
							    <thead>   
							        <tr>   
							            <th data-options="field:'pemNum',width:50">编号</th>   
							            <th data-options="field:'pemName',width:200">拟合方法名称</th>   
							        </tr> 
						        </thead>
						        <tbody>
							        <c:forEach items="${pemList}" var="item" varStatus="status">
										<tr>   
								            <td>${item.value}</td>   
								            <td>${item.key}</td>   
							       		</tr>  
									</c:forEach> 
							     </tbody>   
							</table> 
						</div>
					</div>
				</div>
				 <div style="width:50%;height:90%;float:left;">
					<div style="width:100%;height:100%;float:left">
						<div style="padding:10px" >
							模型介绍：<br>
							<div class="col-sm-10">
							    <script id="container" name="modelDescription" type="text/plain" style="height:300px">${tempModel.modelDescription}</script>
								<!-- 配置文件 -->
							    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.config.js"></script>
							    <!-- 编辑器源码文件 -->
							    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/ueditor/ueditor.all.js"></script>
							    <!-- 实例化编辑器 -->
							    <script type="text/javascript">
							    var ue = UE.getEditor('container',{
							        	toolbars:[],
							        	wordCount:false, 
							        	initialFrameWidth :500,//设置编辑器宽度
							        	initialFrameHeight:250,//设置编辑器高度
							        	scaleEnabled:true,
						                //关闭elementPath  
						                elementPathEnabled:false,
						                readonly:true
					        			 });
				    			</script>
							</div>
						</div>
					</div>
				</div>
	    	</div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step3_previous()">上一步</button>
	    		<button onclick="step3_next()">下一步</button>
	    	</div>
	 </div>   
</div>
	
	<div id="step4" class="easyui-layout" style="width:100%;height:100%;display:none;">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
	    	<div style="height:20%;">
    			<div style="padding-left:20px;padding-top:10px">
    			二选一：<br>
					<input name="timeChoice" type="radio" value="1" checked/>预测区间：
						<input class="easyui-slider" style="padding-top:20px;width:300px" data-options="
								showTip: true,
								range: true,
								value: [60,80],
								rule: [2015,'|',2020,'|',2025,'|',2030,'|',2035]
							">
				</div>
			</div>
			<div style="height:10%;">
				<div style="padding-left:20px;padding-top:10px">
					<input name="timeChoice" type="radio" value="2"/>长中短：
								<c:forEach items="${periodIntervalList}" var="item" varStatus="status">
									<input name="periodInterval" type="radio" value="${item.periodInterval}"<c:if test="${status.first}">checked</c:if>/>${item.periodName}
								</c:forEach><br>
				</div>
			</div>
			<div style="height:60%">
				<div style="width:30%;height:100%;">
					<div style="width:100%;height:100%;border:1px solid blue;">
						<div style="padding:30px" id="paramDiv">
						参数列表：<br>
							K:<input name="k" type="text" value=""/><br>
							a:<input name="a" type="text" value=""/><br>
							b:<input name="b" type="text" value=""/><br>
						</div>
					</div>
				</div>
			</div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step4_previous()">上一步</button>
	    		<button onclick="predict()">预测</button>
	    	</div>
	    </div>   
	</div>
	
	<div id="step5" class="easyui-layout" style="width:100%;height:100%;display:none;">   
	    <div data-options="region:'north',title:'预测步骤'" style="height:20%;font-size:25px;text-align:center;display:flex;align-items:center;justify-content:center">
	    	<span style="color:LightGrey;">新建预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择和预处理数据&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey;">选择模型&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:LightGrey">预测&nbsp;&nbsp;&rarr;&nbsp;&nbsp;</span>
	    	<span style="color:black;">完成</span>
	    </div>   
	    <div data-options="region:'south',title:'详情显示',collapsible:false" style="height:80%;">
	    	<div style="height:90%">
	    		<div id="forecastDataChart" style="width:1000px;height:400px;">
				</div>
	    	</div>
	    	<div style="height:10%;text-align:right">
	    		<button onclick="step5_previous()">上一步</button>
	    		<button onclick="save()">保存</button>
	    	</div>
	    </div>   
	</div>
</body>
<script type="text/javascript">
function modelRadioChanged(){
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
	
}
		   

function toRecordList(){
	window.location.href = "<%=path%>/forecast/list"
}
function step2_next(){
	$('#step2').css("display","none");
	$('#step3').css("display","");
	$.parser.parse();

}

function step3_previous(){
	$('#step3').css("display","none");
	$('#step2').css("display","");
	$.parser.parse();
}

function step3_next(){
	$('#step3').css("display","none");
	$('#step4').css("display","");
	$.parser.parse();
}

function step4_previous(){
	$('#step4').css("display","none");
	$('#step3').css("display","");
	$.parser.parse();
}

function predict(){
	$('#step4').css("display","none");
	$('#step5').css("display","");
	$.parser.parse();
}

function step5_previous(){
	$('#step5').css("display","none");
	$('#step4').css("display","");
	$.parser.parse();
}

function save(){
	
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
	        var forecastData;
	        var historyDataString;
	        var forecastDataString
	        var historyDataJson;
	        var forecastDataJson;
	        var x;
	        var x1;
	        var y;
	        var y1;
	        var myChart = echarts.init(document.getElementById("historyDataChart"));
	        var myChart1 = echarts.init(document.getElementById("forecastDataChart"));
	        
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
	        
	        var option1 = {
	        		 title: { 
	        					 text: '石油产量',
	        					 left:'center'
	        				 },
	        		 tooltip: {
	        			 		 trigger: 'axis'
	        		 },
	        		  legend: {
	        		        data:['历史数据','预测数据'],
	        		        right:'right'
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
	        					     name:'历史数据',
	        					     data: []
	        			          },
	        			          {
	        			        	  type: 'line',
		        					  name:'预测数据',
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
	        	
	        	forecastDataString = JSON.stringify(forecastData);
	        	forecastDataJson = forecastData.forecastData ;	
	        	var forecastYear="{\"year\":[";
	        	var forecastValue="{\"value\":[";
	        	for(i=0;i<forecastDataJson.length;i++){
	        		forecastYear = forecastYear + forecastDataJson[i].year+",";
	        		forecastValue = forecastValue + forecastDataJson[i].value+",";
	        	}
	        	forecastYear = forecastYear.substring(0,forecastYear.length-1);
	        	forecastValue = forecastValue.substring(0,forecastValue.length-1);
	        	forecastYear = forecastYear + "]}";
	        	forecastValue = forecastValue + "]}";
	        	x1 = eval("(" + forecastYear + ")").year;
	        	y1 = eval("(" + forecastValue + ")").value;
	        }

	        $(function(){//首次进入
	        	historyData = ${historyData};
	        	forecastData = ${forecastData}
	        	Chart2Report();
	        	option.xAxis[0].data = x;
	        	option.series[0].data = y;	
	        	option1.xAxis[0].data = x1;
	        	option1.series[0].data = y;
	        	option1.series[1].data = y1;
	        	myChart.setOption(option);
	        	myChart1.setOption(option1);
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
	        	}
	        } 
	     /*     window.onresize = function(){
	        	var bodyWidth = document.body.clientWidth;
	        	var bodyHeight = document.body.clientHeight;
	        	$("#historyDataChart").css('width',Math.floor(bodyWidth*0.7));
	        	$("#historyDataChart").css('height',Math.floor(bodyHeight*0.6));
	        }  */

	var step = ${step} ;
	$('#step'+step).css("display",""); //首次进入，控制需要显示的div
	
	
</script>
</html>