package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseMultiDataSourceMetric extends BaseEntity{
	
	@ManyToOne
	@JoinColumn(name="dataSourceMetricId")
	private DataSourceMetric dataSourceMetric;
	
	@ManyToOne
	@JoinColumn(name="tableColumnsId")
	private TableColumns tableColumns;
	
	@ManyToOne
	@JoinColumn(name="dimensionValueId")
	private DimensionValue dimensionValue;

	public DataSourceMetric getDataSourceMetric() {
		return dataSourceMetric;
	}

	public void setDataSourceMetric(DataSourceMetric dataSourceMetric) {
		this.dataSourceMetric = dataSourceMetric;
	}

	public TableColumns getTableColumns() {
		return tableColumns;
	}

	public void setTableColumns(TableColumns tableColumns) {
		this.tableColumns = tableColumns;
	}

	public DimensionValue getDimensionValue() {
		return dimensionValue;
	}

	public void setDimensionValue(DimensionValue dimensionValue) {
		this.dimensionValue = dimensionValue;
	}
	
	

}
