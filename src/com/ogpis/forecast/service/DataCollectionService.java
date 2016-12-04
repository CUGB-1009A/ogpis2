package com.ogpis.forecast.service;

import java.util.List;
import com.ogpis.forecast.entity.DataCollection;

public interface DataCollectionService {
	public List<DataCollection> findByDataCollectionType(String dataCollectionType);

	public DataCollection findById(String dataCollectionId);

}
