package com.ogpis.data.entity.base;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.Subject;


@MappedSuperclass
public class BaseDimension extends BaseEntity{
	
	@Column(name = "name")//维度名
	private String name;
	
	@Column(name = "priority")//排序
	private Integer priority;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="dimensionId")
	protected List<DimensionValue> dimensionValue ;
	
	@OneToMany(targetEntity = Subject.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_Dimension_Subject",joinColumns = @JoinColumn(name = "Dimension_ID"), inverseJoinColumns = @JoinColumn(name = "Subject_ID"))
	protected List<Subject> subject ;

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
	
	

}
