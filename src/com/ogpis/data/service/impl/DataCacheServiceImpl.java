package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.DataCacheDao;
import com.ogpis.data.service.DataCacheService;

@Service
@Transactional
public class DataCacheServiceImpl implements DataCacheService{
	
	@Autowired
	private DataCacheDao dataCacheDao;

}
