package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.forecast.entity.SelfData;

public interface SelfDataDao {

	void save(List<SelfData> selfDataList);

	void delete(List<SelfData> selfDataList);

}
