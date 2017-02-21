package com.ogpis.forecast.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class BasePeriodDefinition extends BaseEntity {
	
	@Column(name = "periodName")//长、中、短期
	private String periodName;
	
	@Column(name = "periodInterval")
	private int periodInterval ;

	public String getPeriodName() {
		return periodName;
	}

	public void setPeriodName(String periodName) {
		this.periodName = periodName;
	}

	public int getPeriodInterval() {
		return periodInterval;
	}

	public void setPeriodInterval(int periodInterval) {
		this.periodInterval = periodInterval;
	}
	
	

}
