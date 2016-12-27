package com.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private PlanDao planDao;
	
	@Override
	public void updateAll(ArrayList<String> idList) {
		planDao.updateAll(idList);
		
	}

	@Override
	public List<Plan> getAllPlans() {
		return planDao.getAllPlans();
	}

	@Override
	public List<Plan> getPlansByType(String type) {
		return planDao.getPlansByType(type);
	}

	@Override
	public List<Plan> findAll(boolean isManager, String type, String condition) {
		return planDao.findAll(isManager, type, condition);
	}

	@Override
	public Plan findById(String id) {
		return planDao.findById(id);
	}

	@Override
	public Plan save(Plan plan) {
		
		return planDao.save(plan);
	}

	@Override
	public Plan update(Plan plan) {
		return planDao.update(plan);
	}
	
}
