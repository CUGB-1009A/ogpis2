<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>123</title>

<script type="text/javascript" src="<%=path%>/Echarts2/dist/echarts.js"></script>
 
</head>
<body>

	<div style="width:80%;height:50%;">	1232	
		<div id="historyDataChart" style="width:200px;height:200px;float:left">
			
		</div>
	</div>
<script type="text/javascript">
 
	var option = {
		    title : {
		        text: '石油产量历史数据',
		        subtext: '随机的'
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['历史数据']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [1,2,3]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'历史数据',
		            type:'line',
		            data:[1,2,3]
		        }
		    ]
		};
	        require.config({
	            paths: {
	                echarts: '<%=path%>/Echarts2/dist'
	            }
	        });
	        require(
	            [
	                'echarts',
	                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
	                'echarts/chart/bar'
	            ],
	            function (ec) {
	            	var myHistoryChart = ec.init($("#historyDataChart")[0]);
	
	            	//图表使用-------------------
	            		myHistoryChart.setOption(option);
	            });




</script>
</body>
</html>