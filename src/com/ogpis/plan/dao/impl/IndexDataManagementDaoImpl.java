package com.ogpis.plan.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.plan.dao.IndexDataManagementDao;
import com.ogpis.plan.entity.IndexDataManagement;

@Repository
@Transactional
public class IndexDataManagementDaoImpl extends HibernateBaseDao<IndexDataManagement, String> implements IndexDataManagementDao {

	@Override
	public List<IndexDataManagement> findByIndexId(String indexId) {
		String hql="from IndexDataManagement where deleted=false and index.id='"+indexId+"' order by collectedTime asc";
		@SuppressWarnings("unchecked")
		List<IndexDataManagement> items=this.find(hql,null);
		return items;
	}

	@Override
	public List<IndexDataManagement> findByIndexId(String id, Date startTime, Date endTime) {
		String hql="from IndexDataManagement where deleted=false and index.id='"+id+"' and collectedTime between '"+startTime+"' and'"+endTime+"' order by collectedTime asc";
		@SuppressWarnings("unchecked")
		List<IndexDataManagement> items=this.find(hql,null);
		return items;
	}

	@Override
	public List<IndexDataManagement> findHistoryData(String id, Date startTime, int i) {
		String hql="from IndexDataManagement where deleted=false and index.id='"+id+"' and collectedTime <'"+startTime+"' order by collectedTime desc";
		@SuppressWarnings("unchecked")
		List<IndexDataManagement> items=this.find(hql,null);
		if(items.size()<i)
			return items;
		else
			return items.subList(0, i);
	}

	@Override
	protected Class<IndexDataManagement> getEntityClass() {
		return IndexDataManagement.class;
	}

	@Override
	public IndexDataManagement save(IndexDataManagement indexDataManagement) {
		getSession().save(indexDataManagement);
		return indexDataManagement;
	}

	@Override
	public IndexDataManagement update(IndexDataManagement indexDataManagement) {
		getSession().merge(indexDataManagement);
		return indexDataManagement;
	}

	
}
