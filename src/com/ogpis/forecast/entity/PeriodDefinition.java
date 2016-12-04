package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.forecast.entity.base.BasePeriodDefinition;

@Entity
@Table(name = "ogpis_PeriodDefinition")
public class PeriodDefinition extends BasePeriodDefinition{

}
