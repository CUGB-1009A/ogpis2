package com.ogpis.data.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.DimensionValueDao;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.service.DimensionValueService;

@Service
@Transactional
public class DimensionValueServiceImpl implements DimensionValueService{
	
	@Autowired 
	private DimensionValueDao dimensionValueDao;

	@Override
	public void save(DimensionValue dimensionValue) {
		dimensionValueDao.save(dimensionValue);
	}

	@Override
	public void delete(List<DimensionValue> dimensionValuesOld) {
		dimensionValueDao.delete(dimensionValuesOld);
	}

	@Override

	public DimensionValue findById(String id) {
		return dimensionValueDao.findById(id);
	}

	public List<DimensionValue> getByDimensionId(String dimensionId) {
		// TODO Auto-generated method stub
		return dimensionValueDao.getByDimensionId(dimensionId);
	}

	@Override
	public DimensionValue getById(String dimensionValueId) {
		// TODO Auto-generated method stub
		return dimensionValueDao.getById(dimensionValueId);

	}
	

}
