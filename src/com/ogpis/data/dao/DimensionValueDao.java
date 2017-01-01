package com.ogpis.data.dao;

import java.util.List;

import com.ogpis.data.entity.DimensionValue;

public interface DimensionValueDao {

	void save(DimensionValue dimensionValue);

	void delete(List<DimensionValue> dimensionValuesOld);

}
