package com.ogpis.forecast.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.DataCollectionDao;
import com.ogpis.forecast.entity.DataCollection;

@Repository
public class DataCollectionDaoImpl extends HibernateBaseDao<DataCollection, String> implements DataCollectionDao{
	

	@Override
	public List<DataCollection> findByDataCollectionType(String dataCollectionType) {
		String hql = "From DataCollection where deleted=false and dataCollectionType='"+dataCollectionType +"'";
		@SuppressWarnings("unchecked")
		List<DataCollection> dataCollectionList = this.find(hql, null);
		return dataCollectionList;
	}

	@Override
	protected Class<DataCollection> getEntityClass() {
		return DataCollection.class;
	}

	@Override
	public DataCollection findById(String dataCollectionId) {
		DataCollection entity = get(dataCollectionId);
		return entity;
	}

}
