package com.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.sql.Update;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.dao.PlanDocumentDao;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.PlanDocument;

@Repository
@Transactional
public class PlanDocumentDaoImpl extends HibernateBaseDao<PlanDocument, String> implements PlanDocumentDao  {

	@Override
	protected Class<PlanDocument> getEntityClass() {
		return PlanDocument.class;
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		String temp="";
		for(int i=0;i<idList.size();i++){
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		
		String hql="update PlanDocument as m set m.deleted=true,m.plan=null where m.id in ("+temp+")";
		//Updater u=Updater
		
		
	}

	@Override
	public Pagination getPlanDocuments(int pageNo, int pageSize) {
		String hql="select bean from PlanDocument bean where bean.deleted=false order by createTime desc";
		Finder f=Finder.create(hql);
		return this.find(f, pageNo, pageSize);
	}

	@Override
	public Pagination getDeletedDocuments(int pageNo, int pageSize) {
		String hql="select bean from PlanDocument bean where bean.deleted=true order by createTime desc";
		Finder f=Finder.create(hql);
		return this.find(f, pageNo, pageSize);
	}

	@Override
	public void removeAllDocument(ArrayList<String> idList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pagination getDocumentsByPlan(String selectCondition, String inputValue, String selectValue, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pagination getDocumentsByPlan(String condition, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pagination getOnePlanDocument(int pageNo, int pageSize, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlanDocument> findByIds(ArrayList idList) {
		String temp="";
		for(int i=0;i<idList.size();i++){
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql="select * from PlanDocument m where m.id in ("+temp+")";
		return this.find(hql, null);
	}

	@Override
	public PlanDocument save(PlanDocument planDocument) {
		getSession().save(planDocument);
		return planDocument;
	}

	@Override
	public PlanDocument update(PlanDocument planDocument) {
		getSession().merge(planDocument);
		return planDocument;
	}

	
}
