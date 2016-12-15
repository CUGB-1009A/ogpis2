package com.ogpis.forecast.dao;

import java.util.List;
import com.ogpis.forecast.entity.DataCollection;

public interface DataCollectionDao {
	
	public List<DataCollection> findByDataCollectionType(String dataCollectionType);

	public DataCollection findById(String dataCollectionId);

	public List<DataCollection> findOriginData();

	public List<DataCollection> findAllSharedDataCollection();

	public DataCollection save(DataCollection dataCollection);

	public void delete(DataCollection dataCollection);

	public List<DataCollection> findMyData(String userId);

}
