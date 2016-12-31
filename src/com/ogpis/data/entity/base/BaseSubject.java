package com.ogpis.data.entity.base;

import java.util.Collections;
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
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.InterfaceTable;

@MappedSuperclass
public class BaseSubject extends BaseEntity{
	
	@Column(name = "name")//专题类型
	private String name;
	
	@Column(name = "priority")//排序
	private Integer priority;
	
	@ManyToMany(targetEntity = Dimension.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_Dimension_Subject",joinColumns = @JoinColumn(name = "Subject_ID"), inverseJoinColumns = @JoinColumn(name = "Dimension_ID"))
	protected List<Dimension> dimension ;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="subject")
	protected List<InterfaceTable> interfaceTables ;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="subject")
	protected List<DataSource> dataSource;

	public List<DataSource> getDataSource() {
		return dataSource;
	}

	public void setDataSource(List<DataSource> dataSource) {
		this.dataSource = dataSource;
	}

	public List<InterfaceTable> getInterfaceTables() {
		return interfaceTables;
	}

	public void setInterfaceTables(List<InterfaceTable> interfaceTables) {
		this.interfaceTables = interfaceTables;
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

	public List<Dimension> getDimension() {
		return this.dimension;
	}

	public void setDimension(List<Dimension> dimension) {
		this.dimension = dimension;
	}
}
