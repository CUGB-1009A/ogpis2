package com.ogpis.forecast.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ogpis.forecast.dao.SelfDataDao;
import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.service.SelfDataService;

@Service
@Transactional
public class SelfDataServiceImpl implements SelfDataService {
	
	@Autowired SelfDataDao selfDataDao;

	@Override
	public void save(List<SelfData> selfDataList) {
		selfDataDao.save(selfDataList);
	}

	@Override
	public void delete(List<SelfData> selfDataList) {
		selfDataDao.delete(selfDataList);
		
	}

}
