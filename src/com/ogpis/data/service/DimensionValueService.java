package com.ogpis.data.service;

import java.util.List;

import com.ogpis.data.entity.DimensionValue;

public interface DimensionValueService {

	void save(DimensionValue dimensionValue);

	void delete(List<DimensionValue> dimensionValuesOld);

}
