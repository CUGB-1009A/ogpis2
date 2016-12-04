package com.ogpis.forecast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.forecast.dao.ModelInfoDao;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.service.ModelInfoService;

@Service
@Transactional
public class ModelInfoServiceImpl implements ModelInfoService{

	@Autowired
	private ModelInfoDao modelInfoDao;
	
	@Override
	public ModelInfo findById(String modelId) {
		return modelInfoDao.findById(modelId);
	}

}
