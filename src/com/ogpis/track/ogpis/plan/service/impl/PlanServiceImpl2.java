package com.ogpis.track.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.document.entity.PlanDocument2;
import com.ogpis.track.ogpis.plan.dao.PlanDao2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.service.PlanService2;

@Service
public class PlanServiceImpl2 extends BaseServiceImpl<Plan2, String> 
		implements PlanService2{
	
	@Autowired
	protected void setPlanDao(PlanDao2 PlanDao) {
		setBaseDao(PlanDao);
	}

	protected PlanDao2 getPlanDao() {
		return (PlanDao2) this.baseDao;
	}

	@Override
	public IPageList<Plan2> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition) {
		
		return getPlanDao().getPlans(isManager,pageNo,pageSize,type,condition);
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		
		getPlanDao().updateAll(idList);
		
	}

	@Override
	public List<Plan2> getAllPlans() {
		
		return getPlanDao().getAllPlans();
	}

	@Override
	public List<Plan2> getPlansByType(String type) {
		
		return getPlanDao().getPlansByType(type);
	}

	@Override
	public List<Plan2> findAll(boolean isManager, String type, String condition) {
		// TODO Auto-generated method stub
		return getPlanDao().findAll(isManager,type,condition);
	}
}
