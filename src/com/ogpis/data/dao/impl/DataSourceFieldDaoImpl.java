package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DataSourceFieldDao;
import com.ogpis.data.entity.DataSourceField;
@Repository
public class DataSourceFieldDaoImpl extends HibernateBaseDao<DataSourceField, String> implements DataSourceFieldDao{

	@Override
	protected Class<DataSourceField> getEntityClass() {
		// TODO Auto-generated method stub
		return DataSourceField.class;
	}

	@Override
	public void add(DataSourceField dataSourceField) {
		// TODO Auto-generated method stub
		getSession().merge(dataSourceField);
	}

}
