package com.ogpis.plan.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.plan.dao.Plan_IndexDao;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;

@Repository
@Transactional
public class Plan_IndexDaoImpl extends HibernateBaseDao<Plan_Index, String> implements Plan_IndexDao  {

	@Override
	public Plan_Index add(Plan plan, IndexManagement index, float targetValue) {
		Plan_Index p_i=new Plan_Index();
		p_i.setPlan(plan);
		p_i.setIndex(index);
		p_i.setTargetValue(targetValue);
		getSession().save(p_i);
		return p_i;
	}

	@Override
	public Plan_Index findByP_I(String planId, String indexId) {
		String hql="from Plan_Index where plan.id=? and index.id=?";
		Plan_Index plan_Index=(Plan_Index) this.find(hql, planId, indexId);
		return plan_Index;
	}

	@Override
	public void batchAdd(Plan plan, List<IndexManagement> indexs) {
		//List<Plan_Index> plan_Indexs =new ArrayList();
		for(IndexManagement index:indexs){
			Plan_Index p_i=new Plan_Index();
			p_i.setPlan(plan);
			p_i.setIndex(index);
			getSession().save(p_i);
		}	
	} 

	@Override
	public List<Plan_Index> findByPlanTypeAndMineType(String planType, String mineType) {
		String hql="from Plan_Index where deleted=false and plan.planType='"+planType+"'and index.mineType='"
				+mineType+"' order by index.indexType";
		List<Plan_Index> items=this.find(hql, null); 
		return items;
	}

	@Override
	protected Class<Plan_Index> getEntityClass() {
		// TODO Auto-generated method stub
		return Plan_Index.class;
	}
	

}
