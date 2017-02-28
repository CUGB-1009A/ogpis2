package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.MultiDataSourceMetric;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseDataSourceMetric extends BaseEntity{
	
	@OneToOne
	@JoinColumn(name = "dataSourceId")
	private DataSource dataSource;
	
	@Column(name = "metricType")
	private String metricType;
	
	@ManyToOne
	@JoinColumn(name="tableColumnsId")
	private TableColumns tableColumns;
	
	@OneToMany(mappedBy = "dataSourceMetric")
	private List<MultiDataSourceMetric> multiDataSourceMetrics;
	
	@Column(name="isMulti")//是单一度量还是多个度量值进行组合
	private boolean isMulti;
	
	@ManyToOne
	@JoinColumn(name="dimensionId")
	private Dimension dimension;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public TableColumns getTableColumns() {
		return tableColumns;
	}

	public void setTableColumns(TableColumns tableColumns) {
		this.tableColumns = tableColumns;
	}

	public List<MultiDataSourceMetric> getMultiDataSourceMetrics() {
		return multiDataSourceMetrics;
	}

	public void setMultiDataSourceMetrics(List<MultiDataSourceMetric> multiDataSourceMetrics) {
		this.multiDataSourceMetrics = multiDataSourceMetrics;
	}
	
	public boolean isMulti() {
		return isMulti;
	}

	public void setMulti(boolean isMulti) {
		this.isMulti = isMulti;
	}

	public Dimension getDimension() {
		return dimension;
	}

	public void setDimension(Dimension dimension) {
		this.dimension = dimension;
	}

	public String getMetricType() {
		return metricType;
	}

	public void setMetricType(String metricType) {
		this.metricType = metricType;
	}
	
	

}
