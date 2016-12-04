package com.ogpis.forecast.dao;

import com.ogpis.forecast.entity.ModelInfo;

public interface ModelInfoDao {

	ModelInfo findById(String modelId);

}
