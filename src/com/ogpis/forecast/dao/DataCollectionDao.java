package com.ogpis.forecast.dao;

import java.util.List;
import com.ogpis.forecast.entity.DataCollection;

public interface DataCollectionDao {
	
	public List<DataCollection> findByDataCollectionType(String dataCollectionType);

	public DataCollection findById(String dataCollectionId);

}
