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

	@Override
	public List<DataCollection> findOriginData() {
		String hql = "From DataCollection where deleted=false and isOrigin=true";
		@SuppressWarnings("unchecked")
		List<DataCollection> dataCollectionList = this.find(hql, null);
		return dataCollectionList;
	}

	@Override
	public List<DataCollection> findAllSharedDataCollection() {
		String hql = "From DataCollection where deleted=false and isOrigin=false and isShared=true";
		@SuppressWarnings("unchecked")
		List<DataCollection> dataCollectionList = this.find(hql, null);
		return dataCollectionList;
	}

	@Override
	public DataCollection save(DataCollection dataCollection) {
		getSession().merge(dataCollection);
		return dataCollection;
	}

	@Override
	public void delete(DataCollection dataCollection) {
		DataCollection temp = super.get(dataCollection.getId());
		temp.setUser(null);
		getSession().merge(temp);
		getSession().delete(super.get(dataCollection.getId()));
	}

	@Override
	public List<DataCollection> findMyData(String userId) {
		String hql = "From DataCollection d where d.deleted=false and d.user.id='"+userId+"'";
		@SuppressWarnings("unchecked")
		List<DataCollection> dataCollectionList = this.find(hql, null);
		return dataCollectionList;
	}

}
