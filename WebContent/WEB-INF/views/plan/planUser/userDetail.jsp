<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <script type="text/javascript" src="<%=path%>/resource/dist/echarts.js"></script>
	    <script type="text/javascript" src="<%=path%>/resources/stickUp.js"></script>
		<title>${plan.planName }详情</title>
		<style type="text/css">
			.navbox {
            height: 0;
            width: 0;
            top:40px;
            margin:0 10% 20px 80%;
	        }
	        ul.nav {
	            list-style: none;
	            display: block;
	            width: 200px;
	            position: relative;
	            top: 100px;
	            left: 100px;
	            padding: 60px 0 60px 0;
	            background: url(<%=path%>/resources/images/shad2.png) no-repeat;
	            -webkit-background-size: 50% 100%;
	        }
	
	        li {
	            margin: 5px 0 0 0;
	        }
	
	        ul.nav li a {
	            -webkit-transition: all 0.3s ease-out;
	            background: #cbcbcb url(<%=path%>/resources/images/border.png) no-repeat;
	            color: #174867;
	            padding: 7px 15px 7px 15px;
	            -webkit-border-top-right-radius: 10px;
	            -webkit-border-bottom-right-radius: 10px;
	            width: 100px;
	            display: block;
	            text-decoration: none;
	            -webkit-box-shadow: 2px 2px 4px #888;
	        }
	
	        ul.nav li a:hover {
	            background: #ebebeb url(<%=path%>/resources/images/border.png) no-repeat;
	            color: #67a5cd;
	            padding: 7px 15px 7px 30px;
	        }
	        
	        /*表格样式  */
	        th {
            background: #7bbafc;
            color: #fff;
            line-height: 20px;
            height: 30px;
	        }
	        td {
	            padding: 6px 11px;
	            border-bottom: 1px solid #95bce2;
	            vertical-align: top;
	            text-align: center;
	        }
	        td * {
	            padding: 6px 11px;
	        }
	
	        tr.alt td {
	            background: #ecf6fc;
	        }
	
	        tr.over td {
	            background: #bcd4ec;
	        }
		</style>
	</head>
