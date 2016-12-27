package com.ogpis.forecast.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.forecast.dao.PeriodDefinitionDao;
import com.ogpis.forecast.entity.PeriodDefinition;
import com.ogpis.forecast.service.PeriodDefinitionService;

@Service
@Transactional
public class PeriodDefinitionServiceImpl implements PeriodDefinitionService {

	@Autowired PeriodDefinitionDao periodDefinitionDao;
	@Override
	public List<PeriodDefinition> findAll() {
		// TODO Auto-generated method stub
		return periodDefinitionDao.findAll();
	}

}
