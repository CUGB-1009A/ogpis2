package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.MultiDataSourceMetric;

@MappedSuperclass
public class BaseDimensionValue extends BaseEntity{
	
	@Column(name = "value")//对应维度的维度值
	private String value;
	
	@Column(name = "displayValue")//对应维度的显示值
	private String displayValue;
	
	@Column(name = "priority")//排序
	private Integer priority;
	
	@ManyToOne
	@JoinColumn(name = "dimensionId")//对应维度id
	private Dimension dimension;
	
	@OneToMany(mappedBy="dimensionValue")
	protected List<MultiDataSourceMetric> MultiDataSourceMetrics;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public String getDisplayValue() {
		return displayValue;
	}

	public void setDisplayValue(String displayValue) {
		this.displayValue = displayValue;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Dimension getDimension() {
		return dimension;
	}

	public void setDimension(Dimension dimension) {
		this.dimension = dimension;
	}

	public List<MultiDataSourceMetric> getMultiDataSourceMetrics() {
		return MultiDataSourceMetrics;
	}

	public void setMultiDataSourceMetrics(List<MultiDataSourceMetric> multiDataSourceMetrics) {
		MultiDataSourceMetrics = multiDataSourceMetrics;
	}
	
}
