package com.ogpis.forecast.entity.base;

import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class BaseForecastRecord extends BaseEntity {

	private String forecastModelClassName;
	
	
}
