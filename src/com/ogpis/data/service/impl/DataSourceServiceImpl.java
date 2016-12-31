package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.DataSourceDao;
import com.ogpis.data.service.DataSourceService;

@Service
@Transactional
public class DataSourceServiceImpl implements DataSourceService{

	@Autowired
	private DataSourceDao dataSourceDao;

	@Override
	public Pagination getAllDataSource(int cpn, Integer pageSize) {
		return dataSourceDao.getAllDataSource(cpn,pageSize);
	}
}
