package com.ogpis.forecast.service;

import java.util.List;

import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.entity.SelfDataCollection;

public interface SelfDataCollectionService {

	List<SelfDataCollection> findOthersShared();

	SelfDataCollection save(SelfDataCollection selfDataCollection);

	SelfDataCollection findById(String id);

	void deleteSelfDataCollection(SelfDataCollection selfDataCollection);

}
