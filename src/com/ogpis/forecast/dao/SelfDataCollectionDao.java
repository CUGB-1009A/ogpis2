package com.ogpis.forecast.dao;

import java.util.List;

import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.entity.SelfDataCollection;

public interface SelfDataCollectionDao {

	List<SelfDataCollection> findOthersShared();

	SelfDataCollection save(SelfDataCollection selfDataCollection);

	SelfDataCollection findById(String id);

	void deleteSelfDataCollection(SelfDataCollection selfDataCollection);

}
