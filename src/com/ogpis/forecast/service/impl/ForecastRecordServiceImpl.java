package com.ogpis.forecast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.dao.ForecastRecordDao;
import com.ogpis.forecast.entity.ForecastRecord;
import com.ogpis.forecast.service.ForecastRecordService;

@Service
@Transactional
public class ForecastRecordServiceImpl implements ForecastRecordService{

	@Autowired
	private ForecastRecordDao forecastRecordDao;

	@Override
	public Pagination getRecordByUserId(String userId, boolean finished,int pageNo, Integer pageSize) {
		return forecastRecordDao.getRecordByUserId(userId,finished,pageNo,pageSize);
	}

	@Override
	public ForecastRecord findById(String id) {
		return forecastRecordDao.findById(id);
	}

	@Override
	public void delete(ForecastRecord forecastRecord) {
		forecastRecordDao.delete(forecastRecord);
	}

	@Override
	public void save(ForecastRecord forecastRecord) {
		forecastRecordDao.save(forecastRecord);
		
	}
}
