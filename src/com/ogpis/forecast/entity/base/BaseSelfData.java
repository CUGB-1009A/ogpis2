package com.ogpis.forecast.entity.base;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.DataCollection;


@MappedSuperclass
public class BaseSelfData extends BaseEntity {
	
	@Column(name = "年份")
	private Integer year;
	
	@Column(name = "历史数据")
	private double data;
	
	@ManyToOne(targetEntity = DataCollection.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataCollection_SelfData",joinColumns = @JoinColumn(name = "SelfData_ID"),inverseJoinColumns = @JoinColumn(name = "DataCollection_ID"))
	protected DataCollection dataCollection ;
	
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public double getData() {
		return data;
	}

	public void setData(double data) {
		this.data = data;
	}

	public DataCollection getDataCollection() {
		return dataCollection;
	}

	public void setDataCollection(DataCollection dataCollection) {
		this.dataCollection = dataCollection;
	}
}
