var options1 = {
	title : {
		text : '规模跟踪',// 标题
		left : 'center'
	},
	tooltip : {
		trigger : 'axis'
	},

	xAxis : [ {
		type : 'category',// 横坐标类型
		/* boundaryGap : true, */
		name : "年份",// 横坐标的维度
		data : [ 2001, 2002, 2003, 2004, 2005, 2006 ]
	// 横坐标的值
	} ],
	yAxis : [ {
		type : 'value',// 纵坐标值类型
		/* boundaryGap : true, */
		name : '万吨'// 纵坐标的单位
	} ],
	series : [ {// 对于值类型为value的Axis
		type : 'line',// 图表类型
		barWidth : 35,
		lineWidth : 5,
		name : '历史数据',
		itemStyle : {
			normal : {
				label : {
					show : true,
					position : 'top'
				}
			}
		},
		data : [ 2001, 2002, 2003, 2004, 2005, 2006 ]
	} ]
}

var options2 = {
	title : {
		text : '',
		left : 'center'
	},
	tooltip : {
		trigger : 'axis'
	},
	xAxis : [ {
		type : 'category',
		name : "年份",
		data : [ 2011, 2012, 2013, 2014, 2015 ]
	} ],
	yAxis : [ {
		type : 'value',
		name : '万吨'
	} ],
	series : [ {
		type : 'bar',
		barWidth : 55,
		name : '石油产量',
		itemStyle : {
			normal : {
				label : {
					show : true,
					position : 'top',
				}
			}
		},
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

var options3 = {
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
		data : [ '石油新增探明地质储量', '天然气新增探明地质储量', '煤层气新增探明地质储量', '石油产量', '天然气产量',
				'煤层气产量' ],
		axisLabel : {
			show : true,
			interval : 0
		}
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
}

var options4 = {
	title : {
		text : '',
		left : 'center'
	},
	tooltip : {
		trigger : 'axis'
	},

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
		data : [ "石油产量", "石油新增探明地质储量", "天然气产量", "天然气新增探明地质储量", "煤层气产量",
				"煤层气新增探明地质储量" ],
		axisLabel : {
			show : true,
			interval : 0
		}
	} ],
	grid : { // 控制图的大小，调整下面这些值就可以，
		left : "25%"
	},
	series : [ {
		type : 'bar',
		barWidth : 13,
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

var options5 = {
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
		data : [ '石油新增探明地质储量', '天然气新增探明地质储量', '煤层气新增探明地质储量', '石油产量', '天然气产量',
				'煤层气产量' ],
		axisLabel : {
			show : true,
			interval : 0
		}
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

function setOptions1(options, title, xAxis, yAxis, type) {
	// 设置标题
	options.title.text = title;
	// 设置横轴
	/* options.xAxis[0] = xAxis; */
	options.xAxis[0].type = xAxis.type;
	options.xAxis[0].name = xAxis.name;
	// 设置纵轴
	/* options.yAxis[0] = yAxis; */
	options.yAxis[0].type = yAxis.type;
	options.yAxis[0].name = yAxis.name;
	// 设置图表类型
	options.series[0].type = type;
	// 对图表赋值
	if (xAxis.type == "value") {
		options.series[0].data = xAxis.data;
		options.yAxis[0].data = yAxis.data;
	} else if (yAxis.type == "value") {
		options.series[0].data = yAxis.data;
		options.xAxis[0].data = xAxis.data;
	} else {
		alert("图表数据有错！请确保数据正确。");
	}
	return $.extend(true, {}, options);
}

function setOptions2(options, title, xAxis, yAxis, type, markLine) {
	setOptions1(options, title, xAxis, yAxis, type);
	if (markLine != null) {
		options.series[0].markLine.data[0][0].yAxis = markLine.value;
		options.series[0].markLine.data[0][0].name = markLine.name;
		options.series[0].markLine.data[0][0].value = markLine.value;
		options.series[0].markLine.data[0][1].yAxis = markLine.value;
	}
	return $.extend(true, {}, options);
}

function setOptions3(options, title, xAxis, yAxis, type) {
	// 设置标题
	options.title.text = title;
	// 设置横轴
	options.xAxis[0].type = xAxis.type;
	options.xAxis[0].name = xAxis.name;
	// 设置纵轴
	options.yAxis[0].type = yAxis.type;
	options.yAxis[0].name = yAxis.name;
	// 对图表赋值
	options.series = [];
	if (xAxis.type == "value") {
		var length = xAxis.legend.length;
		for (var i = 0; i < length; ++i) {
			options.series.push({
				name : xAxis.legend[i],
				type : type,
				stack : '总量',
				itemStyle : itemStyle_IN_R_P,
				data : xAxis.data[i]
			})
		}
		options.yAxis[0].data = yAxis.data;
		options.yAxis[0].axisLabel = axisLabel;
		options.legend.data = xAxis.legend;
	} else if (yAxis.type == "value") {
		var length = yAxis.legend.length;
		for (var i = 0; i < length; ++i) {
			options.series.push({
				name : yAxis.legend[i],
				type : type,
				stack : '总量',
				itemStyle : itemStyle_IN_R_P,
				data : yAxis.data[i]
			})
		}
		options.xAxis[0].data = xAxis.data;
		options.xAxis[0].axisLabel = axisLabel;
		options.legend.data = yAxis.legend;
	} else {
		alert("图表数据有错！请确保数据正确。");
	}
	return $.extend(true, {}, options);
}

var itemStyle_IN_R_P = {
	normal : {
		label : {
			show : true,
			position : 'insideRight',
			formatter : '{c}%'
		}
	}
}

var axisLabel = {
	show : true,
	interval : 0
}

function initMyChart(dom) {
	dom = checkDom(dom);
	var chart = echarts.init(dom);
	chart.setOption(dom.chartOption);
	dom.chart = chart;
	return chart;
}

function echartResize(dom) {
	dom = checkDom(dom);
	var chart = dom.chart;
	if (chart == null)
		chart = initMyChart(dom);
	chart.resize();
}

function bindOptionToDiv(domId, options) {
	document.getElementById(domId).chartOption = options;
}

function checkDom(dom) {
	if (typeof (dom) == "string")
		dom = document.getElementById(dom);
	return dom;
}

function setChartOption(oprions, obj) {
	var title = obj.title;
	var xAxis = {
		type : 'category',
		name : obj.xAxisLable != null ? obj.xAxisLable : "年份",
		data : obj.xAxisData != null ? obj.xAxisData : [ 2011, 2012, 2013,
				2014, 2015 ]
	};
	var yAxis = {
		type : "value",
		name : obj.yAxisName,
		data : obj.yAxisData
	};
	var type = obj.type != null ? obj.type : "bar";
	var markLine = obj.target ? {
		name : "规划目标",
		value : obj.target
	} : null;
	return setOptions2(oprions, title, xAxis, yAxis, type, markLine);
};