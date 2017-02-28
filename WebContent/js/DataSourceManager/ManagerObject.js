var DataSourceManager = {
	columns : null,
	id:null,
	queryParamModel : {
		DataSource : {
			name : "",
			subject : {
				id : "",
				$name : ""
			},
			table : {
				id : "",
				$name_CN : ""
			},
			dimensionName : "",
			children : [ {
				id : "",
				$name : "",
				dimensionValue : ""
			} ],
			description : "",
			$parentDataSource : {
				id : "",
				name : ""
			},
			$dataSourceMetric : {},
			$dimensionValue : "",
			$dataCache : [],
			$dataSourceFields : []
		},
		DataSourceMetric : {
			isMulti : "true/false",
			metricType:"",
			tableColumns : {
				id : "",
				$name : ""
			},
			dimension : {
				id : "",
				$name : ""
			},
			$datasource : {},
			multiDataSourceMetrics : [ {
				$id : "",
				$dataSourceMetric : {},
				dimensionValue : {
					id : ""
				},
				tableColumns : {
					id : ""
				}
			} ]
		},
		DataSourceField : [ {
			dimension : {
				id : ""
			},
			tableColumns : {
				id : ""
			},
			isX : "true/false",
			$dataSource : {}
		} ]
	}
}

var ReSetDom = {
	none : function(temp) {
		temp.val("");
	},
	clear : function(temp) {
		temp.empty();
	},
	checked : function(temp) {
		temp.prop("checked", true);
		radioChange(temp);
	},
	select : function(temp) {
		temp.children(":first").prop("selected", "true");
	},
	unchecked : function(temp) {
		temp.prop("checked", false);
		temp.next().nextAll().hide();
	}
}