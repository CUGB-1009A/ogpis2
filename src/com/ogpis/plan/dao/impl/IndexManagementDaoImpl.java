package com.ogpis.plan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.util.StringUtils;
import com.ogpis.plan.dao.IndexManagementDao;
import com.ogpis.plan.entity.IndexManagement;

@Repository
@Transactional
public class IndexManagementDaoImpl extends HibernateBaseDao<IndexManagement, String> implements IndexManagementDao {


	@Override
	public List<IndexManagement> findAllIndexByPrority(String type) {
		String hql="from IndexManagement m where m.deleted=false and m.PlanType='"+type+"' order by priority asc";
		List<IndexManagement> items=this.find(hql, null);
		return items;
	}

	@Override
	protected Class<IndexManagement> getEntityClass() {
		return IndexManagement.class;
	}

	@Override
	public IndexManagement save(IndexManagement indexManagement) {
		getSession().save(indexManagement);
		return indexManagement;
	}

	@Override
	public IndexManagement update(IndexManagement indexManagement) {
		getSession().merge(indexManagement);
		return indexManagement;
	}

	@Override
	public IndexManagement findById(String id) {
		IndexManagement indexManagement=get(id);
		return indexManagement;
	}

	@Override
	public List<IndexManagement> findByIds(String[] ids) {
		String hql="from IndexManagement m where m.deleted=false and m.id in("
				+toIdString(ids)+") order by indexType asc";
		List<IndexManagement> items=this.find(hql, null);
		return items;
	}
	
	public static String toIdString(String[] ids){
		StringBuilder sb = new StringBuilder();
		if(ids!=null&&ids.length!=0){
			for (int i = 0; i < ids.length; i++) {
				if(i!=0){
					sb.append(",");
				}else{
					sb.append("'"+ids[i]+"'");
				}
			}
		}
		return sb.toString();
	}

	@Override
	public Pagination getAllIndexs(int pageNo, int pageSize, String planType) {
		String hql="from IndexManagement bean where bean.deleted=false and bean.PlanType='"+
				planType+"' order by priority asc";
		Finder finder=Finder.create(hql);
		return find(finder, pageNo, pageSize);
	}
	
	
}