<body>
	<!-- 头部 -->
	<div id="thisHead" style="height:40%">

	<!-- <div style="width:100%"> -->
		<div align="center"><span style="font-size:24px;font-family:微软雅黑">规划概览</span></div>
		<div style="width:50%;float:left">
			<div>
				<textarea class="inputs1" style="display: none;">${plan.indexDataInPlanYear }</textarea>
				<div class="charts1" style="height: 300px;width: 100%;" align="center"></div>
			</div>
		</div>
		<div style="width:30%;float:right;margin-right:100px;font-size:15px;overflow:auto">
			<h3 align="center">概述</h3>
			<p>"十二五"规划是从2011年到2015年。“规划的简短描述”：全国“十二五”油气资源勘探开发规划是由国家发改委、国家能源局共同发布的关于我国油气资源勘探
				开发规划的文件，文件基于“十一五”油气资源勘探开发规划的完成情况，结合当前油气资源勘探开发的背景，对“十二五”期间油气资源勘探开发面临的形式进行了评估，
				对油气资源勘探开发的目标进行了规划。
			</p>
		</div>
	</div> 
	
	<!-- 导航 -->
	<div class="navbox">
        <ul class="nav">
            <li><a href="#description">规划背景</a></li>
            <li><a href="#target">规划目标</a></li>
            <li><a href="#tarAndFin">规划总体情况</a></li>
            <li><a href="#storage">油气储量</a></li>
            <li><a href="#output">油气产量</a></li>
            <li><a href="#thisHead">回到顶部</a></li>
        </ul>
    </div>
	<!-- 规划背景 -->
	<div id="description">
		<div style="width: 100%">
			<div style="text-align: center;">
				<h1>规划背景</h1>
			</div>
			<script id="container" name="planDescription"  type="text/plain" style="height:auto;">${plan.planDescription}</script>
			<!-- 配置文件 -->
			<script type="text/javascript" src="<%=request.getContextPath()%>/assets/ueditor/ueditor.config.js"></script>
			<!-- 编辑器源码文件 -->
			<script type="text/javascript" src="<%=request.getContextPath()%>/assets/ueditor/ueditor.all.js"></script>
			<!-- 实例化编辑器 -->
			<script type="text/javascript">
				var ue=UE.getEditor('container', {
					toolbars:[],
					wordCount:false,
					elementPathEnabled:false,
					readOnly:true
				});
			</script>
		</div>
	</div>
	<!-- 规划目标 -->
	<div id="target" style="width: 100%">
		<div style="text-align: center;">
			<h1>规划目标</h1>
		</div>
		<div>		
			<textarea class="targetInputs" style="display: none;">${plan.tenHistoryIndexData }</textarea>
			<c:set var="temp3" value="0"></c:set>
			<c:forEach items="${plan.indexs }" var="item" varStatus="sta">
				<c:if test="${item.track }">
					<c:if test="${temp3%2==0 }">
						<div style="width: 50%;float: left;">
							<div class="targetCharts" style="height:300px;width: 550px;align:center;"></div>
						</div>
					</c:if>
					<c:if test="${temp3%2==1 }">
						<div style="width: 50%;float: right;">
							<div class="targetCharts" style="height:300px;width: 550px;align:center;"></div>
						</div>
					</c:if>
					<c:set var="temp3" value="${temp3+1 }"/>
				</c:if>
			</c:forEach>
			<c:if test="${temp3%2==1 }">
				<div style="width: 50%;float: right;">
					<div class="targetCharts" style="height:300px;width: 550px;align:center;"></div>
				</div>
			</c:if>
		</div>
	</div>
	
	<!-- 规划目标和总体情况 -->
	<div id="tarAndFin" style="width: 100%">
	<textarea class="inputs3" style="display: none;">${plan.allHistoryIndexData }</textarea>
		<div style="text-align: center;">
			<h1>规划目标和总体情况</h1>			
		</div>
		<div style="width: 80%;margin-left: 10%;margin-bottom: 20px;">
			<p>${plan.targetAndFinished }
		</div>
	</div>
	
	<!-- 油气储量总体情况 -->
	<div id="storage" style="width: 100%">
		<div style="text-align: center;">
			<h1>油气储量总体情况</h1>
			<div style="width: 80%;margin-left: 10%;margin-bottom: 20px;">
				<p>${plan.storageDescription }
			</div>
		</div>
		<c:set var="temp1" value="0"></c:set>
		<c:forEach items="${plan.orderedPlan_Index}" var="item" varStatus="status">
			<c:if test="${item.index.indexType=='新增探明地质储量'&&item.index.track}">
			<c:set var="temp1" value="${temp1+1 }"/>
				<div>
					<div>  					    		
		    			<h2>&nbsp;&nbsp;${temp1 }、${item.index.indexName }</h2>
			    		<div style="width: 50%;float: left;"> 
							<div class="storageCharts" style="height:300px;width:600px;" align="center">	
								
							</div> 
						</div>								
						<div style="width: 20%;float: left;"> 
							<div style="height:300px;width:100%" align="center">	
								<div>
									<button></button>
								</div>
							    <table class='table_1'
							    	   id="table_1${status.index}"
							           data-toggle="table_1${status.index}" 
							           data-height="300">
							        <thead>
							        </thead>
							    </table>
							</div>
						</div>									
						<div style="width: 20%;float: right;margin-right: 50px;"> 
							<div style="height:300px;" align="center">
							${item.indexPerformance}
							</div> 
						</div>								
					</div>
				</div><!-- /row -->
				<hr style="width:100%">
			</c:if>
		</c:forEach>
	</div>
	
	<!-- 油气产量总体情况 -->
	<div id="output" style="width: 100%">
		<div style="text-align: center;">
			<h1>油气产量总体情况</h1>
			<div style="width: 80%;margin-left: 10%;margin-bottom: 20px;">
				<p>${plan.outputDescription }
			</div>
		</div>
		<c:set var="temp2" value="0"></c:set>
		<c:forEach items="${plan.orderedPlan_Index}" var="item" varStatus="status">
			<c:if test="${item.index.indexType=='产量'&&item.index.track}">
			<c:set var="temp2" value="${temp2+1 }"/>
				<div>
					<div>  					    		
		    			<h2>&nbsp;&nbsp;${temp2 }、${item.index.indexName }</h2>
			    		<div style="width: 50%;float: left;"> 
							<div class="outputCharts" style="height:300px;width:600px;" align="center">	
								
							</div> 
						</div>								
						<div style="width: 30%;float: left;"> 
							<div style="height:300px;width:100%" align="center">
							    <table class='table_2'
							    	   id="table_2${status.index}"
							           data-toggle="table_2${status.index}" 
							           data-height="300">
							        <thead>
							        </thead>
							    </table>
							</div>	
						</div>									
						<div style="width: 20%;float: right;"> 
							<div style="height:300px;" align="center">
							${item.indexPerformance}
							</div> 
						</div>								
					</div>
				</div><!-- /row -->
				<hr style="width:100%">
			</c:if>
		</c:forEach>
	</div>
	
	<script type="text/javascript">
		
		/*侧边栏停靠  */
		jQuery(function($) {
	        $(document).ready( function() {
	            $('.navbox').stickUp();	            	            
	        });
	    });		
		
		
		
		var startYear='${plan.startTime}';
		var endYear='${plan.endTime}';
		startYear=startYear.substring(0,4);
		endYear=endYear.substring(0,4);
		var planType='${plan.planType}';
		
		/*规划每年完成情况  */	
		var option = {
			 title: {
	           text: '规划每年完成情况',
	           x:'center',
	           y:'top'
	       },
		   tooltip : {
		       trigger: 'axis',
		       axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		           type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		       }
		   },
		   legend: {
			 data:[],
			 x:'center',
		     y:'top'
		   },
		   toolbox: {
		       show : true,
		       feature : {
		           saveAsImage : {show: true},
		           dataView : {show: true, readOnly: false}
		       }
		   },
		    grid: {
		       x: '150px',
		       x2:'50px'
		    
		   }, 
		   xAxis:  {
		       type: 'value',
		       axisLabel: {
		      	 show: true,
		      	 interval: 'auto',
		      	 formatter: '{value} %'
		      	 }
		   },
		   yAxis: {
		       type: 'category',
		       data: [],
		       show:true
		   },
		   series: []
		};
		
		/*规划目标  */
		var option1 = {
        title: {
            text: '',
            x: 'center',            
            y: 'top'
        },
       
        legend: {
        	show:false,
            data:['历史数据'],
            x:'right',
            y:'top'
        },
        xAxis: {
            data: [],
        	name:'年份'
        },
        yAxis: {
        	name:''     	
        },
        series: [
	                 {
		        		itemStyle: 
		        		{
		        			normal: 
		        			{
		        				color:function(params){
		        					if(params.dataIndex==option1.xAxis.data.length-1)
		        						return '#FF0000';
		        					else
		        						return '#00FF00';
		        				},
		        				label : 
		        				{
		        					show:true
		        				}
		       					
		        	        }
	                 },
		
		            name: '历史数据',
		            type: 'bar',
		            data: []
        			  }
	           ]
    	};
		
		
		require.config({
			paths:{
				echarts:'<%=request.getContextPath()%>/resource/dist'
			}
		});
		
		require(
			[
			 	'echarts',
			 	'echarts/chart/bar',
			 	'echarts/chart/line'
			 ],
			 function (ec){
				/*规划完成情况  */
				var myCharts = ec.init($(".charts1")[0]);		
				var data = $(".inputs1")[0].value; 
				var obj = eval("(" + data + ")");
			
				var tempLegend = "{\"legend\":['',";
			 	var tempYdata = "{\"yData\":[";
	        	var tempSeries = "{\"series\":["
					for(var j=0;j<obj.length;j++)
							{
								tempYdata = tempYdata + "'"+obj[j].indexName+"',";
							}
		        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	
		        		tempLegend = tempLegend +obj[0].year + "]}";
		        	for(var ii=0;ii<obj[0].year.length;ii++)
		        		{
							tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:false, position: 'insideRight',textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:"+ obj[0].year[ii]+",data:[";
							for(var l=0;l<obj.length;l++)
								{
								tempSeries = tempSeries + (obj[l].value[ii]/obj[l].indexValue*100).toFixed(1)+","
								}
							tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]},"
						}
					tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
				
				var obj1 = eval("(" + tempLegend + ")");
				var obj2 = eval("(" + tempYdata + ")");
				var obj3 = eval("(" + tempSeries + ")");
				option.legend.data = obj1.legend;
				option.yAxis.data = obj2.yData;
				option.series = obj3.series;
			 	myCharts.setOption(option);
			 	
			 	/*规划目标  */			 					
				var $targetCharts=$('.targetCharts');
				var targetData=$('.targetInputs')[0].value;
				var targetObj=eval("("+targetData+")");
				
				var targetChart;
				for(var jj=0;jj<targetObj.length;jj++){
				   targetChart=ec.init($targetCharts[jj]);
				   option1.yAxis.name = targetObj[jj].indexUnit;
				   option1.title.text = '历史'+targetObj[jj].indexName+'及规划目标';
				   option1.xAxis.data = targetObj[jj].year;
				   option1.series[0].data = targetObj[jj].value;
				   targetChart.setOption(option1);
				}
				
				/*油气储量、产量  */
				var $storageCharts=$('.storageCharts');
				var $outputCharts=$('.outputCharts');
				var $storageData=$('.inputs3')[0].value;
				var storageObj=eval("("+$storageData+")");
				
				var storageCharts;
				var outputCharts;
				var m=0,n=0;
				var rows;
				var $table1=$('.table_1');
				var $table2=$('.table_2');
				var tableshow;
				var tableId;
				for(var kk=0;kk<storageObj.length;kk++){
					var firstIndex=1000;
					for(i=0;i<storageObj[kk].year.length;i++){
						if(storageObj[kk].year[i]==startYear){
							firstIndex=i;
						}
					}
					/*油气储量 、产量总体情况 */
					var option2 = {
							title:{
								text: '',
					            x: 'center',            
					            y: 'top'
							},
						    tooltip : {
						        trigger: 'axis'
						    },
						    toolbox:{
						    	show:true,
						    	feature:{
						    		saveAsImage:{show:true}
						    	}
						    },
						    /* dataZoom : {
						        show : true,
						        realtime : true,
						        end : 100
						    }, */
						    xAxis : [
						        {
						            type : 'category',
						            name:'年份',
						            data : []
						        }
						    ],
						    yAxis : [
						        {
						        	name:'',
						            type : 'value'
						        }
						    		],
						    series : [
						        {
						            type:'bar',
						            data:[],
						            itemStyle:{
						            	normal:{
						            		color:function(params){
						            			if(params.dataIndex>=firstIndex)
						            				return '#FF0000';
						            			else
						            				return '#00FF00';
						            		},
						            		lable:{
						            			show:true
						            		}
						            	}
						            },
						            markLine:{
						            	itemStyle:{
						            		normal:{
						            			color:'#0000FF'
						            		}
						            	},
						            	color:'#FF0000',
						            	data:[
						            	      [
						            	       	{name:'规划目标值',value:0,xAxis:-1,yAxis:0},
						            	       	{xAxis:20,yAxis:0}
						            	       ]
						            	      ]
						            }
						        }  
						    		] 
						    };
					
					var targetValue=(storageObj[kk].indexValue/(endYear-startYear+1)).toFixed(1);
					var yMax=targetValue;
					for(var m1=0;m1<storageObj[kk].length;m1++){
						if(yMax<storageObj[kk].value[m1]){
							yMax=storageObj[kk].value[m1];
						}
					}
					var hasFinished=0;
					columns=[],datas=[];
					option2.title.text=storageObj[kk].indexName;
					option2.yAxis[0].name=storageObj[kk].indexUnit;
					option2.yAxis[0].max=yMax;
					option2.xAxis[0].data=storageObj[kk].year;
					option2.series[0].data=storageObj[kk].value;
					option2.series[0].markLine.data[0][0].value=targetValue;
					option2.series[0].markLine.data[0][0].yAxis=targetValue;
					option2.series[0].markLine.data[0][1].yAxis=targetValue;
					columns.push({
						field:'field0',
						title:'年份'
					});
					columns.push({
						field:'field1',
						title:'完成('+storageObj[kk].indexUnit+')'
					});
					columns.push({
						field:'field2',
						title:'比例'
					});
					/* option2.dataZoom.start=0; */
					if(storageObj[kk].indexType=='新增探明地质储量'){
						storageCharts=ec.init($storageCharts[m]);
						
						//填充表格数据
						for(var ll=0;ll<storageObj[kk].year.length;ll++){
							if(storageObj[kk].year[ll]>=startYear&&storageObj[kk].year[ll]<=endYear){
								row={};
								hasFinished=hasFinished+storageObj[kk].value[ll];
								row['field0']=storageObj[kk].year[ll];
								row['field1']=storageObj[kk].value[ll].toFixed(2);
								row['field2']=(storageObj[kk].value[ll]/storageObj[kk].indexValue*100).toFixed(1)+'%';
								datas.push(row);
							}
							if(ll==storageObj[kk].year.length-1){
								row={};
								row['field0']='合计';
								row['field1']=hasFinished.toFixed(2);
								row['field2']=(hasFinished/storageObj[kk].indexValue*100).toFixed(1)+'%';
								datas.push(row);
							}
						}
						
						var id=$('.table_1')[m].id;
						$('#'+id).append("<tr><td>年份</td><td>完成量("+storageObj[kk].indexUnit+")</td><td>完成百分比</td>");
						for(var excel=0;excel<datas.length;excel++){
							$('#'+id).append("<tr><td>"+datas[excel].field0+"</td><td>"+
									datas[excel].field1+"</td><td>"+datas[excel].field2+
									"</td></tr>")
						}
						
						m=m+1;
						storageCharts.setOption(option2);						
					}
					/* if(storageObj[kk].indexType=='产量'){
						storageCharts=ec.init($outputCharts[n]);
						n=n+1;
						//outputCharts.setOption(option2);						
					} */
				}
			}
		);
		
	</script>
</body>
</html>