//拖动工具条
function onDrag(e) {
	var height=parseInt($("#tab1").css("height"));
	var d = e.data;
	if (d.left < 0) {
		d.left = 0;
	}
	if (d.top < 0) {
		d.top = 0;
	}
	if (d.left + d.target.scrollWidth > d.parent.scrollWidth) {
		d.left = d.parent.scrollWidth - d.target.scrollWidth;
	}
	if (d.top + d.target.scrollHeight > d.parent.scrollHeight) {
		d.top = d.parent.scrollHeight - d.target.scrollHeight
	}
	/*var height=parseInt($("#tab1").css("height"));
	var d = e.data;
	if (d.left < 0) {
		d.left = 0;
	}
	if (d.top < height) {
		d.top = height;
	}
	if (d.left + d.target.scrollWidth > d.parent.scrollWidth) {
		d.left = d.parent.scrollWidth - d.target.scrollWidth;
	}
	if (d.top + d.target.scrollHeight > d.parent.scrollHeight+height) {
		d.top = d.parent.scrollHeight+height - d.target.scrollHeight
	}*/
}
// 禁用地图导航工具条
function deNavBar() {
	navToolbar.deactivate();
}
// 地图全图
function Home() {
	map.setExtent(initExtent);
}
// 平移
function ZoomPan() {
	navToolbar.deactivate();
}
// 开启画点模式
function DrawPoint() {
	require([ "esri/toolbars/draw" ], function(Draw) {
		drawToolBar.activate(Draw.POINT);
	})
}
// 禁用画图供给条
function deDrawBar() {
	drawToolBar.deactivate();
}
// 开启画线模式
function DrawLine() {
	require([ "esri/toolbars/draw" ], function(Draw) {
		drawToolBar.activate(Draw.POLYLINE);
	})
}
// 开启画线多边形模式
function DrawLine() {
	require([ "esri/toolbars/draw" ], function(Draw) {
		drawToolBar.activate(Draw.POLYGON);
	})
}
// 开启画线多边形模式
function DrawLine() {
	require([ "esri/toolbars/draw" ], function(Draw) {
		drawToolBar.activate(Draw.RECTANGLE);
	})
}
// 地图放大
function ZoomIn() {
	require([ "esri/toolbars/navigation" ], function(Navigation) {
		navToolbar.activate(Navigation.ZOOM_IN);
	})
}
// 地图放大
function ZoomOut() {
	require([ "esri/toolbars/navigation" ], function(Navigation) {
		navToolbar.activate(Navigation.ZOOM_OUT);
	})
}
// 右键快捷菜单
function mapContextMenu() {
	var toolbar = $("#mapToolsDiv").parent();
	console.log(event);
	toolbar.css("left", event.offsetX);
	toolbar.css("top", event.offsetY);
	toolbar.show();
}

