package com.ogpis.forecast.service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ForecastRecord;

public interface ForecastRecordService {

	Pagination getRecordByUserId(String userId, int cpn, Integer pageSize);

	ForecastRecord findById(String id);

	void delete(ForecastRecord forecastRecord);

	void save(ForecastRecord forecastRecord);

}
