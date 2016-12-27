package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.forecast.entity.ForecastType;

public interface ForecastTypeDao {

	List<ForecastType> findAll();

}
