package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.forecast.entity.PeriodDefinition;

public interface PeriodDefinitionDao {

	List<PeriodDefinition> findAll();
}
