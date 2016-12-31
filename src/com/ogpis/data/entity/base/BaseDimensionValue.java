package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Dimension;

@MappedSuperclass
public class BaseDimensionValue extends BaseEntity{
	
	@Column(name = "value")//维度值
	private String value;
	
	@Column(name = "priority")//排序
	private Integer priority;
	
	@ManyToOne
	@JoinColumn(name = "dimensionId")//对应维度id
	private Dimension dimension;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
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
}
