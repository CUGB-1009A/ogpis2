package com.ogpis.forecast.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.forecast.dao.PeriodDefinitionDao;
import com.ogpis.forecast.dao.SelfDataCollectionDao;
import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.entity.SelfDataCollection;
import com.ogpis.forecast.service.SelfDataCollectionService;

@Service
@Transactional
public class SelfDataCollectionServiceImpl implements SelfDataCollectionService{

	@Autowired SelfDataCollectionDao selfDataCollectionDao;

	@Override
	public List<SelfDataCollection> findOthersShared() {
		// TODO Auto-generated method stub
		return selfDataCollectionDao.findOthersShared();
	}

	@Override
	public SelfDataCollection save(SelfDataCollection selfDataCollection) {
		// TODO Auto-generated method stub
		return selfDataCollectionDao.save(selfDataCollection);
	}

	@Override
	public SelfDataCollection findById(String id) {
		// TODO Auto-generated method stub
		return selfDataCollectionDao.findById(id);
	}

	@Override
	public void deleteSelfDataCollection(SelfDataCollection selfDataCollection) {
		selfDataCollectionDao.deleteSelfDataCollection(selfDataCollection);
		
	}

}
