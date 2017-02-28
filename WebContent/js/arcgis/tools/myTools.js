var ColorDomClassMark = "renderColors";
function resetSelectDOM(data, id) {/* [""] */
	var data = [ [ "公司名称", "盆地名称", "年份", "资源类型" ],
			[ "全部", "大于", "大于或等于", "等于", "小于等于", "小于或等于", "不等于", "包含", "不包含" ] ];
	var jqueryObj;
	if (typeof id == "string")
		jqueryObj = $(id).find("select");
	else if (typeof id == "object")
		jqueryObj = id;
	jqueryObj.each(function(index) {
				$(this).empty();
				var temp = data[index];
				var length = temp.length;
				for (var i = 0; i < length; ++i) {
					$(this).append(
							"<option value='" + temp[i] + "'>" + temp[i]
									+ "</option>");
				}
			});
}

function updateTable(params, id) {
	$(id).datagrid("reload");才
}

function createParamsByDom(obj,id) {
	var params = {id:id};
	var container = $(obj).parents(".padding").find("select");
	container.each(function(i, ele) {
		params[ele.id] = $(ele).find(":selected").text().trim();
	});
	return params;
}
// 仅仅支持向回调函数中注入一个参数
function ajax(options, callback, args) {
	$.ajax({
		url : options.url,
		type : "post",
		async : false,
		data : {
			json : JSON.stringify(options.params)
		},
		success : function(data) {
			if (args) {
				if (callback instanceof Array) {
					$.each(callback, function() {
						this(data, args);
					});
				} else
					callback(data, args);
			} else {
				if (callback instanceof Array) {
					$.each(callback, function() {
						this(data);
					});
				} else
					callback(data);
			}
		},
		error : function() {
			alert("error");
		}
	});
}

function updateEChart() {

}

function parseDataToChart(options, title, data) {
	return setChartOption(options, {
		title : title,
		xAxisData : data.xAxis.xData,
		yAxisName : data.yAxis.yName,
		yAxisData : data.seiresData
	});
}
// 向div容器下第一个节点后面附加内容
// id:附加节点的容器的ID;label:附加的标签;data:附加到select下面的数据
function append2(id, labelName, data) {
	var fristDiv = $(id).children(":first");
	var selectDom = fristDiv.children("select");
	var optionDom = selectDom.children(":selected");
	var value = optionDom.val();
	if (value == "company") {
		var data = {
			编码1 : '中石油',
			编码2 : '中石化',
			编码3 : '中海油',
			编码4 : '延长石油'
		};
		append3(selectDom, "公司"/* label */, data);/* {编码1：'中石油',编码2：'中石化',编码3：'中石油'} */
	} else if (value == "index") {
		var data = {
			levels : 3,
			value : [ 1/* min */, 30 /* max */]
		};
		var div = createDiv();
		var label = createLabel("等级");
		var select = createSelect(data.levels);/* Num类型 */
		div.append(label).append(select);
		fristDiv.after(div);
		var data2 = parseDataToArray(data);
		append3(select, "范围", data2);
	} else {
		console.log("else");
	}
	catchColors(id);
}
function parseDataToArray(data) {
	if (!data || !data.value)
		return null;
	var length = data.levels + 1 || 2;
	var min = data.value[0] || 0;
	var max = data.value[1] || 0;
	var mean = (max - min) / (length - 1);
	var array = [];
	for (var i = 0; i < length; ++i) {
		array.push(parseInt(min + mean * i));
	}
	return array;
}
// 根据select下选项的改变向select后面附加内容
// dom:附加节点的兄弟节点的子节点;label:附加的标签;data:附加到select下面的数据
function append3(dom, label, data) {
	/* data应该有两种数据结构：{key:value}或[value] */
	var thisDom = $(dom).parents("div:first");
	var div = createDiv(ColorDomClassMark);
	var label = createLabel(label);
	var color = createValueAndColor(data);
	div.append(label).append(color);
	thisDom.after(div);
}
function createDiv(classMark) {
	return $("<div class='inline-block " + (classMark ? classMark : '')
			+ "'></div>");
}

function createLabel(content) {
	return $("<label class='label'>" + content + ":</label>");
}

function createSelect(data) {
	var select = $("<select id='index' class='select'></select>");
	if (data instanceof Array) {/* [2012,2013,2014] */
		for ( var key in data) {
			select.append(createOption(key, data[key]));
		}
	} else if (data instanceof Object) {/* {oilProduce:'石油产量'} */
		for ( var i in data) {
			select.append(createOption(data[i]));
		}
	} else {
		for (var i = parseInt(data); i > 0; --i) {
			select.append(createOption(i));
		}
	}
	return $(select);
}

function createOption(value, content) {
	return $("<option value='" + value + "'>" + (content ? content : value)
			+ "</option>");
}

function createValueAndColor(data) {/* {levels:3,value:[1,30],colors:["#FF8040","#FF8040","#FF8040"]}; */
	var colors = getColors();
	var content = "";
	if (data instanceof Array) {
		var length = data.length;
		for (var i = 0; i < length - 1; ++i) {
			content += "<input class='input' type='text' value='" + data[i]
					+ "'/><input type='color' value='"
					+ (colors[i] ? colors[i] : colors[colors.length]) + "'/>";
		}
		content += "<input class='input' type='text' value='"
				+ data[length - 1] + "'/>";
	} else if (data instanceof Object) {
		var i = 0;
		for ( var key in data) {
			content += "<input class='input' type='text' value='" + data[key]
					+ "'/><input type='color' value='"
					+ (colors[i] ? colors[i] : colors[colors.length]) + "'/>";
			++i;
		}
	}
	return $(content);
}

function createCompanyAndColor(data) {
	if (!data || !data.value)
		return null;
	var levels = data.levels || 1;
	var min = data.value[0] || 0;
	var max = data.value[1] || 0;
	var pingjun = (max - min) / levels;
	/*
	 * var colors = (data.colors && data.colors.length > 0) ? data.colors : [
	 * "#0080ff", "#0000ff", "#80ff00", "#008000", "#ffff00", "#ff8000",
	 * "#ff0000" ];
	 */
	var colors = getColors();
	var content = "";
	for (var i = 0; i < levels; ++i) {
		content += "<input class='input' type='text' value='"
				+ parseInt(min + i * pingjun)
				+ "'/><input type='color' value='"
				+ (colors[i] ? colors[i] : colors[colors.length]) + "'/>";
	}
	content += "<input class='input' type='text' value='" + max + "'/>";
	console.log(content);
	return $(content);
}
function getColors() {
	return [ "#0080ff", "#0000ff", "#80ff00", "#008000", "#ffff00", "#ff8000",
			"#ff0000" ];
}

function catchColors(id) {
	var inputs = $(id).find("." + ColorDomClassMark)
			.find("input[type='color']");
	var array = [];
	$.each(inputs, function() {
		array.push($(this).val());
	});
	console.log(array);
	return array;
}