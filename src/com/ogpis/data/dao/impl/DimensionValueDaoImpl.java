package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DimensionValueDao;
import com.ogpis.data.entity.DimensionValue;

@Repository
public class DimensionValueDaoImpl extends HibernateBaseDao<DimensionValue, String> implements DimensionValueDao{

	@Override
	protected Class<DimensionValue> getEntityClass() {
		return DimensionValue.class;
	}

}
