package com.ogpis.forecast.service;

import java.util.List;
import com.ogpis.forecast.entity.DataCollection;

public interface DataCollectionService {
	public List<DataCollection> findByDataCollectionType(String dataCollectionType);

	public DataCollection findById(String dataCollectionId);

	public List<DataCollection> findOriginData();

	public List<DataCollection> findOthersSharedData(String userId);//查找他人（非userId）共享的数据集

	public DataCollection save(DataCollection dataCollection);

	public void delete(DataCollection dataCollection);

	public List<DataCollection> findMyData(String userId);

	public List<DataCollection> findAll();


}
