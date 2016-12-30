package com.ogpis.data.service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.Dimension;

public interface DimensionService {

	Dimension findById(String id);

	Pagination getAllDimension(int cpn, Integer pageSize);

	void save(Dimension dimension);

	void update(Dimension dimension);

}
