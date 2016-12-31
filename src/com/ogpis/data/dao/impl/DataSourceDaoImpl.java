package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DataSourceDao;
import com.ogpis.data.entity.DataSource;
@Repository
public class DataSourceDaoImpl extends HibernateBaseDao<DataSource, String> implements DataSourceDao{

	@Override
	protected Class<DataSource> getEntityClass() {
		return DataSource.class;
	}

}
