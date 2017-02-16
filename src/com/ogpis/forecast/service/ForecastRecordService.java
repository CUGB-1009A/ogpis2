package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ForecastRecord;

public interface ForecastRecordService {

	Pagination getRecordByUserId(String userId, boolean finished,int cpn, Integer pageSize);

	ForecastRecord findById(String id);

	void delete(ForecastRecord forecastRecord);

	void save(ForecastRecord forecastRecord);

	List<ForecastRecord> findByName(String name);

}
