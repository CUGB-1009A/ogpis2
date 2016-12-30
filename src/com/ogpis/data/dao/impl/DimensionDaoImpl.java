package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
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

	@Override
	public Pagination getAllDimension(int cpn, Integer pageSize) {
		Finder f = Finder.create("select bean from Dimension bean where bean.deleted=false");
		return find(f,cpn,pageSize);
	}

	@Override
	public void save(Dimension dimension) {
		getSession().merge(dimension);
	}

	@Override
	public void update(Dimension dimension) {
		getSession().merge(dimension);
		getSession().delete(super.get(dimension.getId()));
	}

}
