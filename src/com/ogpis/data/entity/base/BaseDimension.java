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
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.Subject;


@MappedSuperclass
public class BaseDimension extends BaseEntity{
	
	@Column(name = "isYear")//是否为年份
	private boolean isYear;
	
	@Column(name = "name")//维度名
	private String name;
	
	@Column(name = "priority")//排序
	private Integer priority;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="dimension")
	protected List<DimensionValue> dimensionValue ;
	
	@ManyToMany(targetEntity = Subject.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_Dimension_Subject",joinColumns = @JoinColumn(name = "Dimension_ID"), inverseJoinColumns = @JoinColumn(name = "Subject_ID"))
	protected List<Subject> subject ;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="dimension")
	protected List<Field> field ;
	
	public boolean isYear() {
		return isYear;
	}

	public void setYear(boolean isYear) {
		this.isYear = isYear;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public List<DimensionValue> getDimensionValue() {
		return this.dimensionValue;
	}

	public void setDimensionValue(List<DimensionValue> dimensionValue) {
		this.dimensionValue = dimensionValue;
	}

	public List<Subject> getSubject() {
		return this.subject;
	}

	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}

	public List<Field> getField() {
		return field;
	}

	public void setField(List<Field> field) {
		this.field = field;
	}

}
