package com.ogpis.data.entity.base;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.Subject;


@MappedSuperclass
public class BaseDimension extends BaseEntity{
	
	@Column(name = "name")//维度显示名
	private String name;
	
	@Column(name = "isYear")//是否为年份
	private boolean isYear;
	
	@Column(name = "isMetric")//是否是度量维度
	private boolean isMetric;

	@OneToMany(mappedBy="dimension")//维度值
	protected List<DimensionValue> dimensionValues ;
	
	@OneToMany(mappedBy="dimension")
	protected List<DataSourceMetric> dataSourceMetrics ;
	
	@OneToMany(mappedBy="dimension")
	protected List<DataSourceField> dataSourceField;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public boolean isYear() {
		return isYear;
	}

	public void setYear(boolean isYear) {
		this.isYear = isYear;
	}

	public boolean isMetric() {
		return isMetric;
	}

	public void setMetric(boolean isMetric) {
		this.isMetric = isMetric;
	}

	public List<DimensionValue> getDimensionValues() {
		return dimensionValues;
	}

	public void setDimensionValues(List<DimensionValue> dimensionValues) {
		this.dimensionValues = dimensionValues;
	}

	public List<DataSourceMetric> getDataSourceMetrics() {
		return dataSourceMetrics;
	}

	public void setDataSourceMetrics(List<DataSourceMetric> dataSourceMetrics) {
		this.dataSourceMetrics = dataSourceMetrics;
	}

	public List<DataSourceField> getDataSourceField() {
		return dataSourceField;
	}

	public void setDataSourceField(List<DataSourceField> dataSourceField) {
		this.dataSourceField = dataSourceField;
	}

}
