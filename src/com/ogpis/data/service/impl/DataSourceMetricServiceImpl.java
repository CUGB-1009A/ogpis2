package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.DataSourceMetricDao;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.service.DataSourceMetricService;
@Service
@Transactional
public class DataSourceMetricServiceImpl implements DataSourceMetricService{
	@Autowired
	private DataSourceMetricDao dataSourceMetricDao;

	@Override
	public void add(DataSourceMetric dataSourceMetric) {
		// TODO Auto-generated method stub
		dataSourceMetricDao.add(dataSourceMetric);
	}
}
