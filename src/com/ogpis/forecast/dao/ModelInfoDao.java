package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.forecast.entity.ModelInfo;

public interface ModelInfoDao {

	ModelInfo findById(String modelId);

	List<ModelInfo> findAll();

}
