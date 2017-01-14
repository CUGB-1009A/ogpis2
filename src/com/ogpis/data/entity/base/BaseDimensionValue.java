package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Dimension;

@MappedSuperclass
public class BaseDimensionValue extends BaseEntity{
	
	@Column(name = "value")//对应某个维度的值
	private String value;
	
	@Column(name = "priority")//排序
	private String priority;
	
	@ManyToOne
	@JoinColumn(name = "dimensionId")//对应维度id
	private Dimension dimension;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public Dimension getDimension() {
		return dimension;
	}

	public void setDimension(Dimension dimension) {
		this.dimension = dimension;
	}
}
