package com.ogpis.forecast.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ogpis.forecast.dao.ForecastTypeDao;
import com.ogpis.forecast.entity.ForecastType;
import com.ogpis.forecast.service.ForecastTypeService;

@Service
@Transactional
public class ForecastTypeServiceImpl implements ForecastTypeService{
	
	@Autowired ForecastTypeDao forecastTypeDao;

	@Override
	public List<ForecastType> findAll() {
		return forecastTypeDao.findAll();
	}

}
