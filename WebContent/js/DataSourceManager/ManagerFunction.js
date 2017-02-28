//添加数据源 弹出对话框
function addDataSource(id) {
	$(id).dialog({
		title : '添加数据源',
		closed : false,
		cache : false,
		modal : true,
		resizable : true,
		buttons : [ {
			text : '下一步',
			handler : handlerStep1
		}, {
			text : '确定',
			handler : handlerStep2
		}, {
			text : '取消',
			handler : handlerStep3
		} ]
	});
}

function handlerStep1(e) {
	var obj = $(this);
	if (obj.text() == "下一步") {
		$("#step1").hide();
		$("#step2").show();
		obj.find("span span").text("上一步");
		$.post("getColumns",toJson("json",parseParam("step1")), function(data) {
					if (data instanceof Array) {
						DataSourceManager.columns=data;
						var dom1 = $("#columnsList");
						dom1.empty();
						$.each(data, function() {
							dom1.append(DomTools.createOption(this, "id",
									"name"));
						})
						var list1=$("#dimensionList").find("select");
						list1.each(function(){
							var temp=$(this).empty();
							$.each(data,function(){
								temp.append(createOption({value:"id",text:"name"},this))
							});
						})
					}
					$("#valueType2").data("columns", data);
				}, "json");
	} else {
		$("#step2").hide();
		$("#step1").show();
		obj.find("span span").text("下一步");
	}
}

function handlerStep2(e) {
	var container = $("#dataSourceAddDiv");
	var param=parseParam("dataSourceAddDiv");
//	var forms = container.find("input,select,textarea");
//	var content = {};
//	var prefix = {};
//	forms.each(function() {
//		var obj = $(this);
//		if (obj.data("submit") && obj.data("submit") == "yes") {
//			if (obj.data("prefix")) {
//				var prefixKey = obj.data("prefix");
//				if (prefix[prefixKey] == null) {
//					prefix[prefixKey] = 0;
//				} else {
//					prefix[prefixKey]++;
//				}
//				content[prefixKey + "[" + parseInt(prefix[prefixKey] / 2)
//						+ "]." + this.name] = obj.val();
//			} else
//				content[this.name] = $(this).val();
//		}
//	});
	$.post("addDataSource", toJson("json",param), function(data) {
		console.log(data);
	}, "text");
	close($("#dataSourceAddDiv"));
}

function handlerStep3(e) {
	close($("#dataSourceAddDiv"));
}

function close(obj) {//关闭添加、修改维度信息对话框，清空所填信息
	resetSubmitState(obj);
	resetValue(obj);
	obj.dialog({
		closed : true,
	});
	$("#step2").hide();
	$("#step1").show();
}

function resetSubmitState(obj){
	obj.find("[data-old]").each(function(){
		var temp=$(this);
		temp.data("submit",temp.data("old"));
	})
}

function resetValue(obj){
	obj.find("[data-resume]").each(function() {
		var temp = $(this);
		var resumeKey = temp.data("resume");
		ReSetDom[resumeKey](temp);
	});
}

function radioChange(obj) {
	$(obj).data("submit","yes");
	$(obj).siblings("input[type='radio']").data("submit","no");
	var target = $("#" + $(obj).data("target"));
	if(target){
		target.find("input,select").each(function(){
			$(this).data("submit", "yes");
		});
		target.show();
		target.siblings().find("input,select").each(function(){
			$(this).data("submit", "no");
		});
		target.siblings().hide();
	}
}

function radioIsX(obj){
	$(obj).parents("div.dialog-input").find("input[type='radio']").data("submit","no");
	$(obj).data("submit","yes");
}

function changeDimension(obj){
	var list = $("#"+$(obj).data("target"));
	list.empty();
	var dimensionId=$(obj).children("option:selected").val();
	if(dimensionId!="null"&&dimensionId!=null){
		$.ajax({
			url : "../dimensionValue/getByDimensionId",
			dataType:"json",
			async:true,
			data:{"dimensionId":dimensionId},
			type:"POST",
			success:function(result){
				   if(result instanceof Array){
					   for(var i=0;i<result.length;++i){
						   var container=createDiv({other:"data-paramtype='object' data-prefix='DataSourceMetric.multiDataSourceMetrics[]'"});
						   var div=createDiv({style:"dialog-lable"});
						   var checkBoxAndLabel=createCheckBox({value:"id",text:"displayValue",name:"dimensionValue.id"},result[i]);
						   div.append(checkBoxAndLabel);
						   container.append(div);
						   var select=createSelect({style:"dialog-input",name:"tableColumns.id"}).hide();
						   $.each(DataSourceManager.columns,function(){
							   select.append(createOption({value:"id",text:"name"},this));
						   })
						   container.append(select);
						   list.append(container);
					   }
				   }
			},
			error:function(){
				alert("维度值查询失败")
			}
		});	
	}
}