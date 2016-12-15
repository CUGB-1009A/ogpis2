package com.ogpis.plan.service;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.plan.entity.Plan;


public interface PlanService  {
	
	void updateAll(ArrayList<String> idList);
	List<Plan> getAllPlans();
	List<Plan> getPlansByType(String type);
	List<Plan> findAll(boolean isManager,String type,String condition);
	Plan findById(String id);
	Plan save(Plan plan);
	Plan update(Plan plan);
}
