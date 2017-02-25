package com.ogpis.data.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.Dimension;

public interface DimensionDao {

	Dimension findById(String id);

	Pagination getAllDimension(int cpn, Integer pageSize);

	void save(Dimension dimension);

	void update(Dimension dimension);

	List<Dimension> getAllDimension();


}
