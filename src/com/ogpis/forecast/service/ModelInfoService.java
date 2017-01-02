package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ModelInfo;

public interface ModelInfoService {

	ModelInfo findById(String modelId);

	List<ModelInfo> findAll();

	Pagination getAllModel(int cpn, Integer pageSize);

}
