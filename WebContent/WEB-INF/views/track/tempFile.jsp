<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="easyui-layout easyui-panel" data-options="fit:true">
	<div
		data-options="region:'center',onResize:panelResize,border:false">
		<div id="chart1" class="echart" style="width: 700px; height: 220px;"></div>
	</div>
	<div data-options="region:'south',split:true" style="height: 50%;">
		<IFRAME width="100%" height="100%" style="border: 0" frameBorder=0
			id=main_top name=main_top src="/ogpis2/track/plan/list"></IFRAME>
		<!-- <div id="chart2" style="width: 700px; height: 220px"></div> -->
	</div>
</div>
<script type="text/javascript">
	var options = setOptions1(options4, "规划完成情况", {
		type : "value",
		data:[ 104.5, 94.3, 83.7, 114.9, 19.3, 43.9 ]
	}/* xAxis */, {
		type : "category",
		data : [ "石油产量", "石油新增探明地质储量", "天然气产量", "天然气新增探明地质储量", "煤层气产量",
				"煤层气新增探明地质储量" ]
	}/* yAxis */, "bar");
	bindOptionToDiv("chart1",options);
	function panelResize(width, height) {
		$(this).children("div.echart")[0].style.width = $(this).width();
		$(this).children("div.echart")[0].style.height = $(this).height() - 1;
		echartResize($(this).children("div.echart")[0]);
	};
</script>