package com.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.entity.Plan;

@Repository
@Transactional
public class PlanDaoImpl extends HibernateBaseDao<Plan, String> implements PlanDao  {

	@Override
	public void updateAll(ArrayList<String> idList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Plan> getAllPlans() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Plan> getPlansByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Plan> findAll(boolean isManager, String type, String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<Plan> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Plan findById(String id){
		return this.get(id);
	}

	@Override
	public Plan save(Plan plan) {
		getSession().save(plan);
		return plan;
	}

	@Override
	public Plan update(Plan plan) {
		getSession().merge(plan);
		return plan;
	}

}
