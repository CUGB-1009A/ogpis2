package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.MultiDataSourceMetric;

@MappedSuperclass
public class BaseTableColumns extends BaseEntity{


	@Column(name = "name")//
	private String name;
	
	@Column(name = "code")//
	private String code;

	@ManyToOne
	@JoinColumn(name = "tableId")//
	private InterfaceTable table;
	
	@OneToMany(mappedBy = "tableColumns")
	private List<DataSourceMetric> dataSourceMetrics;
	
	@OneToMany(mappedBy = "tableColumns")
	private List<MultiDataSourceMetric> multiDataSourceMetrics;
	
	@OneToMany(mappedBy = "tableColumns")
	private List<DataSourceField> dataSourceFields;

	public List<DataSourceMetric> getDataSourceMetrics() {
		return dataSourceMetrics;
	}

	public void setDataSourceMetrics(List<DataSourceMetric> dataSourceMetrics) {
		this.dataSourceMetrics = dataSourceMetrics;
	}

	public List<MultiDataSourceMetric> getMultiDataSourceMetrics() {
		return multiDataSourceMetrics;
	}

	public void setMultiDataSourceMetrics(List<MultiDataSourceMetric> multiDataSourceMetrics) {
		this.multiDataSourceMetrics = multiDataSourceMetrics;
	}

	public List<DataSourceField> getDataSourceFields() {
		return dataSourceFields;
	}

	public void setDataSourceFields(List<DataSourceField> dataSourceFields) {
		this.dataSourceFields = dataSourceFields;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public InterfaceTable getTable() {
		return table;
	}

	public void setTable(InterfaceTable table) {
		this.table = table;
	}

}

