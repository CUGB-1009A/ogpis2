package com.ogpis.track.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.plan.dao.PlanDao;
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.plan.service.PlanService;

@Service
public class PlanServiceImpl extends BaseServiceImpl<Plan, String> 
		implements PlanService{
	
	@Autowired
	protected void setPlanDao(PlanDao PlanDao) {
		setBaseDao(PlanDao);
	}

	protected PlanDao getPlanDao() {
		return (PlanDao) this.baseDao;
	}

	@Override
	public IPageList<Plan> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition) {
		
		return getPlanDao().getPlans(isManager,pageNo,pageSize,type,condition);
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		
		getPlanDao().updateAll(idList);
		
	}

	@Override
	public List<Plan> getAllPlans() {
		
		return getPlanDao().getAllPlans();
	}

	@Override
	public List<Plan> getPlansByType(String type) {
		
		return getPlanDao().getPlansByType(type);
	}

	@Override
	public List<Plan> findAll(boolean isManager, String type, String condition) {
		// TODO Auto-generated method stub
		return getPlanDao().findAll(isManager,type,condition);
	}
}
