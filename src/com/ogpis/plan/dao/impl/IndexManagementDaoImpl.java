package com.ogpis.plan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.plan.dao.IndexManagementDao;
import com.ogpis.plan.entity.IndexManagement;

@Repository
public class IndexManagementDaoImpl extends HibernateBaseDao<IndexManagement, String> implements IndexManagementDao {


	@Override
	public List<IndexManagement> findAllIndexByPrority(String type) {
		String hql="from IndexManagement m where m.type='"+type+"'order by priority asc";
		List<IndexManagement> items=this.find(hql, type);
		return items;
	}

	@Override
	protected Class<IndexManagement> getEntityClass() {
		return IndexManagement.class;
	}
	
	
}
