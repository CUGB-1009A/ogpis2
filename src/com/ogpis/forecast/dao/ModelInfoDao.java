package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.entity.ModelInfo;

public interface ModelInfoDao {

	ModelInfo findById(String modelId);

	List<ModelInfo> findAll();

	Pagination getAllModel(int cpn, Integer pageSize);

}
