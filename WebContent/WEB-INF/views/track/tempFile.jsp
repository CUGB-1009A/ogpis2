<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-layout easyui-panel" data-options="fit:true">
	<div data-options="region:'north',split:true,onResize:panelResize,border:false"
		style="height: 50%;">
		<div id="chart1" style="width: 700px; height: 220px;"></div>
	</div>
	<div data-options="region:'center'">
		<IFRAME width="100%" height="100%" style="border: 0" frameBorder=0
			id=main_top name=main_top src="/ogpis2/track/plan/list"></IFRAME>
		<!-- <div id="chart2" style="width: 700px; height: 220px"></div> -->
	</div>
</div>
<script type="text/javascript">
	var option2 = {
		title : {
			text : '指标跟踪',
			left : 'center'
		},
		tooltip : {
			trigger : 'axis'
		},

		xAxis : [ {
			type : 'value',
			/* boundaryGap : false, */
			axisLabel : {
				show : true,
				interval : 'auto',
				formatter : '{value} %'
			}
		} ],
		yAxis : [ {
			type : 'category',
			data : [ "石油产量", "石油新增探明地质储量", "天然气产量", "天然气新增探明地质储量", "煤层气产量",
					"煤层气新增探明地质储量" ]
		/* name : '万吨' */
		} ],
		grid : { // 控制图的大小，调整下面这些值就可以，
			left : "25%"
		},
		series : [ {
			type : 'bar',
			name : '历史数据',
			data : [ 104.5, 94.3, 83.7, 114.9, 19.3, 43.9 ],
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'right',
						formatter : '{c}%'
					}
				}
			},
		} ]
	}
	function initMyChart(domId,title,options){
		var dom=document.getElementById(domId);
		var chart = echarts.init(dom);
		option2.title.text = title;
		chart.setOption(options);
		dom.chart = chart;
	}
	initMyChart("chart1","规划完成情况",option2);
	function panelResize(width, height) {
		$(this).children("div")[0].style.width = $(this).width();
		$(this).children("div")[0].style.height = $(this).height()-1;
		$(this).children("div")[0].chart.resize();
	};
</script>