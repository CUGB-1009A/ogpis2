package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.SelfDataCollectionDao;
import com.ogpis.forecast.entity.PeriodDefinition;
import com.ogpis.forecast.entity.SelfDataCollection;

@Repository
public class SelfDataCollectionDaoImpl extends HibernateBaseDao<SelfDataCollection, String> implements SelfDataCollectionDao{

	@Override
	protected Class<SelfDataCollection> getEntityClass() {
		return SelfDataCollection.class;
	}

	@Override
	public List<SelfDataCollection> findOthersShared() {
		String userId = "1";
		String hql = "From SelfDataCollection where deleted=false and shared=true and User_Id!='"+userId+"'";
		@SuppressWarnings("unchecked")
		List<SelfDataCollection> selfDataCollection = this.find(hql,null);
		return selfDataCollection;

	}

	@Override
	public SelfDataCollection save(SelfDataCollection selfDataCollection) {

		getSession().merge(selfDataCollection);
		return selfDataCollection;
	}

	@Override
	public SelfDataCollection findById(String id) {
		
		SelfDataCollection entity = get(id);
		return entity;
	}

	@Override
	public void deleteSelfDataCollection(SelfDataCollection selfDataCollection) {
		selfDataCollection.setUser(null);
		getSession().merge(selfDataCollection);
		getSession().delete(super.get(selfDataCollection.getId()));
		
	}
}
