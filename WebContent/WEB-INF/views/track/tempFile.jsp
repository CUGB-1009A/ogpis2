<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-layout easyui-panel" data-options="fit:true">
	<div data-options="region:'north',split:true,onResize:panelResize"
		style="height: 50%;">
		<div id="chart1" style="width: 700px; height: 220px"></div>
	</div>
	<div data-options="region:'center'">
		<IFRAME width="100%" height="100%" style="border:0" frameBorder=0 id=main_top
			name=main_top src="/ogpis2/plan2/list"></IFRAME>
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
			type : 'category',
			boundaryGap : false,
			name : "年份",
			data : [ 2001, 2002, 2003, 2004, 2005, 2006 ]
		} ],
		yAxis : [ {
			type : 'value',
			name : '万吨'
		} ],
		series : [ {
			type : 'line',
			name : '历史数据',
			data : [ 1215, 8545, 5442, 78854, 4564, 4788 ]
		} ]
	}
	
	var myChart12 = echarts.init(document.getElementById("chart1"));
	option2.title.text="规划完成情况";
	myChart12.setOption(option2);
	document.getElementById("chart1").chart=myChart12;
	/* var myChart22 = echarts.init(document.getElementById("chart2"));
	option2.title.text="石油产量";
	myChart22.setOption(option2);
	document.getElementById("chart2").chart=myChart22; */
	function panelResize(width,height) {
		$(this).children("div")[0].style.width=width-20;
		$(this).children("div")[0].style.height=height-20;
		$(this).children("div")[0].chart.resize();
	};
</script>