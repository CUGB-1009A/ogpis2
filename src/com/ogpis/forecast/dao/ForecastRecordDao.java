package com.ogpis.forecast.dao;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ForecastRecord;

public interface ForecastRecordDao {

	Pagination getRecordByUserId(String userId, int pageNo, Integer pageSize);

	ForecastRecord findById(String id);

	void delete(ForecastRecord forecastRecord);

	void save(ForecastRecord forecastRecord);

}
