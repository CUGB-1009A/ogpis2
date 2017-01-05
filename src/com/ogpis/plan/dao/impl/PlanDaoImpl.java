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
		@SuppressWarnings("unchecked")
		String hql="from Plan where deleted=false order by createTime desc";
		List<Plan> items =this.find(hql, null);
		return items;
	}

	@Override
	public List<Plan> getPlansByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Plan> findAll(boolean isManager, String type, String condition) {
		String hql="";
		//管理员用户
		if(isManager){
			if(condition==""){
				hql="from Plan where deleted=false order by released,ReleaseDate desc";
			}else{
				hql="from Plan where deleted=false and(PlanName like '%"+condition+"%' or PlanCode like '%"+
						condition+"%' or ReleaseUnit like '%"+condition+"%')order by released,ReleaseDate desc";
			}
		}
		//普通用户
		else{
			if(condition==""){
				hql="from Plan where deleted=false and released=true and PlanType='"+type+"' order by ReleaseDate desc";
			}else{
				hql="from Plan where deleted=false and released=true and PlanType='"+type+"' (PlanName like '%"+
						condition+"%' or PlanCode like '%"+condition+"%' or ReleaseUnit like '%"+condition+"%')"
								+ "order by ReleaseDate desc";
			}
		}
		
		List<Plan> items=this.find(hql, null);
		return items;
	}

	@Override
	protected Class<Plan> getEntityClass() {
		return Plan.class;
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
