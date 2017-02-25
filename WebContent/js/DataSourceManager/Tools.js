//var param={name:"",value:"",text:"",prefix:"",style:""}
function createOption(param, data) {
	var dom = "<option value='" + filterNull(data[param.value]) + "'>"
			+ filterNull(data[param.text]) + "</option>";
	return $(dom);
}

function createCheckBox(param, data) {
	var dom = "<input data-submit='no' data-old='no' data-resume='unchecked' name='"
			+ filterNull(param.name)
			+ "' value='"
			+ filterNull(data[param.value])
			+ "' type='checkbox' /><label>"
			+ filterNull(data[param.text]) + "</label>";
	return $(dom);
}

function createSelect(param) {
	var dom = "<select data-submit='no' data-old='no' class='"
			+ filterNull(param.style) + "' data-resume='clear' name='"
			+ filterNull(param.name) + "'></select>";
	return $(dom);
}

function createDiv(param) {
	var dom = "<div class='" + filterNull(param.style) + "' "
			+ filterNull(param.other) + "></div>";
	return $(dom);
}

function filterNull(text) {
	return text ? text : '';
}

function toJson(key, json) {
	var obj = {};
	obj[key] = JSON.stringify(json);
	return obj;
}

function parseParamMany(ids) {
	/*var obj={};
	$.each(ids, function() {
		$.extend(obj,parseParam(this));
	})
	return obj;*/
}

function isEmptyObject(obj) {  
    var key;
    for (key in obj)
        return !1; //false 
    return !0;  //true
}

function parseParam(id) {
	var container = $("#" + id);
	var items = container.find("[data-paramType]");
	var param = {};
	$.each(items, function() {
		var paramtype = $(this).data("paramtype");

		if (paramtype == "value")
			if ($(this).data("submit") == "no")
				return;
		if (paramtype == "object")
			if ($(this).find("[data-submit]").length == 0)
				return;

		var prefix = $(this).data("prefix");
		var keys = prefix.split(".");
		var tempObj = param;
		$.each(keys, function() {
			var key = this;
			var obj;
			if (key.indexOf("[]") == -1) {
				if (tempObj[key] == null) {
					obj = {};
				} else {
					obj = tempObj[key];
				}
			} else {
				key = key.substring(0, key.length - 2);
				if (tempObj[key] == null) {
					obj = [];
				} else {
					obj = tempObj[key];
				}
			}
			if (tempObj instanceof Array) {
				tempObj.push(tempObj[key]);
				tempObj = obj;
			} else
				tempObj[key] = obj;
			tempObj = obj;
		});
		if (paramtype == "value") {
			var value = this.value;
			var keys = this.name.split(".");
			var length = keys.length;
			$.each(keys, function(i) {
				var key = this;
				if (i < length - 1) {
					var obj;
					if (key.indexOf("[]") == -1) {
						if (tempObj[key] == null) {
							obj = {};
						} else {
							obj = tempObj[key];
						}
					} else {
						key = key.substring(0, key.length - 2);
						if (tempObj[key] == null) {
							obj = [];
						} else {
							obj = tempObj[key];
						}
					}
					if (tempObj instanceof Array) {
						tempObj.push(tempObj[key]);
						tempObj = obj;
					} else
						tempObj[key] = obj;
					tempObj = obj;
				} else {
					tempObj[key] = value;
				}
			});
		} else if (paramtype == "object") {
			var partParam = {};
			var partList = $(this).find("[data-submit]").filter(
					"input,select,textarea");
			$.each(partList, function() {
				if($(this).data("submit")=="yes"){
					var tempObj=partParam;
					var value = this.value;
					var keys = this.name.split(".");
					var length = keys.length;
					$.each(keys, function(i) {
						var key = this;
						if (i < length - 1) {
							var obj;
							if (key.indexOf("[]") == -1) {
								if (tempObj[key] == null) {
									obj = {};
								} else {
									obj = tempObj[key];
								}
							} else {
								key = key.substring(0, key.length - 2);
								if (tempObj[key] == null) {
									obj = [];
								} else {
									obj = tempObj[key];
								}
							}
							if (tempObj instanceof Array) {
								tempObj.push(tempObj[key]);
								tempObj = obj;
							} else
								tempObj[key] = obj;
							tempObj = obj;
						} else {
							tempObj[key] = value;
						}
					});
				}
			});
			if(!isEmptyObject(partParam))
				tempObj.push(partParam);
		}
	});
	return param;
}