package com.ogpis.demo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.demo.dao.DemoDao;
import com.ogpis.demo.entity.Demo;

@Repository
public class DemoDaoImpl extends HibernateBaseDao<Demo, String> implements
		DemoDao {

	@Override
	public Demo save(Demo demo) {
		getSession().save(demo);
		return demo;
	}
	
	@Override
	public Demo deleteById(String id) {
		Demo entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}

	@Override
	public Demo findById(String id) {
		Demo entity = get(id);
		return entity;
	}
	
	@Override
	protected Class<Demo> getEntityClass() {
		return Demo.class;
	}

}
