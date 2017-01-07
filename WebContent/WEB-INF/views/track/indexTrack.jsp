<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var dojoConfig = {
		packages : [ {
			name : "myDojo",
			location : "/ogpis2/js/arcgis"
		} ]
	};
</script>

<!-- 加载ArcGIS API  -->
<script type="text/javascript" src="/arcgis/library/3.9/3.9/init.js"></script>
<link rel="stylesheet" type="text/css"
	href="/arcgis/library/3.9/3.9/esri/css/esri.css"></link>
<!-- 加载自定义ArcGIS API  -->
<script type="text/javascript" src="../js/arcgis/globalFunction.js"></script>
<script type="text/javascript" src="../js/arcgis/globalVariable.js"></script>
<script type="text/javascript" src="../js/arcgis/initPage.js"></script>

<!-- 加载自定义样式 -->
<link rel="stylesheet" type="text/css" href="../js/arcgis/css/Map.css">
<style>
.accordion .accordion-header-selected {
	background: #546FAF;
}

.datagrid-cell {
	font-size: 12px;
	line-height:16px
}

.datagrid-header .datagrid-cell span {
	font-size: 12px;
	font-weight: bold;
	line-height:16px
}
</style>
</head>
<body>
	<div
		style="width: 100%; height: 100%; dispaly: flex; flex-direction: column;">
		<div style="height: 8%">
			<div style="padding: 10px;">十三五规划</div>
		</div>
		<div style="height: 92%">
			<div style="height: 100%">
				<div class="easyui-accordion"
					data-options="animate:false,border:false,onSelect:changeChartSize,onUnselect:changeChartSize">
					<div title="规划介绍" style="overflow: auto; padding: 10px;">
						<h4 style="text-align: center; margin: 12px;">规划目标和总体情况</h4>
						<p style="text-indent: 20px; line-height: 200%">（1）油气储量目标：新增石油探明地质储量65亿吨，年均新增储量13
							亿吨;新增天然气探明地质储量3.5万亿立方米,年均新增储量7000 亿立方米；新增煤层气探明地质储量8500亿立方米；新增页岩气
							探明地质储量6000亿立方米。（2）油气产量目标：到2015年，石油产量稳定在2亿吨左右，常规天然气产量1385亿立方米，煤层气地面开发产量160亿立方米，页岩气产量65亿立方米。总体情况：利用油气储量、产量历史数据，结合新形势分析和主要石油企
							业年度报告，预测了 2015年油气新增储量、油气产量，进而对“十 二五”油气储量、产量目标完成情况进行了初步评估。</p>
					</div>
				</div>
				<div id="panel1" class="easyui-panel" data-options="border:false">
					<div id="tab1" class="easyui-tabs"
						data-options="border:false,fit:true">
						<div title="总体情况">
							<div
								style="padding: 10px; display: flex; justify-content: center; align-items: center">
								<div id="totalChart" style="width: 800px; height: 350px"></div>
							</div>
						</div>
						<div title="产量指标">
							<div class="easyui-panel" style="width: 100%; overflow-y: auto"
								data-options="fit:true">
								<div style="width: 100%; height: 400px;">
									<div title="图表" class="easyui-layout" data-options="fit:true"
										style="width: 100%; min-width: 800px;">
										<div data-options="region:'west',split:true"
											style="width: 30%; max-width: 600px;">
											<table id="table" class="easyui-datagrid"
												data-options="fit:true,fitColumns:true,singleSelect:true">
												<thead>
													<tr>
														<th data-options="field:'year',width:200,align:'center'">年份</th>
														<th data-options="field:'value',width:200,align:'center'">石油产量</th>
														<th
															data-options="field:'percent',width:200,align:'center'">比例</th>
													</tr>
												</thead>
												<tbody id="data">
													<tr>
														<td>2011</td>
														<td>2.03</td>
														<td>20.3%</td>
													</tr>
													<tr>
														<td>2012</td>
														<td>2.07</td>
														<td>20.7%</td>
													</tr>
													<tr>
														<td>2013</td>
														<td>2.09</td>
														<td>20.9%</td>
													</tr>
													<tr>
														<td>2014</td>
														<td>2.11</td>
														<td>21.1%</td>
													</tr>
													<tr>
														<td>2015</td>
														<td>2.15</td>
														<td>21.5%</td>
													</tr>
													<tr>
														<td>合计</td>
														<td>10.45</td>
														<td>104.5%</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="border" data-options="region:'center'">
											<div id="test1" style="width: 70%; height: 350px;"></div>
										</div>
									</div>
								</div>
								<div style="width: 100%; height: 400px;">
									<div title="图表" class="easyui-layout" data-options="fit:true"
										style="width: 100%; min-width: 800px;">
										<div data-options="region:'west',split:true"
											style="width: 30%; max-width: 600px;">
											<table id="table" class="easyui-datagrid"
												data-options="fit:true,fitColumns:true,singleSelect:true">
												<thead>
													<tr>
														<th data-options="field:'year',width:200,align:'center'">年份</th>
														<th data-options="field:'value',width:200,align:'center'">天然气产量</th>
														<th
															data-options="field:'percent',width:200,align:'center'">比例</th>
													</tr>
												</thead>
												<tbody id="data">
													<tr>
														<td>2011</td>
														<td>1013.00</td>
														<td>14.6%</td>
													</tr>
													<tr>
														<td>2012</td>
														<td>1071.00</td>
														<td>15.5%</td>
													</tr>
													<tr>
														<td>2013</td>
														<td>1166.00</td>
														<td>16.8%</td>
													</tr>
													<tr>
														<td>2014</td>
														<td>1248.00</td>
														<td>18.0%</td>
													</tr>
													<tr>
														<td>2015</td>
														<td>1300.00</td>
														<td>18.8%</td>
													</tr>
													<tr>
														<td>合计</td>
														<td>5798.00</td>
														<td>83.7%</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="border" data-options="region:'center'">
											<div id="test2" style="width: 70%; height: 350px;"></div>
										</div>
									</div>
								</div>
								<div style="width: 100%; height: 400px;">
									<div title="图表" class="easyui-layout" data-options="fit:true"
										style="width: 100%; min-width: 800px;">
										<div data-options="region:'west',split:true"
											style="width: 30%; max-width: 600px;">
											<table id="table" class="easyui-datagrid"
												data-options="fit:true,fitColumns:true,singleSelect:true">
												<thead>
													<tr>
														<th data-options="field:'year',width:200,align:'center'">年份</th>
														<th data-options="field:'value',width:200,align:'center'">煤层气产量</th>
														<th
															data-options="field:'percent',width:200,align:'center'">比例</th>
													</tr>
												</thead>
												<tbody id="data">
													<tr>
														<td>2011</td>
														<td>20.70</td>
														<td>2.6%</td>
													</tr>
													<tr>
														<td>2012</td>
														<td>25.73</td>
														<td>3.2%</td>
													</tr>
													<tr>
														<td>2013</td>
														<td>29.26</td>
														<td>3.7%</td>
													</tr>
													<tr>
														<td>2014</td>
														<td>36.90</td>
														<td>4.6%</td>
													</tr>
													<tr>
														<td>2015</td>
														<td>42.00</td>
														<td>5.3%</td>
													</tr>
													<tr>
														<td>合计</td>
														<td>154.59</td>
														<td>19.3%</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="border" data-options="region:'center'">
											<div id="test3" style="width: 70%; height: 350px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div title="储量指标" closable="true">test</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#tt").tabs({
			onSelect : function(title) {
				console.log(title);
				if (title == "图表")
					$.parser.parse(document)
			}
		});
	})

	var option = {
		title : {
			text : '指标跟踪',
			left : 'center'
		},
		tooltip : {
			trigger : 'axis'
		},
		xAxis : [ {
			type : 'category',
			/* boundaryGap : false, */
			name : "年份",
			data : [ 2011, 2012, 2013, 2014, 2015 ]
		} ],
		yAxis : [ {
			type : 'value',
			name : '万吨'
		} ],
		series : [ {
			type : 'bar',
			barWidth : 30,
			name : '石油产量',
			data : [ 1215, 8545, 5442, 78854, 4564, 4788 ],
			markLine : {
				itemStyle : {
					normal : {
						color : "#0000FF"
					}
				},
				color : "#FF0000",
				data : [ [ {
					// 固定起点的 x 像素位置，用于模拟一条指向最大值的水平线
					yAxis : 60000,
					x : '10%',
					name : "规划目标值",
					value : 60000
				}, {
					yAxis : 60000,
					x : '90%'
				} ] ]
			}
		} ]
	}
	function setChartOption(单位, 名称, 数据, 目标) {
		option.yAxis[0].name = 单位;
		option.title.text = 名称;
		option.series[0].name = 名称;
		option.series[0].data = 数据;
		option.series[0].markLine.data[0][0].yAxis = 目标;
		option.series[0].markLine.data[0][0].value = 目标;
		option.series[0].markLine.data[0][1].yAxis = 目标;
	}

	var totalChartOption = {
		title : {
			text : '规划总体完成情况',
			left : 'center'
		},
		tooltip : {
			trigger : 'axis',
			axisPointer : { // 坐标轴指示器，坐标轴触发有效
				type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}
		},
		legend : {
			top : '9%',
			data : [ '2011年', '2012年', '2013年', '2014年', '2015年' ]
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar', 'stack', 'tiled' ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		},
		calculable : true,
		xAxis : [ {
			type : 'value',
			axisLabel : {
				show : true,
				interval : 'auto',
				formatter : '{value} %'
			}
		} ],
		yAxis : [ {
			type : 'category',
			data : [ '石油新增探明地质储量', '天然气新增探明地质储量', '煤层气新增探明地质储量', '石油产量',
					'天然气产量', '煤层气产量' ]
		} ],
		series : [ {
			name : '2011年',
			type : 'bar',
			stack : '总量',
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'insideRight',
						formatter : '{c}%'
					}
				}
			},
			data : [ 12, 25, 21, 19, 23, 14 ]
		}, {
			name : '2012年',
			type : 'bar',
			stack : '总量',
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'insideRight',
						formatter : '{c}%'
					}
				}
			},
			data : [ 23, 22, 26, 19, 27, 21 ]
		}, {
			name : '2013年',
			type : 'bar',
			stack : '总量',
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'insideRight',
						formatter : '{c}%'
					}
				}
			},
			data : [ 28, 23, 26, 24, 29, 30 ]
		}, {
			name : '2014年',
			type : 'bar',
			stack : '总量',
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'insideRight',
						formatter : '{c}%'
					}
				}
			},
			data : [ 21, 18, 19, 20, 21, 11 ]
		}, {
			name : '2015年',
			type : 'bar',
			stack : '总量',
			itemStyle : {
				normal : {
					label : {
						show : true,
						position : 'insideRight',
						formatter : '{c}%'
					}
				}
			},
			data : [ 12, 25, 21, 19, 23, 14 ]
		} ]
	};

	var totalChart = echarts.init(document.getElementById("totalChart"));
	/* 	totalChartOption.title.text = "总体完成情况"; */
	totalChart.setOption(totalChartOption);
	var myChart1 = echarts.init(document.getElementById("test1"));
	/* option.title.text = "石油产量"; */
	setChartOption("亿吨", "石油产量", [ 2.03, 2.07, 2.09, 2.11, 2.15 ], 2.0);
	myChart1.setOption(option);
	var myChart2 = echarts.init(document.getElementById("test2"));
	/* option.title.text = "天然气产量"; */
	setChartOption("亿立方米", "天然气产量",
			[ 1013.00, 1071.00, 1166.00, 1248.00, 1300 ], 1385.00);
	myChart2.setOption(option);
	var myChart3 = echarts.init(document.getElementById("test3"));
	/* option.title.text = "煤层气产量"; */
	setChartOption("亿立方米", "煤层气产量", [ 20.70, 25.73, 29.26, 36.90, 42.00 ],
			160.00);
	myChart3.setOption(option);
	function changeChartSize() {
		$("#panel1").panel("resize", {
			height : $(this).parent().height() - $(this).height()
		})
	}
</script>
</html>