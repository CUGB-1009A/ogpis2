<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div title="相关历史数据">
		<h1 style="text-align:center">规划制定参考相关历史数据</h1>
		<div class="easyui-panel">
			<h3 style="margin-left:25px">5、石油产量</h3>
			<div id="SYYCL" class="charts" style="width:50%;height:300px;float:left">
				
			</div>
			<div id="SYYCLMS" class="MS" style="width:50%;height:300px;float:right">
				text
			</div>
		</div>
		<div class="easyui-panel">
			<h3 style="margin-left:25px">1、新增石油探明地质储量</h3>
			<div id="SYCL" class="charts" style="width:50%;height:300px;float:left">
				<div id="chart1">
					
				</div>
			</div>
			<div id="SYCLMS" class="MS" style="width:50%;height:300px;float:right">
				text
			</div>
		</div>
		<div class="easyui-panel">
			<h3 style="margin-left:25px">2、新增页岩气探明地质储量</h3>
			<div id="YYQCL" class="charts" style="width:50%;height:300px;float:left">
				text
			</div>
			<div id="YYQCLMS" class="MS" style="width:50%;height:300px;float:right">
				text
			</div>
		</div>
		<div class="easyui-panel">
			<h3 style="margin-left:25px">3、新增天然气探明地质储量</h3>
			<div id="TRQCL" class="charts" style="width:50%;height:300px;float:left">
				text
			</div>
			<div id="TRQCLMS" class="MS" style="width:50%;height:300px;float:right">
				text
			</div>
		</div>
		<div class="easyui-panel">
			<h3 style="margin-left:25px">4、新增煤层气探明地质储量</h3>
			<div id="MCQCL" class="charts" style="width:50%;height:300px;float:left">
				text
			</div>
			<div id="MCQCLMS" class="MS" style="width:50%;height:300px;float:right">
				text
			</div>
		</div>
		
	</div>
	<script type="text/javascript">
		var option = {
	            title: {
	                text: '石油产量',
	                x:'center'
	            },
	            tooltip: {},
	            xAxis: {
	            	name:'年份',
	            	type:'category',
					show:true,
	               // data: ["2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"]
	                data: [2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015]
	            },
	            yAxis: {
	            	name:'亿吨',
	            	type:'value'
	            },
	            dataZoom: [
	                       {   // 这个dataZoom组件，默认控制x轴。
	                           type: 'slider', // 这个 dataZoom 组件是 slider 型 dataZoom 组件
	                           start: 0,      // 左边在 10% 的位置。
	                           end: 60         // 右边在 60% 的位置。
	                       }
	                   ],
	            series: [{
	                name: '销量',
	                type: 'bar',
	                data: [1.63, 1.69, 1.7, 1.75, 1.82, 1.84, 1.87, 1.91, 1.88, 2.01, 2.03, 2.07, 2.09, 2.11, 2.03]
	            }],
	            label:{ 
	            	normal:{ 
		            	show: true, 
		            	position: 'outside'
		            	} 
	            	}
	        };
		
		//myCharts=echarts.init(document.getElementById("SYYCL"));
		var x = document.getElementsByClassName("charts");
		var i;
		for (i = 0; i < x.length; i++) {
			myCharts=echarts.init(x[i]);
			myCharts.setOption(option);
		}
	</script>