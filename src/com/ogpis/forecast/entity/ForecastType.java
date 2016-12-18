package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.forecast.entity.base.BaseForecastType;

@Entity
@Table(name = "ogpis_ForecastType")
public class ForecastType extends BaseForecastType{

}
