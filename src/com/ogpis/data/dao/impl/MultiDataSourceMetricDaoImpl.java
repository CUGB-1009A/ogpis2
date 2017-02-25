package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.MultiDataSourceMetricDao;
import com.ogpis.data.entity.MultiDataSourceMetric;
@Repository
public class MultiDataSourceMetricDaoImpl extends HibernateBaseDao<MultiDataSourceMetric, String> implements MultiDataSourceMetricDao{

	@Override
	protected Class<MultiDataSourceMetric> getEntityClass() {
		// TODO Auto-generated method stub
		return MultiDataSourceMetric.class;
	}

	@Override
	public void add(MultiDataSourceMetric temp) {
		// TODO Auto-generated method stub
		getSession().merge(temp);
	}

}
