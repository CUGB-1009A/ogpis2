package com.ogpis.plan.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;

public interface PlanDao {
	void updateAll(ArrayList<String> idList);
	List<Plan> getAllPlans();
	List<Plan> getPlansByType(String type);
	List<Plan> findAll(boolean isManager,String type,String condition);
	Plan findById(String id);
	Plan save(Plan plan);
	Plan update(Plan plan);
}
