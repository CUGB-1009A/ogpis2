package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseForecastRecord;

@Entity
@Table(name = "ogpis_ForecastRecord")
public class ForecastRecord extends BaseForecastRecord {

}
