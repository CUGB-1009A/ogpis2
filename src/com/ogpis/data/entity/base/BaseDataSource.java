package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataCache;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;

@MappedSuperclass
public class BaseDataSource extends BaseEntity{
	
	@Column(name = "name")//数据源名称
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "parentId")//父数据源id，如果数据源有子数据源，则没有具体的维度
	private DataSource parentDataSource;

	@OneToMany(mappedBy = "parentDataSource")
	private List<DataSource> children;
	
	@OneToOne(mappedBy="dataSource")
	private DataSourceMetric dataSourceMetric;
	
	@Column(name="dimensionName")
	private String dimensionName;
	
	@Column(name="dimensionValue")
	private String dimensionValue;
	
	@ManyToOne
	@JoinColumn(name  = "tableId")
	private InterfaceTable table;
	
	@ManyToOne
	@JoinColumn(name = "subjectId")
	private Subject subject;
	
	@OneToMany(mappedBy="dataSource")
	protected List<DataCache> dataCache;
	
	@OneToMany(mappedBy="dataSource")
	protected List<DataSourceField> dataSourceFields;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public DataSource getParentDataSource() {
		return parentDataSource;
	}

	public void setParentDataSource(DataSource parentDataSource) {
		this.parentDataSource = parentDataSource;
	}

	public List<DataSource> getChildren() {
		return children;
	}

	public void setChildren(List<DataSource> children) {
		this.children = children;
	}

	public String getDimensionName() {
		return dimensionName;
	}

	public void setDimensionName(String dimensionName) {
		this.dimensionName = dimensionName;
	}

	public String getDimensionValue() {
		return dimensionValue;
	}

	public void setDimensionValue(String dimensionValue) {
		this.dimensionValue = dimensionValue;
	}

	public InterfaceTable getTable() {
		return table;
	}

	public void setTable(InterfaceTable table) {
		this.table = table;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<DataCache> getDataCache() {
		return dataCache;
	}

	public void setDataCache(List<DataCache> dataCache) {
		this.dataCache = dataCache;
	}
	
	public DataSourceMetric getDataSourceMetric() {
		return dataSourceMetric;
	}

	public void setDataSourceMetric(DataSourceMetric dataSourceMetric) {
		this.dataSourceMetric = dataSourceMetric;
	}

	public List<DataSourceField> getDataSourceFields() {
		return dataSourceFields;
	}

	public void setDataSourceFields(List<DataSourceField> dataSourceFields) {
		this.dataSourceFields = dataSourceFields;
	}
}
