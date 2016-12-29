package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DimensionDao;
import com.ogpis.data.entity.Dimension;

@Repository
public class DimensionDaoImpl extends HibernateBaseDao<Dimension, String> implements DimensionDao{

	@Override
	protected Class<Dimension> getEntityClass() {
		return Dimension.class;
	}

	@Override
	public Dimension findById(String id) {
		return get(id);
	}

}
