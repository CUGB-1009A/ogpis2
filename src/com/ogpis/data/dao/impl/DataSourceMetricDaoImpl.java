package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DataSourceMetricDao;
import com.ogpis.data.entity.DataSourceMetric;
@Repository
public class DataSourceMetricDaoImpl extends HibernateBaseDao<DataSourceMetric,String> implements DataSourceMetricDao{

	@Override
	protected Class<DataSourceMetric> getEntityClass() {
		// TODO Auto-generated method stub
		return DataSourceMetric.class;
	}

	@Override
	public void add(DataSourceMetric dataSourceMetric) {
		// TODO Auto-generated method stub
		getSession().merge(dataSourceMetric);
	}

}
