package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.DimensionDao;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.service.DimensionService;

@Service
@Transactional
public class DimensionServiceImpl implements DimensionService{
	
	@Autowired
	private DimensionDao dimensionDao;

	@Override
	public Dimension findById(String id) {
		return dimensionDao.findById(id);
	}

	@Override
	public Pagination getAllDimension(int cpn, Integer pageSize) {
		return dimensionDao.getAllDimension(cpn,pageSize);
	}

	@Override
	public void save(Dimension dimension) {
		dimensionDao.save(dimension);
	}

	@Override
	public void update(Dimension dimension) {
		dimensionDao.update(dimension);
	}

}
