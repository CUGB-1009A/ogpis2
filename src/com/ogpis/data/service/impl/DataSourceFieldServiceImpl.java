package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.DataSourceFieldDao;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.service.DataSourceFieldService;
@Service
@Transactional
public class DataSourceFieldServiceImpl implements DataSourceFieldService{
	@Autowired
	private DataSourceFieldDao dataSourceFieldDao;

	@Override
	public void add(DataSourceField dataSourceField) {
		// TODO Auto-generated method stub
		dataSourceFieldDao.add(dataSourceField);
	}
}
