package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.forecast.entity.SelfData;

public interface SelfDataService {

	void save(List<SelfData> selfDataList);

	void delete(List<SelfData> selfDataList);

}
