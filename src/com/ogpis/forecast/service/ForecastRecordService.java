package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ForecastRecord;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface ForecastRecordService {

	Pagination getRecordByUserId(String userId, boolean finished,int cpn, Integer pageSize);

	ForecastRecord findById(String id);

	void delete(ForecastRecord forecastRecord);

	void save(ForecastRecord forecastRecord);

	List<ForecastRecord> findByName(String name);

	JSONArray getHistoryData(String sql);

}
