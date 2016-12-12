package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.forecast.entity.ModelInfo;

public interface ModelInfoService {

	ModelInfo findById(String modelId);

	List<ModelInfo> findAll();

}
