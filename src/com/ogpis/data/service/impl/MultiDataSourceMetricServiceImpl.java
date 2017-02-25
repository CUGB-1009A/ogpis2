package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.MultiDataSourceMetricDao;
import com.ogpis.data.entity.MultiDataSourceMetric;
import com.ogpis.data.service.MultiDataSourceMetricService;
@Service
@Transactional
public class MultiDataSourceMetricServiceImpl implements MultiDataSourceMetricService{
	@Autowired
	private MultiDataSourceMetricDao multiDataSourceMetricDao;

	@Override
	public void add(MultiDataSourceMetric temp) {
		// TODO Auto-generated method stub
		multiDataSourceMetricDao.add(temp);
	}
}
