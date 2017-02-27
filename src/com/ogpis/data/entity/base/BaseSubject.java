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
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.forecast.entity.ForecastType;

@MappedSuperclass
public class BaseSubject extends BaseEntity{
	
	@Column(name = "name")//专题类型
	private String name;
	
	@Column(name = "priority")//排序
	private Integer priority;
	
	@ManyToMany(targetEntity = InterfaceTable.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_InterfaceTable_Subject",joinColumns = @JoinColumn(name = "Subject_ID"), inverseJoinColumns = @JoinColumn(name = "InterfaceTable_ID"))
	protected List<InterfaceTable> interfaceTables ;
	
	@OneToMany(mappedBy="subject")
	protected List<DataSource> dataSource;
	
	@ManyToMany(targetEntity = ForecastType.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ForecastType_Subject",joinColumns = @JoinColumn(name = "Subject_ID"), inverseJoinColumns = @JoinColumn(name = "ForecastType_ID"))
	protected List<ForecastType> forecastType ;

	public List<ForecastType> getForecastType() {
		return forecastType;
	}

	public void setForecastType(List<ForecastType> forecastType) {
		this.forecastType = forecastType;
	}

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


}
