package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Field;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.FieldDao;

@Repository
public class FieldDaoImpl extends HibernateBaseDao<Field, String> implements FieldDao{

	@Override
	protected Class<Field> getEntityClass() {
		return Field.class;
	}

}
