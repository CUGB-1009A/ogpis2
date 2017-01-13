package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.DataSourceDao;
import com.ogpis.data.entity.DataSource;
@Repository
public class DataSourceDaoImpl extends HibernateBaseDao<DataSource, String> implements DataSourceDao{

	@Override
	protected Class<DataSource> getEntityClass() {
		return DataSource.class;
	}

	@Override
	public Pagination getAllDataSource(int cpn, Integer pageSize) {
		Finder f = Finder.create("select bean from DataSource bean where bean.deleted=false");
		return find(f,cpn,pageSize);
	}

	@Override
	public DataSource findById(String id) {
		return super.get(id);
	}
	
}
