package com.ogpis.forecast.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.forecast.dao.DataCollectionDao;
import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.service.DataCollectionService;

@Service
@Transactional
public class DataCollectionServiceImpl implements DataCollectionService{

	
	@Autowired
	private DataCollectionDao dataCollectionDao;
	
	@Override
	public List<DataCollection> findByDataCollectionType(String dataCollectionType) {
		// TODO Auto-generated method stub
		return dataCollectionDao.findByDataCollectionType(dataCollectionType);
	}

	@Override
	public DataCollection findById(String dataCollectionId) {
		// TODO Auto-generated method stub
		return dataCollectionDao.findById(dataCollectionId);
	}


}