// 地图点击响应
function mapClick(e) {
	var g = e.graphic;
	console.log(g.attributes)
	map.infoWindow.setContent("<a>hello</a>");
	map.infoWindow.setTitle("test");
	map.infoWindow.show(g.geometry, map.getInfoWindowAnchor(g.geometry));
}
// 显示infoWindow
function showInfoWin(data) {// data中要包含标题、内容、和点坐标
	map.infoWindow.setContent(data.content);
	map.infoWindow.setTile(data.title);
	map.infoWindow.show(data.point, map.getInfoWindowAnchor(data.point));
}
// 点选查询
function pointIdentifyTask(point, url, layerId) {
	require([ "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters" ],
			function(IdentifyTask, IdentifyParameters) {
				var task = new IdentifyTask(url);
				var taskParam = new IdentifyParameters();
				// 冗余范围
				taskParam.tolerance = 2;
				// 返回地理元素
				taskParam.returnGeometry = true;
				// 查询的图层
				taskParam.layerIds = [ layerId ];
				// 查询范围
				taskParam.mapExtent = initExtent;
				// 执行查询
				task.execute(taskParam, function(results) {
					if (results.length < 1)
						return;
				})
			})
}
// 条件查询
function queryTask(url, layerId, sql) {
	require([ "esri/tasks/query", "esri/tasks/QueryTask",
			"esri/symbols/SimpleMarkerSymbol", "esri/Color", "esri/graphic" ],
			function(Query, QueryTask, Symbol, Color, Graphic) {
				var task = new QueryTask(url + "/" + layerId);
				var query = new Query();
				// 返回要素
				query.returnGeometry = true;
				// 返回字段
				query.outFileds = [ "*" ];
				// 查询条件
				query.where = sql;
				// 执行查询
				task.execute(query, function(results) {
					if (results.features && results.features.length > 0) {
						/* console.log(map.graphicsLayerIds); */
						map.getLayer("graphicsLayer1").hide();
						map.graphics.clear();
						var symbol = new Symbol(Symbol.STYLE_SQUARE, 10,
								new Symbol(Symbol.STYLE_SOLID, new Color([ 255,
										0, 0 ]), 1), new Color([ 0, 255, 0,
										0.25 ]));
						for (var i = 0; i < results.features.length; ++i) {
							var feature = results.features[i];
							var g = new Graphic(feature.geometry, symbol);
							map.graphics.add(g);
						}
						/*
						 * var data=results.features[0].attributes; var
						 * geometry=results.features[0].geometry; for(var i in
						 * data){ }
						 */
					}
				})
			});
}
// 空间查询
function queryTaskByGeometry(url, layerId, geometry) {
	var data = new Array();
	require([ "esri/tasks/query", "esri/tasks/QueryTask",
			"esri/symbols/SimpleMarkerSymbol", "esri/Color", "esri/graphic" ],
			function(Query, QueryTask, Symbol, Color, Graphic) {
				var task = new QueryTask(url + "/" + layerId);
				var query = new Query();
				// 返回要素
				query.returnGeometry = true;
				// 返回字段
				query.outFileds = [ "*" ];
				// 查询元素
				query.geometry = geometry;
				// 执行查询
				task.execute(query, function(results) {
					if (results.features && results.features.length > 0) {
						/* console.log(map.graphicsLayerIds); */
						map.getLayer("graphicsLayer1").hide();
						map.graphics.clear();
						var symbol = new Symbol(Symbol.STYLE_SQUARE, 10,
								new Symbol(Symbol.STYLE_SOLID, new Color([ 255,
										0, 0 ]), 1), new Color([ 0, 255, 0,
										0.25 ]));
						for (var i = 0; i < results.features.length; ++i) {
							var feature = results.features[i];
							data.push(feature.attributes);
							var g = new Graphic(feature.geometry, symbol);
							map.graphics.add(g);
						}
						console.log(data);
						/*
						 * var data=results.features[0].attributes; var
						 * geometry=results.features[0].geometry; for(var i in
						 * data){ }
						 */
					}
				})
			});
}
// 显示信息
function showTip(e) {
	var g = e.graphic;
	var data = e.attributes;
	var content = "";
	for ( var i in data) {

	}
	showInfoWin(obj);
}
// 触发与取消工具条
function toogleToolBar() {
	$("#mapTooDiv").toggle();
	var icon = "";
	if ($("#mapTooDiv").is(":visible"))
		icon = "icon-current";
	$("#mapMenu").menu("setIcon", {
		target : $("#m-toolbar")[0],
		iconCls : icon
	})
}
// 显示工具条
function showMapMenu(e) {
	var toolbar = $("#mapToolsDiv").parent();
	toolbar.css("left", event.clientX);
	toolbar.css("top", event.clientY);
	toolbar.show();
}
// 获取绘画的结果
function getDrawResult(e) {
	var url = "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer";
	var layerId = 0
	var geometry = e.geometry;
	console.log(geometry);
	queryTaskByGeometry(url, layerId, geometry);
	drawToolBar.deactivate();
}