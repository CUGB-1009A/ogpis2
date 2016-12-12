package com.ogpis.forecast.entity.base;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.SelfDataCollection;

@MappedSuperclass
public class BaseSelfData extends BaseEntity {
	
	@Column(name = "年份")
	private Integer year;
	
	@Column(name = "历史数据")
	private double data;
	
	@ManyToOne(targetEntity = SelfDataCollection.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_SelfDataCollection_SelfData",joinColumns = @JoinColumn(name = "SelfDataId"),inverseJoinColumns = @JoinColumn(name = "SelfDataCollectionId"))
	protected SelfDataCollection selfDataCollection ;
	
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

	public SelfDataCollection getSelfDataCollection() {
		return selfDataCollection;
	}

	public void setSelfDataCollection(SelfDataCollection selfDataCollection) {
		this.selfDataCollection = selfDataCollection;
	}

}
