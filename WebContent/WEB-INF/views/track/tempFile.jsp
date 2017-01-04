<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',split:true"
		style="width: 100%; height: 50%;">
		<div id="chart1" style="width: 700px; height: 220px"></div>
	</div>
	<div class="border" data-options="region:'center'"
		style="width: 100%; height: 50%;">
		<div id="chart2" style="width: 700px; height: 220px"></div>
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
	var myChart22 = echarts.init(document.getElementById("chart2"));
	option2.title.text="石油产量";
	myChart22.setOption(option2);
</script>