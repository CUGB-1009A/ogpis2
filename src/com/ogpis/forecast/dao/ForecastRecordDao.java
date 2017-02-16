package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ForecastRecord;

public interface ForecastRecordDao {

	Pagination getRecordByUserId(String userId, boolean finished,int pageNo, Integer pageSize);

	ForecastRecord findById(String id);

	void delete(ForecastRecord forecastRecord);

	void save(ForecastRecord forecastRecord);

	List<ForecastRecord> findByName(String name);

}
