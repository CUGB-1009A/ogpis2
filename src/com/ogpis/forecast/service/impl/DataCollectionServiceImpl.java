package com.ogpis.forecast.service.impl;

import java.util.ArrayList;
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
		return dataCollectionDao.findByDataCollectionType(dataCollectionType);
	}

	@Override
	public DataCollection findById(String dataCollectionId) {
		return dataCollectionDao.findById(dataCollectionId);
	}

	@Override
	public List<DataCollection> findOriginData() {
		return dataCollectionDao.findOriginData();
	}

	@Override
	public List<DataCollection> findOthersSharedData(String userId) {
		List<DataCollection> allSharedDataCollections = dataCollectionDao.findAllSharedDataCollection();
		List<DataCollection> othersSharedDataCollections = new ArrayList<DataCollection>();
		for(DataCollection temp:allSharedDataCollections){
			if(!temp.getUser().getId().equals(userId))
				othersSharedDataCollections.add(temp);
		}
		return othersSharedDataCollections;
	}

	@Override
	public DataCollection save(DataCollection dataCollection) {
		return dataCollectionDao.save(dataCollection);
	}

	@Override
	public void delete(DataCollection dataCollection) {
		dataCollectionDao.delete(dataCollection);
		
	}

	@Override
	public List<DataCollection> findMyData(String userId) {
		return dataCollectionDao.findMyData(userId);
	}
}
